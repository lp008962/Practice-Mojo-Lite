package MyApp::Login;
use Mojo::Base 'Mojolicious::Controller';

sub index {
    my $self = shift;

    my $user = $self->param('user') || '';
    my $pass = $self->param('pass') || '';
    
    return $self->render(handler => 'tx')
        unless $self->users->check($user, $pass);
    
    $self->session(user => $user);
    $self->flash(message => 'Login Successd');
    $self->redirect_to('protected');
}

sub protected {
    my $self = shift;
    return $self->redirect_to('index')
        unless $self->session('user');
}

sub logout {
    my $self = shift;
    $self->session(expires => 1);
    $self->redirect_to('index');
} 

sub xs {
    my $self = shift;
    
    my $engines = [
      { name => 'Google',
        url  => 'http://google.com'
      },
      { name => 'Yahoo',
        url  => 'http://www.yahoo.co.jp',
      },
      { name => 'Baidu',
        url  => 'http://www.baidu.com'
      },
      { name => 'LiveDoor',
        url  => 'http://www.livedoor.com'
      },
    ];
    my $tw = [
      { name => 'dankogai',
        twt  => 'Dan the $something $doer'
      },
      { name => 'hasegawayousuke',
        twt  => "I said ' or 'A'='A , He said 'Welcome'."
      },
      { name => 'The Magic Word',
        twt  => 'Popopopo-n'
      },
      { name => 'AC',
        twt  => 'For Anser'
      }
    ];

    $self->render(
      handler => 'tx',
      title   => '__gfx__++',
      engines => $engines,
      tw      => $tw
    );
}
 
1;
