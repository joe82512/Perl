#!/usr/bin/perl
use strict;

#需要取消多行註解

####################################### STD in/out #######################################
=x
# input
my @input = <STDIN>; #Ctrl+C end

# output
print STDOUT "@input\n"; #perl c5.pl , print "@input";
print STDERR "@input\n"; #perl c5.pl > err.txt
=cut

=test
my $input = <ARGV>; #same as <input>+STDERR
print "$input\n"; #perl c5.pl > err.txt
=cut

=test
# 參數寫在 terminal 後面
my $showInput = shift @ARGV;
print "$showInput\n"; #perl c5.pl (a,b,c) > err.txt
=cut

####################################### FILE read/write #######################################

=table
open FILE, "file.txt"; close FILE;
open FILE, "<output.txt"; #just read, default
open FILE, ">input.txt"; #clean & write
open FILE, ">>append.txt"; #write
=cut

=example
#open FILE, "<err.txt" or die "開啟檔案失敗: $!"; # || unused
open FILE, "<err.txt" or warn "open failed: $!"; #still running
    my $line1 = <FILE>; #read & next
    print $line1."\n";
    
    my $line2 = <FILE>; #read & next
    print $line2."\n";

    while (<FILE>) {
        print;
        #print $_;
    }
    
    #my @lineALL = <FILE>; #read all
    #print @lineALL;
close FILE;

open FILE, ">>err.txt"; #不存在則自動建立
    print FILE "END"; #寫入
close FILE;
=cut

####################################### FILE control #######################################
##### 常見 linux 指令如 mkdir, rmdir, chown, rename 皆可在 win 系統用 perl 執行 #####

my $log_path = "./log"; #win系統下路徑仍採linux /

if (-e $log_path) { #判斷目錄或檔案是否存在
    chdir $log_path; #移動目錄
    #my @log_files = glob "*.txt *.pl"; #glob選擇檔案
    my @log_files = <*.txt *.pl>; #同glob
    print "@log_files \n";    
    chdir ".."; #回上一目錄
}

my $test_file = "./log/err.txt";
my @ret = stat $test_file; #檔案資訊
#($dev,$inode,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,$ctime,$blksize,$blocks)
print "@ret \n";


chmod 0444, $test_file; #更改權限 -> 唯讀
#my $mode = '0444'; chmod oct($mode), $test_file; #chmod 是八進位

#unlink $test_file; #刪除檔案 -> 不會進回收桶!!!

my $now_date = localtime();
print "$now_date \n\n\n";

system("pause"); #terminal 指令
#system("ipconfig"); #terminal 指令