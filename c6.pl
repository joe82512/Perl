#!/usr/bin/perl
use strict;

####################################### regex #######################################

=x
# 字串比對 .不限字元 *不限次數
#my $stopWord = "exit"; #""不能直接建在 / / 裡面, 直接打
my $answer = "mo*r"; #必須有mr, o不限數量
#my $answer = "mo{2,4}r"; #必須有mor, o限數量2~4
#my $answer = "mo{2,}r"; #必須有mor, o限數量2~無上限
#my $answer = "(mo){2,}r"; #群組, 至少兩組mo且相連

while (1) {
    if ((my $patten = <STDIN>) =~ /exit/) {
        print "END\n";
        last;
    }
    elsif ($patten =~ /$answer/) {# 判斷是否比對成功
        print "match\n";
    }
    else {
        print "not match\n";
    }
}
=cut

# 比對集合
#my $language = "Java"; #Bad
#my $language = "Python"; #Good
#my $language = "C++"; #比對字串 C\+\+, 不能直接 C++
my $language = "python";
my $content = "I like ".$language.". \n I am a ".$language." monger. \n ".$language." !!! \n";

#if ($content =~ /(Perl|C\+\+|Python)/) { #小寫失敗
if ($content =~ /(Perl|C\+\+|Python)/i) { #忽略大小寫
    print "Good \n";
}
else {
    print "Bad \n";
}

# 集合簡寫 \w =[a-zA-Z] \d =[0-9] \s=[轉譯字元]
my $sort_content = "aabbccc";
print "a-z PASS \n" if ($sort_content =~ /[a-z]/);
print "ab PASS \n" if ($sort_content =~ /[^ab]/); #排除ab以外的字元
print "abc FAIL \n" unless ($sort_content =~ /[^abc]/); #排除abc以外的字元

if ($content =~ /like.*monger/s) { # /s跨行比對 .不限字元 *不限次數
    print "Pass \n";
}

if ($content =~ /(like.*monger)/s) { #()$1,$2,...
    print "Pass: $1 \n";
}

if ($content =~ /(python)\s(monger)/s) { #複數集合
    print "$1 => $2 \n"; # $1 = "python", $2 = "monger"
}

if ($content =~ /((python)\s(monger))/s) { #集合內集合
    print "$1 <= $2 + $3 \n"; # $1 = "python monger", $2 = "python", $3 = "monger"
}

$content =~ /(false)/; #比對失敗
print "$1 \n"; #python monger


# 起頭比對/結尾比對 /^.../ /...$/ ; 單字邊界比對\b 非邊界\B
if ($content =~ /^python/) { #起頭比對
    print "python \n";
}
elsif ($content =~ /^I/) {
    print "I \n"
}
else {
    print "Bad \n";
}

# 截止比對
my $html_string = "<table><tr><td>first</td></tr><tr><td>second</td></tr><tr><td>third </td></tr></table>";
print "$1 \n" if ($html_string =~ m|<tr><td>(.+)<\/td><\/tr>|);
print "$1 \n" if ($html_string =~ m|<table><tr><td>(.+?)<\/td><\/tr>|);

# 字串替換
$content =~ s/python/PERL/; #第一個python 換成 PERL
print $content;

$content =~ s/python/PERL/g; #全部python 換成 PERL
print $content;

# 集合交換
my $string = "I like python, but hate perl.";
print "$string \n" if ($string =~ s/(python)(.*)(perl)/$3$2$1/);

# 重複字串
my $string = "庭院深深深幾";
print $string."\n" if ($string =~ /深深深/); 
print $string."\n" if ($string =~ /(深)\1\1/); #回溯參考$1

my $string = "blahblahblah means nothing";
print "$string" if ($string =~ s/(blah)+//);