const axios = require('axios'); // npm install axios

axios.get('https://curlmyip.ru/geo')
    .then(res => console.log(JSON.stringify(res.data, null, 2)))
    .catch(err => console.error(err.message));