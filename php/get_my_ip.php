#!/usr/bin/env php
<?php
// get_my_ip.php - Fetch external IP and other information from curlmyip.ru

$base_url = "http://curlmyip.ru";

// Fetch IP address
$ip = file_get_contents("$base_url/ip");
if ($ip !== false) {
    echo "Your IP address: " . trim($ip) . PHP_EOL;
} else {
    echo "Failed to get IP address." . PHP_EOL;
}

// Fetch User-Agent
$ua = file_get_contents("$base_url/ua");
if ($ua !== false) {
    echo "Your User-Agent: " . trim($ua) . PHP_EOL;
}

// Fetch and display headers (JSON)
$headers = file_get_contents("$base_url/headers");
if ($headers !== false) {
    $decoded = json_decode($headers, true);
    if ($decoded) {
        echo "Headers sent by you:" . PHP_EOL;
        foreach ($decoded as $key => $value) {
            echo "  $key: $value" . PHP_EOL;
        }
    } else {
        echo "Raw headers response: $headers" . PHP_EOL;
    }
}
?>