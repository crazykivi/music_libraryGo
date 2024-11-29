# Задание на вакансию Junior GO Developer и его решение (не реализован метод изменения данных песни)
## Задание: Необходимо реализовать следующее
# 1. Выставить rest методы
- Получение данных библиотеки с фильтрацией по всем полям и пагинацией
- Получение текста песни с пагинацией по куплетам
- Удаление песни
- Изменение данных песни
- Добавление новой песни в формате
JSON
{
 "group": "Muse",
 "song": "Supermassive Black Hole"
}
# 2. При добавлении сделать запрос в АПИ, описанного сваггером. Апи, описанный сваггером, будет поднят при проверке тестового задания. Реализовывать его отдельно не нужно
openapi: 3.0.3
info:
  title: Music info
  version: 0.0.1
paths:
  /info:
    get:
      parameters:
        - name: group
          in: query
          required: true
          schema:
            type: string
        - name: song
          in: query
          required: true
          schema:
            type: string
      responses:
        '200':
          description: Ok
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/SongDetail'
        '400':
          description: Bad request
        '500':
          description: Internal server error
components:
  schemas:
    SongDetail:
      required:
        - releaseDate
        - text
        - link
      type: object
      properties:
        releaseDate:
          type: string
          example: 16.07.2006
        text:
          type: string
          example: Ooh baby, don't you know I suffer?\nOoh baby, can you hear me moan?\nYou caught me under false pretenses\nHow long before you let me go?\n\nOoh\nYou set my soul alight\nOoh\nYou set my soul alight
        link:
          type: string
          example: https://www.youtube.com/watch?v=Xsp3_a-PMTw

# 3. Обогащенную информацию положить в БД postgres (структура БД должна быть создана путем миграций при старте сервиса)
# 4. Покрыть код debug- и info-логами
# 5. Вынести конфигурационные данные в .env-файл
# 6. Сгенерировать сваггер на реализованное АПИ

## Задание выполнено с помощью сервиса LastFM. Ключ API и ссылки находятся в .env файле
### Структура .env файла:
#### - DATABASE_URL=postgres://user:password@localhost:5432/music_librarywith?sslmode=disable
Подключение к бд PosrgreSQL
#### - API_BASE_URL=https://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=8301c7ec514ad333e208da049b938a9a&artist={artist}&track={track}&format=json
API, откуда берётся инфорамация о композициях
#### - LASTFM_API_KEY=8301c7ec514ad333e208da049b938a9a
Ключ для доступа к LastFM API (данный ключ будет удален через 3 недели)

# Запуск:
## 1. Требуется импортировать бд music_librarywith_dump.sql в базу данных "music_librarywith"
## 2. Требуется открыть терминал, перейти в папку с проектом и прописать команду: go run main.go
## При успешном запуске:
- C:\GoLangProjects\library>go run main.go
- 2024/11/27 12:28:56 Loading environment variables from .env file...
- 2024/11/27 12:28:56 Connecting to database with DSN: postgres://postgres:112233@localhost:5432/music_librarywith?sslmode=disable
- 2024/11/27 12:28:56 Successfully connected to the database.
- 2024/11/27 12:28:56 Running database migrations...
- 2024/11/27 12:28:56 Database migration completed successfully.
- [GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.
- [GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

- [GIN-debug] GET    /songs                    --> music-library/controller.GetSongs (3 handlers)
- [GIN-debug] POST   /songs                    --> music-library/controller.CreateSong (3 handlers)
- [GIN-debug] DELETE /songs/:id                --> music-library/controller.DeleteSong (3 handlers)
- [GIN-debug] GET    /swagger.json             --> main.main.func1 (3 handlers)
- [GIN-debug] [WARNING] You trusted all proxies, this is NOT safe. We recommend you to set a value.
- Please check https://pkg.go.dev/github.com/gin-gonic/gin#readme-don-t-trust-all-proxies for details.
- [GIN-debug] Listening and serving HTTP on :8080
- [GIN] 2024/11/27 - 12:28:58 |←[97;42m 200 ←[0m|     40.1053ms |             ::1 |←[97;44m GET     ←[0m "/swagger.json"
## Для http запросов я использовал Postman.
### Пример запроса:
GET http://localhost:8080/songs
### Ответ:
[
    {
        "id": 6,
        "createdAt": "2024-11-27T11:23:02.8483+03:00",
        "updatedAt": "2024-11-27T11:23:02.8483+03:00",
        "deletedAt": "",
        "group": "Muse",
        "song": "Supermassive Black Hole",
        "releaseDate": "29 May 2008, 13:21",
        "text": "\"Supermassive Black Hole\" is the first single from Black Holes and Revelations, released on 19 June 2006. Its B-side is Crying Shame. The song has been available online since 9 May following a radio premiere the previous day. The single reached #4 in the UK Singles Chart, making it the highest charting single by the band to date. The track was mixed at Townhouse Studios, London. It was released as the third U.S. single on April 23, 2007.\n\nInfluences\n\nThe song showcases the album's experimentation with other genres. \"It's the most different to anything we've ever done,\" Matthew Bellamy told French magazine Rock Mag on 3 March 2006, \"We've had some Belgian influences: Millionaire, dEUS, Evil Superstars, Soulwax... These groups were the first to mix R&B rhythms with alternative guitar. We've added a bit of Prince and Kanye West. The drumbeat isn't rocky, with Rage Against the Machine riffs underneath. We’ve mixed a lot of things in this track, with a bit of electronica; it’s different, slow, quite funky.\"\n\nSpeaking about the album with NME, Bellamy said, \"I was going out dancing in clubs around New York. That helped create tracks like \"Supermassive Black Hole\". Franz Ferdinand would have done it very well, with that dance type beat going on mixed with alternative guitar and I've always wanted to find that.\"\n\nThe different style has met mixed reactions, and resulted in numerous comparisons, often tongue-in-cheek, of the main riff to those of Cameo's 1986 single Word Up! and Britney Spears' 2004 Do Somethin'.\n\nMusic video\n\nThe single's accompanying promotional video shows the band playing in a small furniture shop, clad in masks. This is intercut with images of dancers in Zentai suits which are then unzipped at the end to reveal beings made of space. The video was shot by Floria Sigismondi, who is also known for directing music videos for bands such as Marilyn Manson, The White Stripes, Interpol and The Cure.\n\nRemixes and covers\n\nThe \"Phones Control Voltage mix\" of the song was released as the B-side on the vinyl single of Starlight. On the game FIFA 07 there was also an alternative version of the song, which features slightly different guitar and vocals to the original.\n\nThe song was covered by English Progressive metal band Threshold on the limited edition digipak of their 2007 album Dead Reckoning.\n\nChart performance\n\nThe song has been one of their most successful. It gave them their highest singles chart entry, selling 24,104 in its first week (downloads and physical). In total it has sold over 85,000 and was the 84th best selling song of 2006 in the UK.\n\nThe song went for adds on US radio at the end of April 2007. Its early supporters were S021 (Sirius Satellite Radio), KITS (San Francisco), and WFNX (Boston). By mid-May, many stations, including WBTZ (Burlington, Vermont), KJEE (Santa Barbara), S021, and WFNX, were supporting it. The song reached #6 on the US Modern Rock Tracks chart, making it the second highest charting Muse single in the US behind \"Starlight\". By early June, it was supported by 41 US alternative rock stations and also grew to receive major support from WEQX (Albany, New York) and WHTG (Monmouth/Ocean, New Jersey). By late July, support for the song had spread to 63 US alternative rock stations, with this number rising to 72 by mid-August.\n\nThis song was made available as downloadable content for Guitar Hero 3. This song was featured in the 2008 movie, 'Twilight' based on the books by Stephanie Meyer. It is also available on the widely popular soundtrack for that movie. <a href=\"http://www.last.fm/music/Muse/_/Supermassive+Black+Hole\">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.",
        "link": "https://www.last.fm/music/Muse/_/Supermassive+Black+Hole"
    },
    {
        "id": 7,
        "createdAt": "2024-11-27T11:23:47.248048+03:00",
        "updatedAt": "2024-11-27T11:23:47.248048+03:00",
        "deletedAt": "",
        "group": "Gorillaz",
        "song": "Feel Good Inc.",
        "releaseDate": "17 Mar 2009, 18:22",
        "text": "\"Feel Good Inc.\" is a song by British virtual band Gorillaz, featuring American hip-hop group De La Soul. The song was released as the lead single from the band's second studio album \"Demon Days\" on 9 May 2005. The single peaked at No. 2 in the United Kingdom and Europe, and No. 14 in the United States. \"Feel Good Inc.\" made the US Billboard year-end top songs chart in 2005 and 2006. It also topped Billboard's Alternative Songs chart in the U.S. for eight consecutive weeks, a first for the band. This is the only song in Damon Albarn's career to reach the top 40 on the Billboard Hot 100. It peaked in the top 10 in 17 countries, reaching No. 1 in Spain and Greece. It surpassed \"Clint Eastwood\" to become Gorillaz's most successful single worldwide. \"Feel Good Inc.\" has been certified platinum in Australia and double-platinum in the United Kingdom.\n\nThe song was listed in Pitchfork Media and Rolling Stone's Best Songs of the 2000s. It was nominated for three Grammys at the 2006 Grammy Awards, including Record of the Year, but winning for Best Pop Collaboration. Popdose ranked it 26th on their list of 100 best songs of the decade.\n\nMusic video\nThe main themes of the video are intellectual freedom and the media's dumbing down of mass culture.\n\nAt the beginning of the video, the camera rises up to the top of the Feel Good Inc. tower, and a sample of the Spacemonkeyz dub of \"Clint Eastwood\", entitled \"A Fistful of Peanuts\", can be heard. The camera focuses into the tower, where 2-D yearns for the freedom to join Noodle on her floating island. The characters lying on the floor represent those who have already been \"dumbed down\", while the band members are the ones who have awakened. 2-D is trying to wake all the people from their half-dead state by yelling at them through his megaphone, in the style of a political activist. The floating island is chased by ominous helicopters, which closely resemble Korean War era Bell H-13s, monitoring the behaviour inside and ensuring that no one escapes. It is unclear whether they are preventing Noodle's escape or are chasing her away. Back in the tower, De La Soul appear as larger-than life, seemingly omnipotent images on surrounding television screens, laughing at the Gorillaz band members. Their taunting drives 2-D into a wild, hypnotic frenzy as he tries to resist the urge to be dumbed down. At the end of the video, 2-D, beaten by his surroundings, returns to the state he was in when the video began, repeating the words \"Feel good\" until the video finally ends, in an exact reversal of the intro. The repetition of \"Feel good\" represents that 2-D is convincing himself that everything is OK (as if he is brainwashing himself to believe it), instead of facing the harsh truth of the situation. The music video for \"El Mañana\" is a continuation of this video, depicting two helicopter gunships catching up to Noodle's floating windmill island and attacking it.\n\nJamie Hewlett said in an interview that the inspiration for some scenes in the video came from Hayao Miyazaki; specifically, the windmill-powered landmass, which has been compared to that of Miyazaki's \"Castle in the Sky\".\n\nUsage in media\nThe track was included in the respective soundtracks of SingStar Pop, Dance Dance Revolution Hottest Party 3, DJ Hero, Guitar Hero 5, Fantasia: Music Evolved, Grand Theft Auto V, and Watch Dogs: Legion; the single has also been included as downloadable content for the soundtracks of Rock Band and SingStar. Additionally, the track was utilized in one of Apple's \"silhouette style\" iPod television advertisements. <a href=\"http://www.last.fm/music/Gorillaz/_/Feel+Good+Inc.\">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.",
        "link": "https://www.last.fm/music/Gorillaz/_/Feel+Good+Inc."
    }
]
