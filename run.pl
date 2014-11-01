#!/usr/bin/env perl

use strict;
use warnings;

use Term::ANSIColor;

# ============= #

sub parse_args() {
	use Getopt::Long qw(:config bundling);
	use Pod::Usage;
	my $help = 0;
	my $man = 0;
	my $action   = "";

	GetOptions(
		"install|i" =>	sub { pod2usage("Only action allowed") if $action; $action = "install" },
		"update|u"  =>	sub { pod2usage("Only action allowed") if $action; $action = "update" },
		"uninstall|r"  => sub { pod2usage("Only action allowed") if $action; $action = "uninstall" },
		'help|h' => \$help,
		'man|m' => \$man
	) or pod2usage(2);
	pod2usage(-verbose => 0) if $help;
	pod2usage(-verbose => 2) if $man;
	$action = "update" unless $action;

	## If no arguments were given, then allow STDIN to be used only
	## if it's not connected to a terminal (otherwise print usage)
	#pod2usage("$0: No files given.")  if ((@ARGV == 0) && (-t STDIN));

	return ("action" => $action);
}

# ============= #

sub get_modules() {
	use Cwd;
	use File::Basename;

	my $dir = getcwd;
	my @list = `ls */run.pl 2>/dev/null`;
	#my @list = ("/run.pl", "abc/run.pl", "abc/def/run.pl");
	chomp(@list);

	my @modules = ();
	for my $path (@list) {
		my $name = basename(dirname($path));
		push(@modules, $name);
	}
	#return ("base", "shell-common", "bash", "zsh", "vim", "git", "various");
	return @modules;
}

# ============= #

sub do_stuff($$) {
	my $module = shift();
	my $action = shift();
	print colored ["rgb231"], "	[*] Action $action, Module: $module\n";
}

# ============= #

sub main($) {
	my %args = %{shift()};
	my @modules = get_modules();
	print colored ['rgb053'], "==========================", "\n";
	print "", "\n";
	print colored ['bold rgb331'], "  Hello! Welcome to the great Dotfiles script!", "\n";
	print "", "\n";
	print colored ['bold rgb431'], "  => Action selected: ", colored ['rgb540'], "$args{action}", "\n";
	print colored ['bold rgb431'], "  => Available modules:", "\n";
	for my $module (@modules) {
		print colored ['rgb531'], "	* $module", "\n";
	}
	print "", "\n";
	print colored ['rgb053'], "==========================", "\n";
	print "", "\n";
	print colored ['bold rgb351'], "  [=] Starting execution!", "\n";
	for my $module (@modules) {
		do_stuff($module, $args{action});
	}
	print "", "\n";
}

# =========================================================================== #
# Here is the entry point. Start the actual execution of the scripts here!
# =========================================================================== #

## Parse options and print usage if there is a syntax error,
## or if usage was explicitly requested.
my %args = parse_args();

main(\%args);

# =========================================================================== #
# END OF THE SCRIPT
# =========================================================================== #

__END__

=head1 NAME

run - Install / Update / Uninstall dotfiles

=head1 SYNOPSIS

run [options] action

 Options:
   --help, -h			brief help message
   --man, -m			 full documentation

 Action:
   --install, -i		 install configuration files
   --update, -u		  update the installed configuration files (default action)
   --uninstall, -r	   remove the installed configuration files

=head1 DESCRIPTION

B<This program> will install, update or uninstall the configuration files, as specified.

=cut
