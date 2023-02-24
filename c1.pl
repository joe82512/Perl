#!/usr/bin/perl
# 宣告給 linux

# 註解

=anyword
多行註解, 注意=後必須有文字, anyword 可換
=cut

# exec: perl test.pl or test.pl
# without .pl : perl -e "print \"Hello world\n\""

use strict; #嚴謹寫法編譯
#use diagnostics; #顯示詳細錯誤
#use warnings; #if not strict, show warning

print "Hello World\n";
print 'Hello World\n'; #轉譯字元, $ 皆無效

{ #block
    #no warnings; # if not strict, close warning
    my $foo = 3;
    my $f00 = 6; # warning: Name "main::f00" used only once: possible typo at...
}

print my $foo; # cause block, undefined


####################################### scaler #######################################
print "\n ================ scaler ================ \n";

my $a1 = 1_000_000; #_無意義
my $b2 = 1e6; #科學記號
my $c3 = 0xff; #Hex, show Dec

print "a,b,c = $a1, $b2, $c3 \n";
print 'a,b,c = $a1, $b2, $c3 \n';
print "\n";
print "a,b,c = ${a1}, ${b2}, ${c3} \n"; #用 { } 標記
printf "oct:%lo, hex:%lx \n", $c3, $c3; #print format

my $pi = 3.1415926;
my $formatted = sprintf("%.2f", $pi);
print $formatted."\n";

####################################### array #######################################
print "\n ================ array ================ \n";
my @array0 = (); #empty
my @array1 = (1, 2, 3, 4);
#my @array1 = qw/1 2 3 4/; #正則寫法
#my @array1 = qw{1 2 3 4}; 
my @array2 = (1...3); #(1,2,3)
my @array3 = (0, @array1, 5...10); #陣列相加, (0...10)

# index
$array1[5] = 6; # idx4 not define, 注意是 $ 非 @
print $#array1."\n"; #last idx
print @array1."\n";#length
print "@{array1} \n"; #(1,2,3,4,_,6)

# push,pop,shift,unshift
push(@array2, 0);
#push @array2, 0; #可省略 ()
my $out = shift(@array2); #(2,3,0)

# sort,reverse,filter
my @sortArray = sort(@array2); #(0,2,3)
#my @sortArray = sort({$a cmp $b} @array2);
#my @sortArray = sort({$a <=> $b}@array2);
print "@sortArray \n"; #(2,3,0)

my @randomArray = qw/-4 45 -33 8 75 21 -15 38 -69 46/;
@randomArray = sort( {($a**2) <=> ($b**2)} @randomArray); #特殊規則排序
print join(',', @randomArray)."\n";

my @mapArray = map( {($_)**2} @randomArray);
print join(',', @mapArray)."\n";

my @positive = grep( {$_ > 0} @randomArray); #filter
print "@positive \n";

# slice
print "@array3[2...4, 6] \n"; #(2,3,4,6)

# change
($a1,$b2) = ($b2,$a1);

# array scalar 自動轉換
my @array = (0...10);
print @array."\n"; #顯示純量 11
print "@array \n"; #顯示向量 0 1 2...10
my @scalar_array = @array + 4; # 4純量, 導致array變成純量
print "@scalar_array \n"; #15



####################################### hashmap #######################################

print "\n ================ hashmap ================ \n";
my %hash0; #unordered_map
$hash0{0} = 0;
$hash0{1} = 1;
$hash0{2} = 2;

my %hash1 = (
    1 => 'one',
    2 => 'two',
    3 => 'three',
);

# contact
my %hash2 = (%hash0,%hash1); #合併 (0,'one','two','three')

# get
print $hash2{1}."\n"; #get, but not %hash

# show
my @v = values(%hash2); #same as keys
print "@v \n";
while (my ($key, $value) = each (%hash2)) {
      print "$key => $value\n";
}

# exist
print "exists\n" if (exists $hash2{1});

# delete
delete($hash2{1});
print "not exists\n" unless (exists $hash2{1});

# sort
my %hash3 = ("john", 24, "mary", 28, "david", 22);
my @orderMap = sort { $hash3{$a} <=> $hash3{$b} } keys %hash3; #hash sort
print @orderMap; #david john mary