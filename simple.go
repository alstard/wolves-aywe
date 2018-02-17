package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/wolves", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "aywe")
	})

	log.Fatal(http.ListenAndServe(":8888", nil))

}
