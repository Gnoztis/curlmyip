#!/usr/bin/env python3
import requests
import json

resp = requests.get("https://curlmyip.ru/geo", timeout=5)
data = resp.json()
print(json.dumps(data, indent=2, ensure_ascii=False))