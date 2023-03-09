package MyParameter;
use strict;
 
use Parameter;
our @ISA = qw(Parameter); #inherit
 
sub new {
    my ($class, @args) = @_;
    my $self = $class->SUPER::new(@args);
    $self->{gender} = "M";
    bless $self, $class;
    return $self;
}
 
sub set_gender { #create
   my ($self, $gender) = @_;
   $self->{gender} = $gender;
   return $self->{gender};
}
 
sub get_name { #override
   my $self = shift @_;
   return $self->{name}."-".$self->{gender};
}
 
1; #must