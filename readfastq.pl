#!/usr/bin/env perl

use Bio::SeqIO;
use Data::Dumper;

# http://search.cpan.org/dist/BioPerl/Bio/SeqIO/fastq.pm
$in  = Bio::SeqIO->new(-file => "example.fastq" ,
                       -format => 'Fastq');


while ( my $seq = $in->next_seq() ) {
	# Bio::Seq::Quality object
	# http://search.cpan.org/dist/BioPerl/Bio/Seq/Quality.pm
	print "* ", $seq->display_name(), "\n";
	print $seq->seq(), "\n";
	print $seq->qual_text(), "\n";
	print join( ",", @{$seq->qual()} ), "\n";
}
