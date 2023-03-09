#!/usr/bin/perl 
use strict;
use Parameter;
use EnterParameter;
use FileOperation;
use MyParameter;
  
=x
my $object1 = new Parameter({
    name => "Jason",
    age => 33
});
=cut
 
my $object1 = Parameter->new ({
    name => "Jason",
    age => 33
});
 
print $object1->get_name()."=>";
$object1->set_name("JJ");
print $object1->get_name()."\n";
 
EnterParameter::show($object1);
 
my $fh1 = FileOperation->new ("log1.txt","w"); #"r"-> warn
for $_ (0..10) {$fh1->write("test $_\n");}
$fh1->close;
 
my $fh2 = FileOperation->new ("log2.txt","w");
$fh2->write("test456\n");
$fh2->close;
 
my $fh3 = FileOperation->new ("log1.txt","r");
while (my $read_in = <$fh3>) {
    print $read_in."\n";
}
$fh3->close;

my $object2 = MyParameter->new ({
    name => "Jason",
    age => 33
});
 
$object2->set_gender("F")."\n";
print $object2->get_name()."\n";