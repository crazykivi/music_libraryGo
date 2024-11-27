package controllers

import (
	"log"
	"net/http"

	"music-library/database"
	"music-library/models"
	"music-library/services"

	"github.com/gin-gonic/gin"
)

type SongDetail struct {
	ReleaseDate string `json:"releaseDate"`
	Text        string `json:"text"`
	Link        string `json:"link"`
}

// @Summary Get all songs
// @Description Get all songs from the database with optional filters and pagination
// @Tags Songs
// @Accept json
// @Produce json
// @Param group query string false "Filter by group"
// @Param song query string false "Filter by song"
// @Param skip query int false "Number of records to skip" default(0)
// @Param limit query int false "Number of records to return" default(10)
// @Success 200 {array} models.Song
// @Failure 400 {object} models.ErrorResponse
// @Failure 500 {object} models.ErrorResponse
// @Router /songs [get]
func GetSongs(c *gin.Context) {
	var songs []models.Song
	offset := c.DefaultQuery("skip", "0")
	limit := c.DefaultQuery("limit", "10")

	if err := database.DB.Offset(offset).Limit(limit).Find(&songs).Error; err != nil {
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Error fetching songs"})
		return
	}

	c.JSON(http.StatusOK, songs)
}

// @Summary Add a new song
// @Description Add a new song to the library, enriched with details from an external API
// @Tags Songs
// @Accept json
// @Produce json
// @Param song body models.Song true "Song details"
// @Success 201 {object} models.Song
// @Failure 400 {object} models.ErrorResponse
// @Failure 500 {object} models.ErrorResponse
// @Router /songs [post]
func CreateSong(c *gin.Context) {
	log.Println("Received request to create a new song.")

	var newSong models.Song

	if err := c.ShouldBindJSON(&newSong); err != nil {
		log.Printf("Error binding JSON: %v", err)
		c.JSON(http.StatusBadRequest, models.ErrorResponse{Error: "Invalid input"})
		return
	}

	log.Printf("Incoming song data: Group = %s, Song = %s", newSong.Group, newSong.Song)

	details, err := services.GetSongDetails(newSong.Group, newSong.Song)
	if err != nil {
		log.Printf("Error getting song details from external API: %v", err)
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Failed to fetch song details"})
		return
	}

	log.Printf("API response: %v", details)

	if details.Text == "" {
		log.Println("Warning: Song text is empty, assigning default value.")
		details.Text = "No description available."
	}

	if details.ReleaseDate == "" {
		log.Println("Warning: Release date is empty, assigning default value.")
		details.ReleaseDate = "Unknown"
	}

	if details.Link == "" {
		log.Println("Warning: Link is empty, assigning default value.")
		details.Link = "No link available."
	}

	textToLog := details.Text
	if len(details.Text) > 50 {
		textToLog = details.Text[:50]
	}

	log.Printf("Fetched details for song: %s - ReleaseDate: %s, Text: %s, Link: %s", newSong.Song, details.ReleaseDate, textToLog, details.Link)

	newSong.ReleaseDate = details.ReleaseDate
	newSong.Text = details.Text
	newSong.Link = details.Link

	if err := database.DB.Create(&newSong).Error; err != nil {
		log.Printf("Error saving song to database: %v", err)
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Error saving song"})
		return
	}

	log.Printf("Song created successfully: %v", newSong)
	c.JSON(http.StatusCreated, newSong)
}

// @Summary Delete a song
// @Description Delete a song by its ID
// @Tags Songs
// @Param id path string true "Song ID"
// @Success 200 {object} models.Song
// @Failure 404 {object} models.ErrorResponse
// @Failure 500 {object} models.ErrorResponse
// @Router /songs/{id} [delete]
func DeleteSong(c *gin.Context) {
	id := c.Param("id")

	var song models.Song
	if err := database.DB.Where("id = ?", id).First(&song).Error; err != nil {
		c.JSON(http.StatusNotFound, models.ErrorResponse{Error: "Song not found"})
		return
	}

	if err := database.DB.Delete(&song).Error; err != nil {
		c.JSON(http.StatusInternalServerError, models.ErrorResponse{Error: "Error deleting song"})
		return
	}

	c.JSON(http.StatusOK, models.ErrorResponse{Error: "Song deleted"})
}
