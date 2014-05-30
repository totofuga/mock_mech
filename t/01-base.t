#!perl
use Test::More;
use Path::Class;
use FindBin qw($Bin);
use File::Spec;

BEGIN {
    use_ok "Test::Mock::WWW::Mechanize";
}

use constant { 
    URL_TEST01 => { 
        url  => "http://localhost/test01.html",
        path => File::Spec->catfile($FindBin::Bin, 'html', '01.html'),
    },
    URL_TEST02 => { 
        url  => "http://localhost/test02.html",
        path => File::Spec->catfile($FindBin::Bin, 'html', '02.html'),
    },
};


my $mock_mech = Test::Mock::WWW::Mechanize->new( 
    stub_requests => { 
        URL_TEST01()->{url} => do{ scalar file(URL_TEST01()->{path})->slurp()},  
        URL_TEST02()->{url} => do{ scalar file(URL_TEST02()->{path})->slurp()},  
    },
);

$mock_mech->get(URL_TEST01()->{url});

is($mock_mech->content(), do{ scalar file(URL_TEST01()->{path})->slurp()});

$mock_mech->follow_link(text => 't2');

is($mock_mech->content(), do{ scalar file(URL_TEST02()->{path})->slurp()});

done_testing();
