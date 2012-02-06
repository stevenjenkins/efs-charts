#!/usr/bin/perl

use strict;
use warnings;
use English;

# PSGI
my $app = sub {
  my $env = shift;
  return [
    200,
    ['Content-Type', 'text/plain'],
    ['Hello world'],
    ];
};


