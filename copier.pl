#!/usr/bin/perl

# Open file to read
open(DATA1, "<file.txt");

#Open new file to write
open(DATA2, ">file_copy.txt");

# Copy data from one file to anoter.
while (<DATA1>) {
    print DATA2 $_;
}

close( DATA1 );
close( DATA2 );