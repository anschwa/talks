package main

import (
	"strconv"

	auth "example.com/services/authorizer"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/user/:id", func(c *gin.Context) {
		ID, _ := strconv.Atoi(c.Param("id"))
		user, ok := getUser(ID)
		if !ok {
			c.AbortWithStatus(404)
			return
		}

		c.JSON(200, gin.H{
			"id":              user.ID,
			"subscription":    user.Subscription,
			"secret_question": user.SecretQuestion(),
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}

func getUser(ID int) (auth.AuthUser, bool) {
	if ID == 42 {
		return auth.AuthUser{ID: 42, Subscription: "life"}, true
	}

	return auth.AuthUser{}, false
}
