package handler

import (
	"fmt"
	"time"
)

func Handle() {
	for i := 0; i < 5; i += 1 {
		time.Sleep(500 * time.Millisecond)
		fmt.Println(i)
	}
}
