use Test::Most;
use Test::FailWarnings;
use FIX::Parser::FIX44;


my $file = 't/fix44_test.dat';
open my $info, $file or die "Could not open $file: $!";

my $fix = FIX::Parser::FIX44->new;

my @msgs;

my $line = <$info>;

@msgs = $fix->add(substr($line, 0, length($line)-1 ) );
is @msgs, 1, "one message parsed";

cmp_deeply(
    $msgs[0],
    superhashof({
            symbol   => 'AUDJPY',
            datetime => '=20151218-08:51:45.634',
            bid      => '86.908',
            ask      => '86.915',
        },
    ),
    "message contain expected data",
);

done_testing;
