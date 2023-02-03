#!/usr/bin/perl
use strict;

####################################### if/elsif/else/unless #######################################
my $num = <STDIN>;
chomp($num); #移除最後一個轉譯字元

$num || die "沒有輸入值"; #default error msg

if ($num<5) {
    print $num."\n";
}
elsif ($num==5) {
    print "correct\n";
}
else {
    print "big\n";
}

#$num++ if (!($num < 5));
$num++ unless ($num < 5);
print "$num\n"; #6

my ($a, $b) = (42, 22);
#if ($a > $b) { $max = $a } else { $max = $b }
my $max = ($a > $b) ? $a : $b;
print "max: $max\n"; #42



####################################### while loop #######################################
while ($num <= 10) { # while(1)
      $num = $num + 1;
}
#$num++ while ($num <= 10);
#$num++ until ($num > 10);

print "$num\n"; #11



####################################### for loop #######################################
=sameMethod
for my $num (1...5) {
    print $num." ";
}

for (1...5) {
    print $_." ";
}

print for (1...5);

my @array = (1...5);
foreach my $element (@array) { #可用for替代foreach
    print $element." ";
}
print foreach (@array);
=cut

print $_." " for (1...5);
print "\n";



print "\n=== break test ===";
for ($_ = 1; $_ <= 5; $_++) {
    print "\n Number: ";
    last if ($_ == 4); #break
    print $_;
}

print "\n===continue test ===";
for ($_ = 1; $_ <= 5; $_++) {
    print "\n Number: ";
    next if ($_ == 4); #continue
    print $_;
}

print "\n===redo test ===";
for ($_ = 1; $_ <= 5; $_++) {
    print "\n Number: ";
    $_ = $_ + 1; #避免無限循環
    redo if ($_ == 4); #重複以上, 但並不跳過, 不走$_++
    print $_;
}