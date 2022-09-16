package main

import (
    "net/http"
    "github.com/gin-gonic/gin"
)

type echo struct {
	Message string `json:"message"`
}

func postEcho(c *gin.Context) {
	var echoMessage echo
	
	if err := c.BindJSON(&echoMessage); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"err":"Something went wrong.", "code":400})
		return
    }

	c.JSON(http.StatusCreated, echoMessage)
}

func main() {
	router := gin.Default()
	router.POST("/echo", postEcho)

	router.Run(":8000")
}