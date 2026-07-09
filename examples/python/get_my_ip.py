#!/usr/bin/env python3
# get_my_ip.py - Fetch external IP and more from curlmyip.ru

import requests
import json

BASE_URL = "http://curlmyip.ru"

def fetch_from_curlmyip(endpoint):
    """Generic function to fetch data from curlmyip.ru."""
    try:
        response = requests.get(f"{BASE_URL}{endpoint}", timeout=5)
        response.raise_for_status()
        return response.text.strip()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {endpoint}: {e}")
        return None

# Get IP address
ip = fetch_from_curlmyip("/ip")
if ip:
    print(f"Your IP address: {ip}")

# Get User-Agent
ua = fetch_from_curlmyip("/ua")
if ua:
    print(f"Your User-Agent: {ua}")

# Get and pretty-print all headers
try:
    headers_resp = requests.get(f"{BASE_URL}/headers", timeout=5)
    headers_resp.raise_for_status()
    headers = headers_resp.json()
    print("Headers sent by you:")
    print(json.dumps(headers, indent=2, ensure_ascii=False))
except Exception as e:
    print(f"Could not retrieve headers: {e}")