// getMyIp.js - Fetch external IP and other info from curlmyip.ru
const axios = require('axios');

const BASE_URL = 'http://curlmyip.ru';

async function fetchEndpoints() {
    try {
        // Fetch IP address
        const { data: ip } = await axios.get(`${BASE_URL}/ip`);
        console.log(`Your IP address: ${ip}`);

        // Fetch User-Agent
        const { data: ua } = await axios.get(`${BASE_URL}/ua`);
        console.log(`Your User-Agent: ${ua}`);

        // Fetch and display headers
        const { data: headers } = await axios.get(`${BASE_URL}/headers`);
        console.log('Headers sent by you:');
        console.log(JSON.stringify(headers, null, 2));

    } catch (error) {
        console.error('Error during API call:', error.message);
    }
}

fetchEndpoints();