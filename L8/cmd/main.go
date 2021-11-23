package main

import (
	"log"

	"HighloadSoftwareArchitecture/L8/app"
)

func main() {
	if err := app.Run(); err != nil {
		log.Fatalf("Run(). Error: '%v'", err)
	}
}
