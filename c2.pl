#!/usr/bin/perl
use strict;

####################################### string #######################################
print "\n ================ string ================ \n";
my $a1 = "1";
my $b2 = "2";
my $c3 = $a1 + $b2; #3, 自動轉換

my $d4 = "12abc34";
my $e5 = $d4 * 2; #12*2=24, 字串開始時自動省略

my $str = $d4.$d4."\n"; #字串相加
#my $str = $d4 x 2; #字串複製

print "len: ".length($str)."\n"; #包含\n的字串長度

# index
my $mainString = "perl training by Taipei perl mongers, perl";
my $subString = "perl";
print "first: ".index($mainString, $subString)."\n";  # "第一" 組的開始位置 idx=5

my $firstIdx = index($mainString, $subString); # 先找到第一次出現perl的地方
print "second: ".index($mainString, $subString, $firstIdx+1)."\n"; #接續, 沒有則返回-1
print "last: ".rindex($mainString, $subString)."\n"; #抓最後一個

# slice
print "3~end: ".substr($mainString, 3)."\n"; #idx=3 to end
print "3~8-1: ".substr($mainString, 3, 5)."\n"; #idx=3,len=5

# change
my $string = "London Perl Mongers";
$string =~ s/London/Taipei/; #change
print $string."\n"; #Taipei Perl Mongers
substr($string, 0, 6, "New York");  # change
print $string."\n"; # New York Perl Mongers
print uc $string,"\n"; #大寫
print lc $string."\n"; #小寫

# split
my @splitString = split(/ /,$string); #array
print "Split Array: @splitString \n";

# input
my $inputData = <STDIN>; #input
print 'with \n: '.length($inputData)."\n";
chomp($inputData); #只刪最後一個轉譯字元
print 'without \n: '.length($inputData)."\n";

# define
#my $name = "define";
my $name;
if (defined($name)) {
    print $name."\n";
}
else {
    print "it's undefined \n";
}

# sort
my @ip = ("140.21.135.218", "140.112.22.49", "140.213.21.4", "140.211.42.8");
my @order = sort ipsort(@ip); #function
print "$_\n" for @order;

sub ipsort {
    my ($a1, $a2, $a3, $a4) = $a =~ /(\d+).(\d+).(\d+).(\d+)/; # 分為四個數字
    my ($b1, $b2, $b3, $b4) = $b =~ /(\d+).(\d+).(\d+).(\d+)/;
    $a1 <=> $b1 or $a2 <=> $b2 or $a3 <=> $b3 or $a4 <=> $b4; # 進行多子鍵排序
}