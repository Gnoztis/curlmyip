# curlmyip - What is my IP address? / curlmyip - Какой у меня IP-адрес?

Simple public service to get your external IP, User-Agent, language, headers and current Unix time.  
Простой публичный сервис для получения внешнего IP-адреса, User-Agent, языка, заголовков и текущего времени Unix.

> **Source code & self-hosting** | **Исходный код и самостоятельный хостинг**  
> [https://github.com/Gnoztis/curlmyip](https://github.com/Gnoztis/curlmyip)

> **Usage examples & detailed guide** | **Примеры использования и подробное руководство**  
> [https://1275.ru/articles/curlmyip-ru-sluzhba-opredeleniya-vneshnego-ip_9902](https://1275.ru/articles/curlmyip-ru-sluzhba-opredeleniya-vneshnego-ip_9902)

---

## English

### Features

- Get your public IPv4/IPv6 address (`/ip` – without trailing newline)
- Retrieve the `User-Agent` header sent by your client (`/ua`)
- See your `Accept-Language` preferences (`/lang`)
- Obtain the current Unix timestamp from the server (`/time`)
- Inspect all HTTP headers your client sends in JSON format (`/headers`)
- Works over both HTTP and HTTPS
- No registration, no API keys, no limits (fair use)

### Endpoints

| Endpoint   | Description | Example response |
|------------|-------------|------------------|
| `/`        | IP address with trailing newline | `91.23.25.9\n` |
| `/ip`      | IP address without newline | `91.23.25.9` |
| `/ua`      | Client’s User-Agent string | `curl/8.4.0` |
| `/lang`    | `Accept-Language` header value | `ru,en-US;q=0.7,en;q=0.3` |
| `/time`    | Server time as Unix timestamp | `1741594272` |
| `/headers` | All incoming headers (JSON) | `{"host":"curlmyip.ru","user-agent":"curl/8.4.0",...}` |

### Quick command-line examples

```bash
curl curlmyip.ru       # IP with newline
curl curlmyip.ru/ip    # IP without newline
curl curlmyip.ru/ua    # Show your User-Agent
curl curlmyip.ru/time  # Get current Unix time
```

### Usage in scripts

#### Bash (`get_my_ip.sh`)
```bash
#!/bin/bash
BASE_URL="http://curlmyip.ru"
MY_IP=$(curl -s "${BASE_URL}/ip")
echo "Your IP: ${MY_IP}"
MY_UA=$(curl -s "${BASE_URL}/ua")
echo "Your User-Agent: ${MY_UA}"
```

#### Python (`get_my_ip.py`)
```python
import requests
BASE_URL = "http://curlmyip.ru"
def get_text(endpoint):
    resp = requests.get(f"{BASE_URL}{endpoint}", timeout=5)
    return resp.text.strip()
print("Your IP:", get_text("/ip"))
print("Your User-Agent:", get_text("/ua"))
```

#### Node.js (`getMyIp.js`)
```javascript
const axios = require('axios');
const BASE_URL = 'http://curlmyip.ru';
(async () => {
    const { data: ip } = await axios.get(`${BASE_URL}/ip`);
    console.log(`Your IP: ${ip}`);
    const { data: ua } = await axios.get(`${BASE_URL}/ua`);
    console.log(`Your User-Agent: ${ua}`);
})();
```

#### PHP (`get_my_ip.php`)
```php
<?php
$base = "http://curlmyip.ru";
echo "Your IP: " . trim(file_get_contents("$base/ip")) . PHP_EOL;
echo "Your UA: " . trim(file_get_contents("$base/ua")) . PHP_EOL;
```

#### Go (`getmyip.go`)
```go
package main
import (
    "fmt"
    "io"
    "net/http"
)
const baseURL = "http://curlmyip.ru"
func main() {
    resp, _ := http.Get(baseURL + "/ip")
    body, _ := io.ReadAll(resp.Body)
    resp.Body.Close()
    fmt.Printf("Your IP: %s", body)
}
```

#### Ruby (`get_my_ip.rb`)
```ruby
require 'net/http'
BASE_URL = 'http://curlmyip.ru'
puts "Your IP: #{Net::HTTP.get(URI("#{BASE_URL}/ip")).strip}"
puts "Your UA: #{Net::HTTP.get(URI("#{BASE_URL}/ua")).strip}"
```

---

## Русский

### Возможности

- Получение внешнего IPv4/IPv6-адреса (`/ip` – без завершающего переноса строки)
- Получение заголовка `User-Agent`, отправляемого вашим клиентом (`/ua`)
- Просмотр языковых предпочтений (`Accept-Language`) (`/lang`)
- Получение текущей метки времени Unix с сервера (`/time`)
- Просмотр всех HTTP-заголовков, которые отправляет ваш клиент, в формате JSON (`/headers`)
- Поддержка HTTP и HTTPS
- Без регистрации, без API-ключей, без ограничений (при разумном использовании)

### Эндпоинты

| Эндпоинт  | Описание | Пример ответа |
|-----------|----------|----------------|
| `/`       | IP-адрес с символом перевода строки | `91.23.25.9\n` |
| `/ip`     | IP-адрес без перевода строки | `91.23.25.9` |
| `/ua`     | Строка User-Agent клиента | `curl/8.4.0` |
| `/lang`   | Значение заголовка `Accept-Language` | `ru,en-US;q=0.7,en;q=0.3` |
| `/time`   | Время сервера в формате Unix timestamp | `1741594272` |
| `/headers`| Все входящие заголовки в JSON | `{"host":"curlmyip.ru","user-agent":"curl/8.4.0",...}` |

### Быстрые примеры через командную строку

```bash
curl curlmyip.ru       # IP с переводом строки
curl curlmyip.ru/ip    # IP без перевода строки
curl curlmyip.ru/ua    # Показать ваш User-Agent
curl curlmyip.ru/time  # Показать текущий Unix timestamp
```

### Использование в скриптах

#### Bash (`get_my_ip.sh`)
```bash
#!/bin/bash
BASE_URL="http://curlmyip.ru"
MY_IP=$(curl -s "${BASE_URL}/ip")
echo "Ваш IP: ${MY_IP}"
MY_UA=$(curl -s "${BASE_URL}/ua")
echo "Ваш User-Agent: ${MY_UA}"
```

#### Python (`get_my_ip.py`)
```python
import requests
BASE_URL = "http://curlmyip.ru"
def get_text(endpoint):
    resp = requests.get(f"{BASE_URL}{endpoint}", timeout=5)
    return resp.text.strip()
print("Ваш IP:", get_text("/ip"))
print("Ваш User-Agent:", get_text("/ua"))
```

#### Node.js (`getMyIp.js`)
```javascript
const axios = require('axios');
const BASE_URL = 'http://curlmyip.ru';
(async () => {
    const { data: ip } = await axios.get(`${BASE_URL}/ip`);
    console.log(`Ваш IP: ${ip}`);
    const { data: ua } = await axios.get(`${BASE_URL}/ua`);
    console.log(`Ваш User-Agent: ${ua}`);
})();
```

#### PHP (`get_my_ip.php`)
```php
<?php
$base = "http://curlmyip.ru";
echo "Ваш IP: " . trim(file_get_contents("$base/ip")) . PHP_EOL;
echo "Ваш UA: " . trim(file_get_contents("$base/ua")) . PHP_EOL;
```

#### Go (`getmyip.go`)
```go
package main
import (
    "fmt"
    "io"
    "net/http"
)
const baseURL = "http://curlmyip.ru"
func main() {
    resp, _ := http.Get(baseURL + "/ip")
    body, _ := io.ReadAll(resp.Body)
    resp.Body.Close()
    fmt.Printf("Ваш IP: %s", body)
}
```

#### Ruby (`get_my_ip.rb`)
```ruby
require 'net/http'
BASE_URL = 'http://curlmyip.ru'
puts "Ваш IP: #{Net::HTTP.get(URI("#{BASE_URL}/ip")).strip}"
puts "Ваш UA: #{Net::HTTP.get(URI("#{BASE_URL}/ua")).strip}"
```