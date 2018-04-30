package App::Dashboard::Controller::Example;

use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use Minion;
use Mojo::EventEmitter;

# AJAX endpoint
sub start_task {
    my $self = shift;

    # something_slow task defined in a separate class, App::Dashboard::Tasks
    my $task_id = $self->minion->enqueue('something_slow');
    my $job = $self->minion->job($task_id)->start; # in new process
    # $self->minion->job($task_id)->execute;  # in same process ?

    $job->on(finish => sub {
        $self->app->log->debug("Job ".$task_id." finished");
        $self->events->emit('task_finished' => $task_id);
    });

    $self->render(json => { task_id => $task_id });

}

sub ws {
  my $self = shift;

  $self->on(task_finished => sub {
      my ($e, $task_id) = @_;
      $self->send({ json => 'WS catched event: task '.$task_id.' finished' });
  });

};



sub welcome {
  shift->render;
}

1;
