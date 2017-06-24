#!/usr/bin/perl

use strict;
use warnings;
# usage: perl single-line-fasta.pl {fasta file} > {single line fasta file}
open(FASTA,$ARGV[0]);
my @fasta = <FASTA>;

my ($header,%fasta_hash);

for (my $x=0; $x < scalar(@fasta); $x++) {
        my $line = $fasta[$x];
        chomp($line);
        my $total .= $line if $x==scalar(@fasta) - 1;
        if ($line =~ /^>/ || $x==scalar(@fasta) - 1) {
                if ($total ne "") {
			$fasta_hash{$header} = $total;
			print "$header%%$total\n";
		}
                $header = $line;
                $total = "";
        }else{
                $total.= $line;
                $total =~ s/\s//g;
        }
}

exit;
