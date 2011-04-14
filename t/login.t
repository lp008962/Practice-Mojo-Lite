use Test::More tests => 8;
use Test::Mojo;

my $t = Test::Mojo->new(max_redirects => 1);

$t->get_ok('/')->status_is(200)
  ->element_exists('form div input[name="user"]')
  ->element_exists('form div input[name="pass"]')
  ->element_exists('form input[type="submit"]');

$t->post_form_ok('/' => { user => 'nabe', pass => 'tani' })
  ->status_is(200)->text_like('html body h1' => qr/Welcome nabe/);

