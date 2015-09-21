#!/usr/bin/perl
#use strict;


my $data_file = ("../data/141021");

open(RFD, $data_file);

my $first_line = 1;
my @header = ();

while(<RFD>){
    my $line = $_;
    if($first_line) {
        @header = split($line, ",");
        print  @header;
        exit(0);
    }

}
