#!/usr/bin/perl

my $name;
my $cnt=1;
my $x=0;
my $start=8081;
my $tty_start=3001;
my $htty=0;
my $ttty=0;

open(R,"$ARGV[0]");

print "group:\n";
while (<R>){
	$state = (split/,/,$_)[4];
	if($state eq "参加"){
		$name = (split/,/,$_)[1];
		$htty = $tty_start;
		$ttty = $htty + 1;
		print "  - { name: '$name' , port: '$start' , htty: '$htty' , ttty: '$ttty' }\n";
		$start = $cnt + $start;
		$tty_start = $cnt + $ttty;
	}	
}

# Additional user
while ($x < 6){
	$start = $start + $x;
	$htty = $tty_start;
	$ttty = $htty + 1;
	print "  - { name: 'user$x' , port: '$start' , htty: '$htty' , ttty: '$ttty' }\n";
	$tty_start = $x + $ttty;
	$x++;
}
print "  - { name: 'takeshi' , port: '8200' , htty: '3201' , ttty: '3202' }\n";
close(R);
