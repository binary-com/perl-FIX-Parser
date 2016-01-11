use Test::Most;
use Test::FailWarnings;
use FIX::Parser::FIX44;

use Path::Tiny;

my $test_data = path(__FILE__)->parent->child('fix44_test.dat')->slurp;

my $fix = FIX::Parser::FIX44->new;

my @msgs;
@msgs = $fix->add(substr $test_data, 0, 100, '');
ok !@msgs, "there's no complete message in first 100 bytes";
@msgs = $fix->add(substr $test_data, 0, 242, '');
is @msgs, 1, "one message parsed";

cmp_deeply(
    $msgs[0],
    superhashof({
            symbol   => 'nzdusd',
            datetime => '20140902-02:18:25.279',
            bid      => '0.83578',
            ask      => '0.83591',
            mid      => '0.83584',
        },
    ),
    "message contain expected data",
);

@msgs = $fix->add(substr $test_data, 0, 690, '');
is @msgs, 2, "two messages parsed";

cmp_deeply(
    $msgs[0],
    superhashof({
            symbol   => 'eurnzd',
            datetime => '20140902-02:18:25.279',
            bid      => '1.56991',
            ask      => '1.57008',
        },
    ),
    "first message contain eurnzd",
);

cmp_deeply(
    $msgs[1],
    superhashof({
            symbol   => 'audnzd',
            datetime => '20140902-02:18:25.279',
            bid      => '1.11477',
            ask      => '1.11483',
        },
    ),
    "second message contains audnzd",
);

@msgs = $fix->add(substr $test_data, 0, 350, '');
is @msgs, 1, "one message parsed";

cmp_deeply(
    $msgs[0],
    superhashof({
            symbol   => 'gbpnzd',
            datetime => '20140902-02:18:25.279',
            bid      => '1.98474',
            ask      => '1.98490',
        },
    ),
    "message contains gbpnzd",
);

done_testing;
