package Parameter;
use strict;
 
sub new {
    my ($class,$args) = @_;
    my $self = bless {
        name => $args->{name},
        age => $args->{age}
    }, $class;
}
 
sub set_name {
   my ($self, $name) = @_;
   $self->{name} = $name;
   return $self->{name};
}
 
sub get_name {
   my $self = shift @_;
   return $self->{name};
}
 
1; #must