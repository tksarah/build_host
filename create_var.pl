#!/usr/bin/perl

my $name;
my $cnt=1;
my $start=8080;

open(R,"$ARGV[0]");

print "group:\n";
while (<R>){
	$state = (split/,/,$_)[4];
	if($state eq "参加"){
		$name = (split/,/,$_)[1];
		print "  - { name: '$name' , port: '$start' }\n";
		$start = $cnt + $start;
	}	
}
