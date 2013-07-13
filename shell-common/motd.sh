#!/bin/sh

HOSTNAME=`uname -n`
KERNEL=`uname -r`
CPU=`uname -p`
ARCH=`uname -m`
#DATELINE=`~/.login/data_hora.pl 1`
DATELINE=`date`
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

# last and current login info
currdate=`last $USER | grep "still" | egrep ":0\s+:0" | head -n 1 | awk '{print $4,$5,$6}'`
currtime=`last $USER | grep "still" | egrep ":0\s+:0" | head -n 1 | awk '{print $7}'`
lastdate=`last $USER | grep -v "still" | egrep ":0\s+:0" | head -n 1 | awk '{print $4,$5,$6}'`
laststart=`last $USER | grep -v "still" | egrep ":0\s+:0" | head -n 1 | awk '{print $7}'`
lastend=`last $USER | grep -v "still" | egrep ":0\s+:0" | head -n 1 | awk '{print $9}'`
lastdur=`last $USER | grep -v "still" | egrep ":0\s+:0" | head -n 1 | awk '{print $10}'`
lastdur=${lastdur:1:5}

echo "Logged in since: $currdate $currtime"
echo ""
echo "    Last login: $lastdate << $laststart >> => << $lastend >> $lastdur"
# Generate the MOTD if needed
perl ~/.config/shell-common/motd-gen.pl

clear # to clear the screen when showing up
echo -e "${RED}#=============================================================================#"
echo -e ""
echo -e "    ${WHITE}Bem-vindo,${BLUE} ${USER}${WHITE} - Host:${green} ${HOSTNAME}"
echo -e ""
echo -e "    ${RED}ARCH ${WHITE}= ${BROWN}${ARCH}    ${PURPLE}|    ${RED}KERNEL ${WHITE}= ${BROWN}${KERNEL}"
echo -e ""
echo -e "    Data/Hora atual: ${GREEN}${DATELINE}"
echo -e "    ${cyan}${UP}"
echo -e ""
echo -e "    ${CYAN}Logado desde: ${BLUE} $currdate${blue}, ${BLUE}$currtime"
echo -e "    ${CYAN}Último login: ${BLUE} $lastdate${blue}, ${BLUE}$laststart ${blue}- ${BLUE}$lastend  ${CYAN}Duração: ${BLUE}$lastdur"
echo -e ""
echo -e "${GREEN}#-----------------------------------------------------------------------------#${NC}"
echo -e "\n${WHITE}Fortune of the day: \n${NC}"
#fortune -cs
sed 1d /tmp/$USER.motd
echo -e ""
echo -e "${RED}#=============================================================================#${NC}"
