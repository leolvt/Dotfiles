#!/bin/bash
#define the filename to use as output
#motd="~/.login/motd"
# Collect useful information about your system
# $USER is automatically defined
HOSTNAME=`uname -n`
KERNEL=`uname -r`
CPU=`uname -p`
ARCH=`uname -m`
DATELINE=`~/.login/data_hora.pl 1`
UP=$(uptime | sed -e 's/.*up\(.*\)/Up\1/')
# The different colours as variables
gray="\033[00;30m"
GRAY="\033[01;30m"
red="\033[00;31m"
RED="\033[01;31m"
green="\033[00;32m"
GREEN="\033[01;32m"
brown="\033[00;33m"
BROWN="\033[01;33m"
blue="\033[00;34m"
BLUE="\033[01;34m"
purple="\033[00;35m"
PURPLE="\033[01;35m"
cyan="\033[00;36m"
CYAN="\033[01;36m"
white="\033[00;37m"
WHITE="\033[01;37m"
NC="\033[00m" # No Color

clear # to clear the screen when showing up
echo -e "${RED}#=============================================================================#"
echo -e ""
echo -e "    ${GREEN}${DATELINE}"
echo -e ""
echo -e "    ${RED}ARCH ${WHITE}= ${BROWN}${ARCH}    ${PURPLE}|    ${RED}KERNEL ${WHITE}= ${BROWN}${KERNEL}"
echo -e "    ${cyan}${UP}"
echo -e ""
echo -e "    ${WHITE}Bem-vindo,${BLUE} ${USER}${WHITE} to${green} ${HOSTNAME}"
echo -e ""
echo -e "${GREEN}#-----------------------------------------------------------------------------#${NC}"
echo -e "\n${WHITE}Fortune of the day: \n${NC}"
#cowsay `fortune -cs`
fortune -cs
echo -e ""
echo -e "${RED}#=============================================================================#${NC}"
