package services

import (
	"crypto/tls"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"time"
)

type SongDetail struct {
	ReleaseDate string `json:"releaseDate"`
	Text        string `json:"text"`
	Link        string `json:"link"`
}

func GetSongDetails(group, song string) (*SongDetail, error) {
	apiKey := os.Getenv("LASTFM_API_KEY")
	if apiKey == "" {
		return nil, fmt.Errorf("API ключ не установлен")
	}

	group = url.QueryEscape(group)
	song = url.QueryEscape(song)

	requestURL := fmt.Sprintf("https://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=%s&artist=%s&track=%s&format=json", apiKey, group, song)

	fmt.Println("Request URL:", requestURL)

	transport := &http.Transport{
		TLSClientConfig: &tls.Config{
			MinVersion: tls.VersionTLS12,
		},
	}

	client := &http.Client{
		Timeout:   10 * time.Second,
		Transport: transport,
	}

	resp, err := client.Get(requestURL)
	if err != nil {
		return nil, fmt.Errorf("ошибка при запросе: %v", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("не удалось получить данные, статус код: %d", resp.StatusCode)
	}

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, fmt.Errorf("ошибка при чтении тела ответа: %v", err)
	}

	fmt.Println("API Response Body:", string(body))

	var apiResponse struct {
		Track struct {
			Name string `json:"name"`
			URL  string `json:"url"`
			Wiki struct {
				Published string `json:"published"`
				Content   string `json:"content"`
			} `json:"wiki"`
		} `json:"track"`
	}

	if err := json.Unmarshal(body, &apiResponse); err != nil {
		return nil, fmt.Errorf("ошибка при декодировании ответа: %v", err)
	}

	if apiResponse.Track.Name == "" {
		return nil, fmt.Errorf("песня не найдена")
	}

	details := &SongDetail{
		ReleaseDate: apiResponse.Track.Wiki.Published,
		Text:        apiResponse.Track.Wiki.Content,
		Link:        apiResponse.Track.URL,
	}

	return details, nil
}
