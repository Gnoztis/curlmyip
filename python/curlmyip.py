from requests import get

ip = get('https://curlmyip.ru').text
print('Public IP address is: {}'.format(ip))