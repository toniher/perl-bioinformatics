#!/usr/bin/env perl

use Text::Trim;

my $text = " That's all folks! ";

print "*".ltrim( $text )."*\n";
print "*".rtrim( $text )."*\n";
print "*".trim( $text )."*\n";

print "*".$text."*\n";

trim( $text );

print "*".$text."*\n";
