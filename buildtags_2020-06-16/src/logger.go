package main

import "fmt"

var Debug string

func debug(args ...interface{}) {
	if Debug == "true" {
		fmt.Printf("[DEBUG] ")
		fmt.Println(args...)
	}
}
