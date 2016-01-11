#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'FIX::Parser' ) || print "Bail out!\n";
}

diag( "Testing FIX::Parser $FIX::Parser::VERSION, Perl $], $^X" );
