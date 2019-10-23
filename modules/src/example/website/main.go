package main // import "example.com/website"

import (
	"math/rand"
	"net/http"

	"example.com/services/authorizer"
	"github.com/gin-gonic/gin"
)

func main() {
	auth := authorizer.New()
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, "Welcome")
	})

	r.GET("/user/:name", func(c *gin.Context) {
		u := authorizer.User{ID: rand.Intn(100), Name: c.Param("name")}
		if !auth.Authorize(u) {
			c.JSON(http.StatusUnauthorized, gin.H{"user": u, "status": "unauthorized"})
			return
		}

		c.JSON(http.StatusOK, gin.H{"user": u, "status": "authorized"})
	})

	r.Run() // listen and serve on 0.0.0.0:8080
}
