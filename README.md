# Выполненное задание на вакансию Junior GO Developer
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

## Задание выполнено с помощью сервиса LastFM. Ключ API находится в .env файле (в проекте отсутствует)
### Структура .env файла:
- DATABASE_URL=postgres://user:password@localhost:5432/music_librarywith?sslmode=disable
Подключение к бд PosrgreSQL
- API_BASE_URL=https://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=8301c7ec514ad333e208da049b938a9a&artist={artist}&track={track}&format=json
API, откуда берётся инфорамация о композициях
- LASTFM_API_KEY=
Ключ для доступа к LastFM API