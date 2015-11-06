#!/usr/bin/env perl

use Bio::DB::GenBank;
use Bio::SeqIO;
use Data::Dumper;

my $gb = Bio::DB::GenBank->new();

my $seq = $gb->get_Seq_by_gi('5524211'); # GI Number


# my $seq = $gb->get_Seq_by_acc('AAD44166'); # Accession Number
# my $seq = $gb->get_Seq_by_version('AAD44166.1'); # Accession.version
# my $seq = $gb->get_Seq_by_id('5524211'); # Unique ID

print $seq->molecule(), "\n";
print $seq->display_name(), "\n";
print $seq->seq(), "\n";
print $seq->description(), "\n";


my $out = Bio::SeqIO->new(-file => ">outputfilename" ,
                           -format => 'fasta');

$out->write_seq($seq->primary_seq);

