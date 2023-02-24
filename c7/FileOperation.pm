package FileOperation;
use strict;
use IO::File;
our @ISA = qw(IO::File); #inherit
 
sub new {
    my ($class, @args) = @_;
    my $self = $class->SUPER::new();
    &open($self, @args); #intial create
    return $self;
}
 
sub open {
    # ["filename","rw"] ANSI C fopen()
    my ($self, @args) = @_;
    my $file = $args[0];
    $self->SUPER::open(@args) || warn ("Could not open $file !");
}
 
sub close {
    my ($self) = @_;
    $self->SUPER::close();
}
 
sub write {
    my ($self, $context) = @_;
    print $self $context;
}
 
sub writeF {
    my ($self, @context) = @_;
    printf $self @context;
}
 
1; #must