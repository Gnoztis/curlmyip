use LWP::UserAgent;

$url = 'http://curlmyip.ru';

my $ua = LWP::UserAgent->new;
my $response = $ua->get( $url );
print $response->content if $response->is_success;