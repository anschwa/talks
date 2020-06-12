// +build prod

package main

import (
	"buildtags/handler"
	"example.com/sdk"
)

func main() {
	debug("hello from prod")
	sdk.Start(handler.Handle)
}
