<?php
    // initialise the CURL library
    $ch = curl_init();
    // specify the URL to be retrieved
    curl_setopt($ch, CURLOPT_URL,'http://curlmyip.ru');
    // we want to get the contents of the URL and store it in a variable
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
    // specify the useragent: this is a required courtesy to site owners
    curl_setopt($ch, CURLOPT_USERAGENT, $useragent);
    // ignore SSL errors
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    // otherwise just return the contents as a variable
    $data=curl_exec($ch);
    // free resources
    curl_close($ch);
    // send back the data
    echo $data;
?>