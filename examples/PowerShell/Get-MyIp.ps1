# Get-MyIp.ps1 - Fetch external IP from curlmyip.ru
$baseUrl = "http://curlmyip.ru"

# Get IP address
$ip = (Invoke-WebRequest -Uri "$baseUrl/ip").Content.Trim()
Write-Host "Your IP address: $ip"

# Get User-Agent
$ua = (Invoke-WebRequest -Uri "$baseUrl/ua").Content.Trim()
Write-Host "Your User-Agent: $ua"

# Get and display headers
$headersResponse = Invoke-WebRequest -Uri "$baseUrl/headers" | ConvertFrom-Json
Write-Host "Headers sent by you:"
$headersResponse.PSObject.Properties | ForEach-Object {
    Write-Host "  $($_.Name): $($_.Value)"
}