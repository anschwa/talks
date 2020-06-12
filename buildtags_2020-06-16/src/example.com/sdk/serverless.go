package sdk

import (
	"log"
)

func Start(handler func()) {
	log.Println("Starting function...")

	handler() // Run server-less function
	log.Println("Done.")
}
