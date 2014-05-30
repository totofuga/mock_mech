#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Test::Mock::WWW::Mechanize' ) || print "Bail out!\n";
}

diag( "Testing Test::Mock::WWW::Mechanize $Test::Mock::WWW::Mechanize::VERSION, Perl $], $^X" );
