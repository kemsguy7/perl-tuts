#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use Dancr2;

Dancr2->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Dancr2;
use Plack::Builder;

builder {
    enable 'Deflater';
    Dancr2->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use Dancr2;
use Dancr2_admin;

use Plack::Builder;

builder {
    mount '/'      => Dancr2->to_app;
    mount '/admin'      => Dancr2_admin->to_app;
}

=end comment

=cut

