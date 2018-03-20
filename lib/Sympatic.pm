package Sympatic;
our $VERSION = '0.1';
use strict;
use warnings;
require Import::Into;

sub import {
    my $to = caller;

    English->import::into($to, qw<  -no_match_vars >);
    feature->import::into($to, qw< say state unicode_strings >);
    strict->import::into($to);
    warnings->import::into($to);
    Function::Parameters->import::into($to);
    utf8::all->import::into($to);

    shift; # 'Sympatic', the package name
    my %configuration;

    while (@_) {
        if ($_[0] eq '-noo') { $configuration{shift,} = 1 }
        else { die "invalid argument @_ " }
    }

    $configuration{'-noo'} or do {
        Moo->import::into($to);
        MooX::LvalueAttribute->import::into($to);
    }

}

1;
