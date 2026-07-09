<?php
$json = file_get_contents("https://curlmyip.ru/geo");
echo json_encode(json_decode($json, true), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";