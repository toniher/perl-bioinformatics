#!/usr/bin/env perl

use Bio::EnsEMBL::Registry;

my $registry = 'Bio::EnsEMBL::Registry';

$registry->load_registry_from_db(
    -host => 'ensembldb.ensembl.org', # alternatively 'useastdb.ensembl.org'
    -user => 'anonymous'
);

my $slice_adaptor = $registry->get_adaptor( 'Human', 'Core', 'Slice' );
my $slice = $slice_adaptor->fetch_by_region( 'chromosome', 'X', 1e6, 10e6 );

my $genes = $slice->get_all_Genes();
while ( my $gene = shift @{$genes} ) {
    my $gstring = feature2string($gene);
    print "$gstring\n";

    my $transcripts = $gene->get_all_Transcripts();
    while ( my $transcript = shift @{$transcripts} ) {
        my $tstring = feature2string($transcript);
        print "\t$tstring\n";

        foreach my $exon ( @{ $transcript->get_all_Exons() } ) {
            my $estring = feature2string($exon);
            print "\t\t$estring\n";
        }
    }
}

sub feature2string
{
    my $feature = shift;

    my $stable_id  = $feature->stable_id();
    my $seq_region = $feature->slice->seq_region_name();
    my $start      = $feature->start();
    my $end        = $feature->end();
    my $strand     = $feature->strand();

    return sprintf( "%s: %s:%d-%d (%+d)",
        $stable_id, $seq_region, $start, $end, $strand );
}
