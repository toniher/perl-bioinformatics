#!/usr/bin/env perl

use Bio::SeqIO;

$in  = Bio::SeqIO->new(-file => "nucl.fasta" ,
                       -format => 'Fasta');


while ( my $seq = $in->next_seq() ) {
	print "* ", $seq->display_name(), " - ";
	print $seq->desc(), "\n";
	print $seq->seq(), "\n";
}
