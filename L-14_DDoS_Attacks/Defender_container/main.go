package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/api/", DoHealthCheck).Methods(http.MethodGet)
	log.Fatal(http.ListenAndServe(":8080", router))
}
func DoHealthCheck(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, i'm a golang microservice")
	w.WriteHeader(http.StatusAccepted) //RETURN HTTP CODE 202
}

// curl http://localhost:8084/api/  -->> Hello, i'm a golang microservices
