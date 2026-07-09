#!/bin/bash
# get_my_ip.sh - Fetch IP address and other info from curlmyip.ru

# Base URL for the service
BASE_URL="http://curlmyip.ru"

# Fetch IP address without trailing newline
MY_IP=$(curl -s "${BASE_URL}/ip")
echo "Your IP address: ${MY_IP}"

# Fetch User-Agent
MY_UA=$(curl -s "${BASE_URL}/ua")
echo "Your User-Agent: ${MY_UA}"

# Fetch current Unix time
SERVER_TIME=$(curl -s "${BASE_URL}/time")
echo "Server Unix timestamp: ${SERVER_TIME}"

# Fetch all headers as JSON
HEADERS_JSON=$(curl -s "${BASE_URL}/headers")
echo "Headers sent by you:"
echo "${HEADERS_JSON}" | python3 -m json.tool 2>/dev/null || echo "${HEADERS_JSON}"