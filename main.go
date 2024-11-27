package main

import (
	"fmt"
	"log"

	"music-library/api"
	"music-library/database"

	"github.com/gin-gonic/gin"

	_ "music-library/docs"
)

// @title Music Library API
// @version 1.0
// @description This is a simple API for managing a music library.
// @termsOfService http://swagger.io/terms/
// @contact.name Nikita Redko
// @contact.email nik.ita-redko@yandex.ru
// @license.name MIT
// @license.url https://opensource.org/licenses/MIT

func main() {
	database.InitDB()
	defer database.CloseDB()

	r := gin.Default()

	api.RegisterRoutes(r)

	r.GET("/swagger.json", func(c *gin.Context) {
		c.File("./docs/swagger.json")
	})

	err := r.Run(":8080")
	if err != nil {
		log.Fatal(fmt.Sprintf("Failed to start server: %v", err))
	}
}
