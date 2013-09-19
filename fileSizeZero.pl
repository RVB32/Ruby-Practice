#!/usr/bin/perl

sub sizeZero{
  if (-s $ARGV[0] == 0) {
    print "1";
#    return 1;
  }
  else
  {
    print "0";
#    return 0;
  }
}

&sizeZero();
