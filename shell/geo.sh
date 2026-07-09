#!/bin/bash
# Get geo data from curlmyip.ru
curl -s https://curlmyip.ru/geo | jq . 2>/dev/null || curl -s https://curlmyip.ru/geo