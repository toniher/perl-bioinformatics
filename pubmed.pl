#!/usr/bin/env perl

use Bio::Biblio;
use Bio::Biblio::IO;
use Bio::Biblio::Ref;
use Data::Dumper;

my $biblio = Bio::Biblio->new( -access => 'eutils' );
$biblio->find("Hermoso A [au] OR Hermoso T [au]");
while ( my $xml = $biblio->get_next ) {
	# Handling in Biblio IO 
	my $io = Bio::Biblio::IO->new( -data => $xml,
                             -format => 'medlinexml' );

	# Handling Biblio Ref
	while ( my $article = $io->next_bibref() ) {
		print "* ", $article->title, "\n";
		print $article->abstract, "\n\n";
	}

}



