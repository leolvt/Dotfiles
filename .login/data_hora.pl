#!/usr/bin/perl

use strict;

&Main;

# Imprime a Data
sub PrintDateTime {
	
	# Nomes dos Dias da Semana
	my @Weekdays = ('Domingo', 'Segunda-Feira', 'Terça-Feira', 'Quarta-Feira',
	 	'Quinta-Feira', 'Sexta-Feira', 'Sábado');
	 	
	# Nomes dos Meses
	my @Months = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 
		'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');

	# Obtem Hora Local
	my @Now = localtime(time());

	# Extrai Mês, Dia da Semana, Dia e Hora
	my $Month = $Months[$Now[4]];
	my $Weekday = $Weekdays[$Now[6]];
	my $Hour = $Now[2];
	my $Day = $Now[3];

	# Ajusta AM - PM
	# e Hora (12 / 24)
	my $AMPM = "";
	my $useAMPM = shift;
	
	if ( $useAMPM ) {
		if ($Hour > 12) {
		   $Hour = $Hour - 12;
		   $AMPM = "PM";
		} else {
		   $Hour = 12 if $Hour == 0;
		   $AMPM ="AM";
		}
	}
	
	# Extrai Minutos
	my $Minute = $Now[1];

	# Completa os minutos com um 0 na frente se for menor que 10
	$Minute = "0$Minute" if $Minute < 10;
	
	# Ajusta ano
	my $Year = $Now[5]+1900;

	# Imprime
	my $Format = "$Weekday, $Day de $Month de $Year - $Hour:$Minute $AMPM\n";
	print $Format;

}


# Imprime Modo de Uso
sub PrintUsage {
	
	my $ProgramName = "DataHora";
	
	print "\n";
	print "Modo de Uso: $ProgramName TIPO\n";
	print "-----------------------------\n";
	print "TIPO:\n";
	print "     0 -> 24 Horas\n";
	print "     1 -> 12 Horas\n";
	print "\n";
	
}

# Rotina Principal
sub Main {
	if ($#ARGV < 0)
	{
		PrintUsage();
	} else {
		my $arg = $ARGV[0];
		PrintDateTime( $arg );
	}
}
