#!/usr/bin/perl

use warnings;
use strict;
my $temp;

open (IN1, "/home_stajichlab/dsain/bigdata/GEN220/linsp/LS_ro/profile.ro_only.tab")|| die "file doesnt exist";
#open (IN2, "/home_stajichlab/dsain/bigdata/GEN220/upreg/trans_upreg/Ro3h_up_trans.list") || die "file doesnt exist";
open (IN2, "/home_stajichlab/dsain/bigdata/GEN220/upreg/trans_upreg/Ro20h_up_trans.list") || die "fiel doesnt exist";

my %unique= ();
while (my $line=<IN1>) {
	my ($gene, $lsgp)= split(/\s+/, $line);
	$unique{$gene}= $lsgp; 
}

while (my $line1=<IN2>) {
	chomp ($line1);
#print $line1;
	for my $key (sort keys%unique)
	{

		if ($line1 eq $key)
		{
#print "yes";
			print $key, "\t", $unique{$key},"\n";
		} 
	}

}
