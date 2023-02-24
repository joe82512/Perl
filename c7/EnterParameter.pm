package EnterParameter;
use strict;
 
sub show {
    my $obj = shift @_;
    print $obj->get_name();
}
 
1; #must