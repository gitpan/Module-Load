### Module::Load test suite ###

use strict;
use lib qw[../lib t/to_load];
use Module::Load;
use Test::More tests => 8;


{
    my $mod = 'Must::Be::Loaded';
    my $file = Module::Load::_to_file($mod,1);

    eval { load $mod };

    is( $@, '', q[Loading module] );
    ok( defined($INC{$file}), q[... found in %INC] );
}

{
    my $mod = 'LoadMe.pl';
    my $file = Module::Load::_to_file($mod);

    eval { load $mod };

    is( $@, '', q[Loading File] );
    ok( defined($INC{$file}), q[... found in %INC] );
}

{
    my $mod = 'LoadIt';
    my $file = Module::Load::_to_file($mod,1);

    eval { load $mod };

    is( $@, '', q[Loading Ambigious Module] );
    ok( defined($INC{$file}), q[... found in %INC] );
}

{
    my $mod = 'ToBeLoaded';
    my $file = Module::Load::_to_file($mod);

    eval { load $mod };

    is( $@, '', q[Loading Ambigious File] );
    ok( defined($INC{$file}), q[... found in %INC] );
}
