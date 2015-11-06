#!/usr/bin/env perl
use strict;
use warnings;
use 5.010; #Version 5.10 at least
use Data::Dumper;
use Text::CSV;

my $file = $ARGV[0] // "file.csv";
my $csv = Text::CSV->new ( { binary => 1, sep_char => ';', empty_is_undef => 1 } )
                 or die "Cannot use CSV: ".Text::CSV->error_diag ();

open my $fh, "<:encoding(utf8)", "$file" or die "$file: $!";

while (<$fh> ) {

	unless ( $_=~/^\#/ ) {
		my $status = $csv->parse($_);
		print $_;
		print Dumper( $csv->fields() );
	}
}


# Finish here
