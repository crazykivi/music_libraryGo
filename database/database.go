package database

import (
	"log"
	"os"

	"music-library/models"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	"github.com/joho/godotenv"
)

var DB *gorm.DB

func InitDB() {
	log.Println("Loading environment variables from .env file...")
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file:", err)
	}

	dsn := os.Getenv("DATABASE_URL")

	log.Printf("Connecting to database with DSN: %s\n", dsn)
	db, err := gorm.Open("postgres", dsn)
	if err != nil {
		log.Fatal("Failed to connect to database:", err)
	}
	log.Println("Successfully connected to the database.")

	DB = db

	log.Println("Running database migrations...")
	if err := DB.AutoMigrate(&models.Song{}).Error; err != nil {
		log.Fatal("Failed to migrate database:", err)
	}
	log.Println("Database migration completed successfully.")
}

func CloseDB() {
	log.Println("Closing database connection...")
	if err := DB.Close(); err != nil {
		log.Fatal("Failed to close database:", err)
	}
	log.Println("Database connection closed successfully.")
}
