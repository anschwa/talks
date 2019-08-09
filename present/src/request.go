package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	resp, _ := http.Get("http://example.com/") // HLexample
	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Printf("%s\n", body)
}
