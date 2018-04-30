requires 'Minion';
requires 'Minion::Backend::mysql';
requires 'Mojo::Base';
requires 'Mojo::EventEmitter';
requires 'Mojolicious::Commands';

on test => sub {
    requires 'Test::Mojo';
    requires 'Test::More';
};
