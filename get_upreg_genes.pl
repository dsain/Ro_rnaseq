#!/usr/bin/perl -w

use strict;
use warnings;

open IN1,"/home_stajichlab/dsain/bigdata/GEN220/upreg/Ro_3hvs20h_trans.diff" or die "file doesnt exist";
#open IN1,"out" or die "file doesnt exist";
open OUT1,">Ro20h_up.list" or die "file doesnt exist"";
open OUT2,">Ro3h_up.list" or die "file doesnt exist"";
open OUT3,">Ro20h_up_gene.list" or die "file doesnt exist"";
open OUT4,">Ro3h_up_gene.list" or die "file doesnt exist"";

my (@array1,@array2,@array3);
my $j=0;

while(my $line=<IN1>)
{
	chomp$line;
	my @arr= split/\s+/,$line;
	if($arr[11]eq 'yes')
	{
		for(my $i=0;$i<scalar@arr;$i++)
		{
			$array1[$j][$i]=$arr[$i];
		}
		$j++;
	}
}

#for (my $k=0; $k<scalar@array1; $k++){

#for (my $m=0; $m<12; $m++){

#print $array1[$k][$m], "\n";

#}
#}

my $k=0; my $l=0;
for(my $i=0;$i<scalar@array1;$i++)
{
	if($array1[$i][8]>=0)
	{
		for($j=0;$j<12;$j++)
		{
			$array2[$k][$j]=$array1[$i][$j];
		}
		$k++;
	}
#for (my $x=0; $x<scalar@array2; $x++){

#for (my $y=0; $y<12; $y++){

#print $array2[$x][$y], "\n";

#}
#}

	elsif($array1[$i][8]<0)
	{
		for($j=0;$j<12;$j++)
		{
			$array3[$l][$j]=$array1[$i][$j];
		}
		$l++;
	}
}
for(my $i=0;$i<scalar@array2;$i++)
{
	if($array2[$i][8]=~"e")
	{
		print "no $array2[$i][8]\n";
	}
	elsif($array2[$i][8]>0)
	{
		for($j=0;$j<12;$j++)
		{
			print OUT1 "$array2[$i][$j]\t";
		}
		print OUT1 "\n";
	}
}
for(my $i=0;$i<scalar@array3;$i++)
{
#my $val= -1.9;
	if($array2[$i][8]=~"e")
	{
		print "no $array2[$i][8]\n";
	}
	elsif($array3[$i][8] < 0)
	{
		for($j=0;$j<12;$j++)
		{
			print OUT2 "$array3[$i][$j]\t";
		}
		print OUT2 "\n";
	}
}

for(my $i=0;$i<scalar@array2;$i++)
{
	if($array2[$i][8]=~"e")
	{
		print "no $array2[$i][8]\n";
	}
	elsif($array2[$i][8]>0)
	{
		for($j=0;$j<12;$j++)
		{
#print OUT3 "$array2[$i][0]\n";
		}
		print OUT3 "$array2[$i][0]\n";
#print OUT3 "\n";
	}
}
for(my $i=0;$i<scalar@array3;$i++)
{
#my $val= -1.9;
	if($array2[$i][8]=~"e")
	{
		print "no $array2[$i][8]\n";
	}
	elsif($array3[$i][8] < 0)
	{
		for($j=0;$j<12;$j++)
		{
#print OUT4 "$array3[$i][0]\n";
		}
		print OUT4 "$array3[$i][0]\n";
#print OUT4 "\n";
	}
}
