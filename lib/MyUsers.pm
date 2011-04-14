package MyUsers;

use strict;
use warnings;

my $users = {
    foo  => 'bar',
    nabe => 'tani',
};

sub new { bless {}, shift }

sub check {
    my ($self , $user, $pass) = @_;

    return 1 if $users->{$user} && $users->{$user} eq $pass;
    return;
}

1;
