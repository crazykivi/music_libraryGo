package api

import (
	controllers "music-library/controller"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(r *gin.Engine) {
	r.GET("/songs", controllers.GetSongs)
	r.POST("/songs", controllers.CreateSong)
	r.DELETE("/songs/:id", controllers.DeleteSong)
}
