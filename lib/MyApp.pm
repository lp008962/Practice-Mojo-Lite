package MyApp;
use base 'Mojolicious::Lite';

sub startup {
    my $self = shift;
    $self->types->type(txt => 'text/html; charset=utf8');
    my $r = $self->routes;
    
    $r->route('/mymojo')->to(namespace => '/lib/MyApp', 'myapp-foo#bar');

}

1;

