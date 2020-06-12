// +build !prod

// go run -ldflags "-X main.Debug=true"

package main

import (
	"buildtags/handler"
	"example.com/sdk"
)

func main() {
	debug("hello from dev")
	sdk.Start(handler.Handle)
}
