// getmyip.go - Fetch external IP and headers from curlmyip.ru
package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"time"
)

const baseURL = "http://curlmyip.ru"

func main() {
	client := http.Client{Timeout: 5 * time.Second}

	// Fetch IP address
	resp, err := client.Get(baseURL + "/ip")
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error getting IP: %v\n", err)
		return
	}
	defer resp.Body.Close()
	body, _ := io.ReadAll(resp.Body)
	fmt.Printf("Your IP address: %s", body)

	// Fetch and pretty-print headers
	headersResp, err := client.Get(baseURL + "/headers")
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error getting headers: %v\n", err)
		return
	}
	defer headersResp.Body.Close()
	headersBody, _ := io.ReadAll(headersResp.Body)

	var headers map[string]interface{}
	if err := json.Unmarshal(headersBody, &headers); err == nil {
		fmt.Println("Headers sent by you:")
		prettyJSON, _ := json.MarshalIndent(headers, "", "  ")
		fmt.Println(string(prettyJSON))
	} else {
		fmt.Printf("Headers raw response: %s\n", headersBody)
	}
}