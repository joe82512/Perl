package ClassTest;  # 套件的開始

sub print {
    print shift @_ || "no data"; # @_ 引數, default "no data"
    print "\n";
    my $res = 100; #預設最後一個運算值為回傳值
    #return 1;
}

1; # 必須回傳一個真值