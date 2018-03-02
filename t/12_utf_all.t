use Sympatic;
use Test::More skip_all => q(as utf8::all wasn't debated enough, it is temporary removed from the list);


open my $read_fh , '<','t/12_utf_all.t';
open my $write_fh, '>','t/12_utf_all.write.test';

my @tests =
    ( ['read_fh'  => $read_fh  ]
    , ['write_fh' => $write_fh ]
    , [STDOUT => *STDOUT ]
    , [STDIN  => *STDIN  ]
    , [STDERR => *STDERR ] );

plan tests => 0+@tests;

map {
    my ($name, $fh ) = @$_;
    ok +(grep /utf8/, PerlIO::get_layers $fh)
        , "$name handles utf8";
} @tests;

