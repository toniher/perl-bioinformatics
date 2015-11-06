#!/usr/bin/env perl

use Data::Dumper;

# Data structure
my %gene = ( 
    "gene" => "BRCA",
    "position" => {
            "start" => 4400, 
            "end" => 8005 
    }
);


# NO
print Dumper(%gene);

# YES
print Dumper(\%gene);


