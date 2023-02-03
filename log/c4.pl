#!/usr/bin/perl
use strict;

####################################### module #######################################

# terminal 輸入 cpan , 模組安裝包, 類似pip, exit 離開
#use lib "/home/xxx/xxx/"; #自訂模組路徑
use ClassTest;

my $word = "hello world";
my $ans = ClassTest::print($word); # &參考到自訂義 func
print "$ans \n";

=x
my $ans = &print(); # &參考到自訂義 func
&print($ans);
sub print {
    print shift @_ || "no data"; # @_ 引數, default "no data"
    print "\n";
    my $res = 100; #預設最後一個運算值為回傳值
    #return 1;
}
=cut



# 多引數
my $res = &div(4, 2);
print $res."\n";

sub div {
    $_[0]/$_[1]; # $_ 取值
}



# 變數區間
my $name1 = "my name";
my $name2 = "my name";

&helloB; # &非內建可省略, 但放定義之前需參考

sub helloA {
    print "helloA1: $name1\n";
    print "helloA2: $name2\n";
}

sub helloB {    
    my $name1 = "with my"; #local
    $name2 = "without my"; #global
    
    helloA; # &非內建可省略, 且前面已定義
    # my name , without my
    print "helloB1: $name1\n";
    print "helloB2: $name2\n";
    # with my , without my
}



####################################### reference #######################################

my @d1 = (24.2, 26.3, 23.4);
my $d1_ref = \@d1; #\ ref
print "$d1_ref\n";

my @d2 = (23.5, 27.5, 22.6);
my @d3 = (25.2, 28.7, 24.8);
my @daily = (\@d1, \@d2, \@d3);
print "@daily\n";

my @d123 = ([3, 5, 7, 9], [3, 5, 7, 9], {3, 5, 7, 9}); #[]->array ,{}->hash
print "$d123[1] \n"; #$,return array ref
print "$d123[1][2] \n"; #$
my @array_ref = @{$d123[1]}; #get array
print "@array_ref \n";

print "$d123[2] \n"; #$ not %,return hash ref
print "$d123[2]{7} \n"; #$
my %hash_ref = %{$d123[2]}; #get hash
while (my ($key, $value) = each (%hash_ref)) {
      print "$key => $value\n";
}





# 多矩陣傳輸入 : 矩陣只能有一個, 而且要擺最後; 因此多矩陣必須用 ref 製造多維矩陣
my %hash = (
    1 => 'one',
    2 => 'two',
    3 => 'three',
);
&getArray($name1, $name2, (\@d1, \@d2, \%hash) ); #scaler -> array

sub getArray { #copy file and create pattern
    # get parameter
    my ($name1, $name2, @all_array) = @_;
    print "Scalar: $name1 \t $name2 \n";
    my @d1 = @{$all_array[0]};
    my @d2 = @{$all_array[1]};
    print "Array: @d1 \t @d2 \n";
    my %hash = %{$all_array[2]};
    print "Hash Map: ";
    while (my ($key, $value) = each (%hash)) {
        print "$key => $value\n";
    }
}
