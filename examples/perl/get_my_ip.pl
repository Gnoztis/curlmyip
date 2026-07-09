#!/usr/bin/env perl
# get_my_ip.pl - Fetch IP and location info using WWW::curlmyip
use strict;
use warnings;
use WWW::curlmyip;

# Get external IP
my $ip = get_ip();
print "Your IP address: $ip\n";

# Get geolocation data (requires the module)
my $location = get_location($ip);
if ($location) {
    print "Country: $location->{country}\n";
    print "City: $location->{city}\n";
}