#! /usr/bin/perl
use strict;
use warnings;

while (my $line = <STDIN>)
{
    #while ($line =~ m/\s/)
    #{
    #$line =~ s/\s//;
    #}

    $line =~ s/\s//g;

	print "$line\n";
}
