# curlmyip - What is my IP address? / curlmyip - Какой у меня IP-адрес?

Simple public service to get your external IP, User-Agent, language, headers, current Unix time and **geo location** (city, country, coordinates, timezone, ASN).  
Простой публичный сервис для получения внешнего IP-адреса, User-Agent, языка, заголовков, текущего времени Unix и **геоданных** (город, страна, координаты, часовой пояс, ASN).

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
- **New!** Get detailed geo location information for your IP (`/geo`) – city, country, coordinates, time zone, autonomous system, etc.
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
| `/geo`     | Geo location data for your IP (JSON) | `{"ip":"91.23.25.9","city":{...},"country":{...},...}` |

### Quick command-line examples (using `curl`)

```
curl curlmyip.ru       # IP with newline
curl curlmyip.ru/ip    # IP without newline
curl curlmyip.ru/ua    # Show your User-Agent
curl curlmyip.ru/time  # Get current Unix time
curl curlmyip.ru/geo   # Get geo location (JSON)
```

### Programmatic usage

Full examples for various programming languages (Bash, Python, Node.js, PHP, Go, Ruby, Delphi) are available in the [`examples/`](examples/) directory.  
Each example shows how to fetch IP, User-Agent, and geo data.

---

## Русский

### Возможности

- Получение внешнего IPv4/IPv6-адреса (`/ip` – без завершающего переноса строки)
- Получение заголовка `User-Agent`, отправляемого вашим клиентом (`/ua`)
- Просмотр языковых предпочтений (`Accept-Language`) (`/lang`)
- Получение текущей метки времени Unix с сервера (`/time`)
- Просмотр всех HTTP-заголовков, которые отправляет ваш клиент, в формате JSON (`/headers`)
- **Новое!** Получение подробной геолокации для вашего IP (`/geo`) – город, страна, координаты, часовой пояс, автономная система и др.
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
| `/geo`    | Геоданные для вашего IP в JSON | `{"ip":"91.23.25.9","city":{...},"country":{...},...}` |

### Быстрые примеры через командную строку (`curl`)

```
curl curlmyip.ru       # IP с переводом строки
curl curlmyip.ru/ip    # IP без перевода строки
curl curlmyip.ru/ua    # Показать ваш User-Agent
curl curlmyip.ru/time  # Показать текущий Unix timestamp
curl curlmyip.ru/geo   # Получить геоданные (JSON)
```

### Использование в программах

Полные примеры для различных языков программирования (Bash, Python, Node.js, PHP, Go, Ruby, Delphi) доступны в папке [`examples/`](examples/).  
Каждый пример показывает, как получить IP, User-Agent и геоданные.