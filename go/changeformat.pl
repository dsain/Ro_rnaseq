#!/usr/bin/perl

use warnings;
use strict;

open (IN, "/home_stajichlab/dsain/bigdata/GEN220/go/RoGene2GOslim")|| die "file doesnt exist";
open (OUT, ">RoGene2GOslim_GSEA")|| die "file doesnt exist";
my ($gene,$goslim);
while (my $line=<IN>)
{
#next if $line eq 'Ro_gene	GOSLIMID';
	($gene,$goslim)= split(/\s+/, $line);
	next if $gene eq 'Ro_gene';
	print OUT $goslim, "\tIEA\t", $gene, "\n";
}
