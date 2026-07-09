#!/usr/bin/env ruby
require 'net/http'
require 'json'

uri = URI('https://curlmyip.ru/geo')
response = Net::HTTP.get(uri)
data = JSON.parse(response)
puts JSON.pretty_generate(data)