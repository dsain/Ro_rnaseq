#!/usr/bin/perl

use warnings;
use strict;
my $temp;
my %go2goslim= ();
my %gene2goslim= ();
#my ($gene1,$go1,$goslim);
#my ($go2,$iea,$gene2);

open (IN1, "/home_stajichlab/dsain/bigdata/GEN220/go/sc_go")|| die "file doesnt exist";
open (IN2, "/home_stajichlab/dsain/bigdata/GEN220/go/Ro_go2trans.sort.tab")|| die "file doesnt exist";
open (OUT1, ">GO2GOslim")|| die "file doesnt exist";
open (OUT2, ">RoGene2GOslim")|| die "file doesnt exist";

#####GO-to-GOslim file####
while (my $line1=<IN1>)
{
	my ($gene1,$go1,$goslim)= split(/\s+/, $line1);
	if ($goslim) {
#	print $go1, "\t", $goslim, "\n";
		if (!exists $go2goslim{$go1})
		{
			$go2goslim{$go1}={};
		}
		$go2goslim{$go1}{$goslim}=1;

	}
}

print OUT1 "GOID\tGOSLIMID\n";
for my $go (sort keys %go2goslim)
{
	for my $goslim (keys %{$go2goslim{$go}})
	{
		print OUT1 $go,"\t", $goslim, "\n";
	}
}

#####Gene-to-GO file####
while (my $line2=<IN2>) 
{
	my ($go2,$iea,$gene2)= split(/\s+/, $line2);
#print $go2, "\t", $gene2, "\n"

	if (!exists $gene2goslim{$gene2})
	{
		$gene2goslim{$gene2}={};
	}

	for my $goslim (keys %{$go2goslim{$go2}})              
	{  $gene2goslim{$gene2}{$goslim}=1;
	}
}
print OUT2 "Ro_gene\tGOSLIMID\n";
for my $gene (sort keys %gene2goslim)
{
	for my $goslim (keys %{$gene2goslim{$gene}})
	{
		print OUT2 $gene,"\t", $goslim, "\n";
	}
}





