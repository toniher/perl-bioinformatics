#!/usr/bin/env perl
use strict;
use warnings;
use 5.010; #Version 5.10 at least
use Text::CSV;

my $file = $ARGV[0] // "file.csv";
my $csv = Text::CSV->new ( { binary => 1, sep_char => "\t", quote_char => "", empty_is_undef => 1 } )
                 or die "Cannot use CSV: ".Text::CSV->error_diag ();

open my $fh, "<:encoding(utf8)", "$file" or die "$file: $!";

my @rows;

while ( my $row = $csv->getline( $fh ) ) {

	if ( $row->[2] ) {
		print $row->[2].": ".$row->[3]."-".$row->[4]."\n";
		my $list = [ $row->[2], $row->[3], $row->[4] ];
		push( @rows, $list );
	}
}

close $fh;

my $csvout = Text::CSV->new ( { binary => 1, sep_char => ",", quote_char => '\"', eol => "\n" } )
                 or die "Cannot use CSV: ".Text::CSV->error_diag ();

open my $fhout, ">:encoding(utf8)", "out.csv" or die "out.csv: $!";

while ( my $row = shift( @rows ) ) {
	$csvout->print($fhout, $row );
}



close $fhout;
