#!/usr/bin/perl

use warnings;
use strict;
my %ls_groups= ();
my ($gene,$pat,$per_enrich);
my $i=0;
open (IN1, "/home_stajichlab/dsain/bigdata/GEN220/linsp/3h_LS.ro.groups")|| die "file doesnt exist";
#open (IN1, "/home_stajichlab/dsain/bigdata/GEN220/linsp/20h_LS.ro.groups")|| die "file doesnt exist";
#this is only for full genome# open (IN1, "/home_stajichlab/dsain/bigdata/GEN220/linsp/LS_ro/profile.ro_only.tab")|| die "file doesnt exist";
open (OUT, ">3h_ls_enrich_ro")|| die "file doesnt exist";
#this is only for full genome# open (OUT, ">ro_genome_ls_enrich_ro")|| die "file doesnt exist";
while (my $line= <IN1>)
{
	chomp ($line);
	($gene,$pat)= split(/\t/, $line);
#print $gene, "\t", $pat, "\n";

#}
if (exists $ls_groups{$pat})

{
	$ls_groups{$pat} = $ls_groups{$pat}+1;
#print $pat, "\t", $ls_groups{$pat}, "\n";
}
else
{$ls_groups{$pat}=1;
}
#print $pat, "\t", $ls_groups{$pat}, "\n";
$i++;
}

#print  "\n";
print OUT join("\t", "Lineage-spec gp", "times", "%enrichment"), "\n";
for my $name (sort keys %ls_groups) 
{
	$per_enrich = (($ls_groups{$name})/$i)*100;
#print OUT "The pattern ", $name," occurs ", $ls_groups{$name}," times and is enriched ",
#$per_enrich, " % in the geneset\n";
	print OUT  $name,"\t", $ls_groups{$name},"\t", $per_enrich,"\n";
}


