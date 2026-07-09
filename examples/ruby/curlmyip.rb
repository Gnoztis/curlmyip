require "net/http"

ip = Net::HTTP.get(URI("https://curlmyip.ru"))
puts "Public IP Address is: " + ip