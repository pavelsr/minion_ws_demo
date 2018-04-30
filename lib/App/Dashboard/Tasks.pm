package App::Dashboard::Tasks;
use Mojo::Base 'Mojolicious::Plugin';

sub register {
  my ($self, $app) = @_;
   $app->minion->add_task(something_slow => sub {
       my ($job, @args) = @_;
       sleep 3;
       $job->app->log->debug('Test minion task '.$job->task.'(id='.$job->id.') finished');
   });
}

1;
