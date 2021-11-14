#!/bin/bash

out=$(curl curlmyip.ru 2>&1 | egrep "([0-9]{1,3}\.){3}" )
echo "IP: $out"
