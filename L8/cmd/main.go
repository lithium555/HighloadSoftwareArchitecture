package main

import (
	"log"

	"example.com/m/v2/L8/app"
)

func main() {
	if err := app.Run(); err != nil {
		log.Fatalf("Run(). Error: '%v'", err)
	}
}
