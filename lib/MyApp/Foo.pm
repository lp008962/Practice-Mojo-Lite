package MyApp::Foo;
use base 'Mojolicious::Controller';

sub bar {
    my $self = shift;

    $self->render( text => "MuKyuu" );
}

1;

