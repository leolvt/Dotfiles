#!/bin/bash
#define the filename to use as output
#motd="~/.login/motd"
# Collect useful information about your system
# $USER is automtically defined
HOSTNAME=`uname -n`
KERNEL=`uname -r`
CPU=`uname -p`
ARCH=`uname -m`
DATELINE=`~/.login/data_hora.pl 1`
UP=$(uptime | sed -e 's/.*up\(.*\)/up&1/')
# The different colours as variables
W="\033[01;37m"
Y="\033[01;30m"
B="\033[01;34m"
G="\033[01;32m"
P="\033[01;35m"
R="\033[01;31m" 
X="\033[00;37m"
clear # to clear the screen when showing up
echo -e "$R#=============================================================================#"
echo -e ""
echo -e "   $G $DATELINE"
echo -e ""
echo -e "   $R ARCH    $W= $ARCH $B|$R KERNEL    $W= $KERNEL             "
echo -e "   $W $UP$W"
echo -e ""
echo -e "   $W Bem-vindo, $B $USER $W to $B $HOSTNAME                "
echo -e ""
echo -e "$R#=============================================================================#$X"
#echo -e "$X"

