#!/usr/bin/env perl
use Mojolicious::Lite;
use FindBin::libs;
use MyApp;

my $app = MyApp->startup;

## Documentation browser under "/perldoc" (this plugin requires Perl 5.10)
#plugin 'pod_renderer';

plugin 'xslate_renderer';

#get '/' => sub {
#     my $self = shift;
#     my $title = 'Template with ep, how can I use "foreach"';
#     my $engines = [
#        { name => 'Google',
#            url  => 'http://google.com/'
#        },
#        { name => 'Yahoo Japan',
#        url  => 'http://yahoo.co.jp/'
#        },
#        { name => 'Baidu',
#        url  => 'http://baidu.co.jp/'        
#        },
#        { name => 'LiveDoor',
#        url  => 'http://www.livedoor.com/'
#        }
#    ];
#    
#    $self->render(title => $title, engines => $engines);
#
#    );
#   
#} => 'index';

get '/welcome' => sub {
  my $self = shift;
  $self->stash(content => "some");
  $self->render('index');
};

get '/foo' => 'foo';
get '/hello';

get '/fuga' => sub {
    my $self = shift;
    $self->stash(some => 'Elona');
    $self->render('fuga', any => 'Shooter');
};

get '/with_block' => 'block';

get '/xslate' => sub {
    my $self = shift;
    $self->render(
        handler => 'tx',
        title   => 'Template with Xslate!',
        engines   => [
            { name => 'Google',
              url  => 'http://google.com/'
            },
            { name => 'Yahoo Japan',
              url  => 'http://yahoo.co.jp/'
            },
            { name => 'Baidu',
              url  => 'http://baidu.co.jp/'
            },
            { name => 'LiveDoor',
              url  => 'http://www.livedoor.com/'
            }
        ]
    );
} => 'xslate';

get '/:hoge/xslate' => sub { 
    my $self = shift;
    $self->render(
        handler => 'tx',
        title   => 'Template with Xslate!',
        engines   => [
            { name => 'Google',
              url  => 'http://google.com/'
            },
            { name => 'Yahoo Japan',
              url  => 'http://yahoo.co.jp/'
            },
            { name => 'Baidu',
              url  => 'http://baidu.co.jp/'
            },
            { name => 'LiveDoor',
              url  => 'http://www.livedoor.com/'
            }
        ]
    );
} => 'xslate';

app->start;

__DATA__
@@ moge.html.ep
how are you?

@@ fuga.html.ep
some is <%= $some %>,
any is <%= $any %>

@@ foo.html.ep
% layout 'default';
% title 'link_to';
<%= link_to Hello   => 'hello' %>
<%= link_to Elonian => 'fuga' %>
<%= link_to Reload  => 'foo' %>
<%= link_to Cybozu  => 'https://www.hn-office.com/cgi-bin/cybozu6/ag.cgi' %>

@@ hello.html.ep
Hello, World!

@@ layouts/default.html.ep
<!doctype html><html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>

@@ block.html.ep
<% my $link = begin %>
  <% my ($url, $name) = @_; %>
  Engine : <%= link_to $url => begin %><%= $name %><% end %>
<% end %>

<!doctype html>
<body>
  <div><%== $link->('http://google.com', 'Google') %></div>
  <div><%== $link->('http://yahoo.com', 'Yahoo') %></div>
</body>
</html>


