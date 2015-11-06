#!/usr/bin/env perl
use strict;
use warnings;
use 5.010; #Version 5.10 at least
use Text::CSV;

my $file = $ARGV[0] // "file.csv";
my $csv = Text::CSV->new ( { binary => 1, sep_char => "\t", quote_char => "", empty_is_undef => 1 } )
                 or die "Cannot use CSV: ".Text::CSV->error_diag ();

open my $fh, "<:encoding(utf8)", "$file" or die "$file: $!";

while ( my $row = $csv->getline( $fh ) ) {

	if ( $row->[2] ) {
		print $row->[2].": ".$row->[3]."-".$row->[4]."\n";
	}
}

