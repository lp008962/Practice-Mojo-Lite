package MyApp;
use Mojo::Base 'Mojolicious::Lite';
use MyUsers;

sub startup {
    my $self = shift;

    $self->secret('LOOP =~ s/Hatoyama/die/g');
    $self->types->type(txt => 'text/html; charset=utf8');
    $self->plugin('xslate_renderer');

    my $users = MyUsers->new;
    $self->helper(users => sub { return $users });

    my $r = $self->routes;
    $r->any('/')->to('login#index')->name('index');
    $r->get('/protected')->to('login#protected')->name('protected');
    $r->any('/logout')->to('login#logout')->name('logout');
    $r->any('/xs')->to('login#xs')->name('xs');
      
}

1;
