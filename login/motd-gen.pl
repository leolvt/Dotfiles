
#!/usr/bin/perl

use strict;

my $CookieFile = "/tmp/motd";

my @Now = localtime(time());
my $Today = "$Now[3]-$Now[4]-".($Now[5]+1900);

# Check if we already have a valid motd file
if (-f $CookieFile) {

	# Open and read the MOTD file
	open(COOKIE,"<", $CookieFile) or die("Failed to open '$CookieFile'\n");
	my @motd = <COOKIE>;
	close(COOKIE);

	# Get the "Day Stamp"
	my $CookieDate = $motd[0];
	chomp($CookieDate);
	
	# Generate new MOTD if MOTD is not of today
	GenMOTD() unless ($CookieDate eq $Today); 
}
else { GenMOTD(); }

# Generate a new MOTD
sub GenMOTD() {
	open(COOKIE,">", $CookieFile) or die("Failed to create '$CookieFile'\n");
	print COOKIE "$Today\n";
	close(COOKIE);
	#system ("cowsay `fortune -cs` >> $CookieFile");
	system ("fortune -cs >> $CookieFile");
}
