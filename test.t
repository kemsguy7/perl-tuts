use strict;
use warnings;

use Test::More;
use Plack::Test;
use Plack::Util;
use HTTP::Request::Common qw(GET);

my $app = Plack::Util::load_psgi 'app.psgi';

my $test = Plack::Test->create($app);
my $res = $test->request(GET '/');

is $res->status_line, '200 OK', 'status is 200';
is $res->content, 'Hello World!', 'Content';

done_testing();