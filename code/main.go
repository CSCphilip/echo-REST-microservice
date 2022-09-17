package main

import (
    "net/http"
    "github.com/gin-gonic/gin"
)

type echo struct {
	Message string `json:"message" binding:"required"`
}

func postEcho(c *gin.Context) {
	var echoMessage echo

	if err := c.BindJSON(&echoMessage); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"err":"Invalid format", "code":400})
		return
    }

	c.JSON(http.StatusCreated, echoMessage)
}

func main() {
	gin.SetMode(gin.ReleaseMode)
	
	router := gin.Default()
	router.POST("/echo", postEcho)

	router.Run(":8000")
}