#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
 
use HTTP::Tiny;
 
my $http = HTTP::Tiny->new();
 
my $server = 'http://rest.ensembl.org';
my $ext = '/taxonomy/id/9606?';
my $response = $http->get($server.$ext, {
  headers => { 'Content-type' => 'application/json' }
});
 
die "Failed!\n" unless $response->{success};

use JSON;

if(length $response->{content}) {
  my $hash = decode_json($response->{content});

  print $hash->{"scientific_name"}, "\n";

}

