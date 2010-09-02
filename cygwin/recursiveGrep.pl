#! /usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

sub usage;

&usage if (scalar @ARGV < 1);

my @files = `find . -follow -print`;
chomp @files;

foreach my $file (@files)
{
	next if -B "$file";
	next if ($file =~ m/\.dll/);
	next if ($file =~ m/\.exe/);
	
	# Call grep passing through any options
	system "grep -H @ARGV $file";
}

sub usage()
{
	print "Usage: recursiveGrep.pl [options] regex\n";
	exit;
}
