package App::Dashboard;

use Mojo::Base 'Mojolicious';

use Minion;
use Minion::Backend::mysql;

# This method will run once at server start
sub startup {
  my $self = shift;

   my $queue_db_uri = $ENV{'QUEUE_DB_URI'} || 'mysql://user@mysql_dashboard/minion_jobs';
  # Load configuration from hash returned by "my_app.conf"
  # my $config = $self->plugin('Config');
  $self->plugin('Config');

  $self->plugin('Minion' =>  {mysql => $queue_db_uri} );
  $self->plugin('Minion::Admin');
  $self->plugin('App::Dashboard::Tasks');

  $self->helper(events => sub {
      state $events = Mojo::EventEmitter->new
  });

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/start_task')->to('example#start_task');
  $r->websocket('/ws')->to('example#ws');
}

1;
