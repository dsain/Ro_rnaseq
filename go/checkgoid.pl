#!/usr/bin/perl

use warnings;
use strict;
my $temp;
my %unique= ();
my %unique1= ();
my ($go,$iea,$gene);
my ($go1,$goslim,$gene1);

open (IN1, "/home_stajichlab/dsain/bigdata/GEN220/go/Ro_go2trans.tab")|| die "file doesnt exist";
open (IN2, "/home_stajichlab/dsain/bigdata/GEN220/go/sc_go")|| die "file doesnt exist";

while (my $line=<IN1>)
{
	($go,$iea,$gene)= split(/\s+/, $line);
#print $go, "\t", $gene, "\n";
	$unique{$go}= 1;
}

while (my $line1=<IN2>)
{
	($gene1,$go1,$goslim)= split(/\s+/, $line1);
#print $go1, "\t", $gene1, "\n";
	$unique1{$go1}= 1;
}

for my $key (sort keys%unique)
{
	if (!exists $unique1{$key})
	{print $key, " doesnt exist \n";
	}
}
