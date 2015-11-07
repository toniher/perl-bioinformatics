#!/usr/bin/env perl

use Bio::Seq;
use Data::Dumper;

# http://search.cpan.org/dist/BioPerl/Bio/Seq.pm
my $seqobj = Bio::Seq->new( -display_id => 'MySequence',
	-seq => "GATACAGATACA",
	-desc => "New sequence"
);

print Dumper( $seqobj );

use Bio::SeqFeature::Generic;

# http://search.cpan.org/dist/BioPerl/Bio/SeqFeature/Generic.pm
my $feat = Bio::SeqFeature::Generic->new( 
    -start        => 10, 
    -end          => 100,
    -strand       => -1, 
    -primary      => 'repeat', # -primary_tag is a synonym
    -source_tag   => 'repeatmasker',
    -display_name => 'alu family',
    -score        => 1000,
    -tag          => { new => 1,
                       author => 'someone',
                       sillytag => 'this is silly!' } );

$seqobj->add_SeqFeature($feat);

print Dumper( $seqobj );

use Bio::SeqIO;
# http://search.cpan.org/dist/BioPerl/Bio/SeqIO.pm
my $outfasta  = Bio::SeqIO->new(-file => ">myseq.fasta" ,
                       -format => 'Fasta');


$outfasta->write_seq($seqobj);

my $outembl  = Bio::SeqIO->new(-file => ">myseq.embl" ,
                       -format => 'EMBL');
                       
$outembl->write_seq($seqobj);

