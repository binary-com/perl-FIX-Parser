use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'FIX::Parser',
    AUTHOR           => q{Binary.com <support@binary.com>},
    VERSION_FROM     => 'lib/FIX/Parser.pm',
    ABSTRACT_FROM    => 'lib/FIX/Parser.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More'         => 0,
        'Test::Most'         => 0,
        'Test::FailWarnings' => 0,
        'Devel::Cover'       => '1.23',
    },
    PREREQ_PM => {
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'FIX-Parser-*' },
);
