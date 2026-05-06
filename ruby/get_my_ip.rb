#!/usr/bin/env ruby
# get_my_ip.rb - Fetch external IP and headers from curlmyip.ru

require 'net/http'
require 'json'

BASE_URL = 'http://curlmyip.ru'

def fetch_from_curlmyip(endpoint)
  uri = URI("#{BASE_URL}#{endpoint}")
  response = Net::HTTP.get_response(uri)
  if response.is_a?(Net::HTTPSuccess)
    response.body.strip
  else
    puts "HTTP error: #{response.code} #{response.message}"
    nil
  end
rescue StandardError => e
  puts "Network error: #{e.message}"
  nil
end

# Fetch IP address
ip = fetch_from_curlmyip('/ip')
puts "Your IP address: #{ip}" if ip

# Fetch User-Agent
ua = fetch_from_curlmyip('/ua')
puts "Your User-Agent: #{ua}" if ua

# Fetch and display headers
headers_json = fetch_from_curlmyip('/headers')
if headers_json
  headers = JSON.parse(headers_json)
  puts "Headers sent by you:"
  headers.each { |key, value| puts "  #{key}: #{value}" }
end