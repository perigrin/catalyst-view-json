package TestApp;

use strict;
use warnings;

use Catalyst;

our $VERSION = '0.01';
__PACKAGE__->config({
    name => 'TestApp',
    'View::JSON' => {
        expose_stash => qr/^json_/,
        allow_callback => 1,
        callback_param => 'cb',
    },
});

__PACKAGE__->setup;

sub foo : Global {
    my ( $self, $c ) = @_;

    $c->stash->{json_foo} = "bar";
    $c->stash->{json_baz} = [ 1, 2, 3 ];
    $c->stash->{foo}      = "barbarbar";

    $c->forward('TestApp::View::JSON');
}

1;