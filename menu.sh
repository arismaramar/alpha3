#!/bin/bash
# COLOR VALIDATION

clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
#INTALLER-UDP
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl data_ip="https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $MYIP | awk '{print $2}')

echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl data_ip="https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $MYIP | awk '{print $3}')

echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)

}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | ANGGUN  Project
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl data_ip="https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $MYIP | awk '{print $3}')

if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | ANGGUN  Project
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
WKT=$(curl /etc/xray/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipv4.icanhazip.com )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | ANGGUN  Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON✓${NC}"
else
   status_ssh="${RED}❌️${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON✓${NC}"
else
    status_ws_epro="${RED}❌️${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON✓${NC}"
else
   status_haproxy="${RED}❌️${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON✓${NC}"
else
   status_xray="${RED}❌️${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON✓${NC}"
else
   status_nginx="${RED}❌️${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON✓${NC}"
else
   status_dropbear="${RED}❌️${NC} "
fi
#####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
r="\033[1;31m"  #REDTERANG
a=" ${CYAN}ACCOUNT PREMIUM" 
## CLEAR CACHE VPS
run_cc () {
sudo sync
sudo echo 1 > /proc/sys/vm/drop_caches
sudo sync
sudo echo 2 > /proc/sys/vm/drop_caches
sudo sync
sudo echo 3 > /proc/sys/vm/drop_caches
}

## CLEAR ACOUNT EXPIRED
run_exp () {
xp
}


echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${YELL}│$NC\033[41mANGGUN_TUNNEL PREMIUM $NC${YELL}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y System OS ${NC}     $Blue=$NC $MODEL${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y Server RAM ${NC}    $Blue=$NC $RAM MB $NC"
echo -e " ${z}│$NC$r ⇲ $NC$y USAGE RAM ${NC}     $Blue=$NC $USAGERAM MB $NC"
echo -e " ${z}│$NC$r ⇲ $NC$y CPU---LOAD ${NC}    $Blue=$NC $LOADCPU % $NC"
echo -e " ${z}│$NC$r ⇲ $NC$y Name ISP ${NC}      $Blue=$NC $ISP${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y CITY ${NC}          $Blue=$NC $CITY${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y IP VPS${NC}         $Blue=$NC $IPVPS${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y DOMAIN ${NC}        $Blue=$NC $domain${NC}"
echo -e " ${z}│$NC$r ⇲ $NC$y UPTIME ${NC}        $Blue=$NC $SERONLINE${NC}"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "                ${KIRI} ${purple}𝕀𝕟𝕗𝕠𝕣𝕞𝕒𝕥𝕚𝕠𝕟 𝔸𝕔𝕔𝕠𝕦𝕟𝕥${NC} ${KANAN}"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "           ${CYAN}SSH/OPENVPN ${NC}   $y=$NC $ssh1${NC}" "$a"
echo -e "           VMESS/WS/GRPC ${NC} $y=$NC $vma$NC" "$a"
echo -e "           VLESS/WS/GRPC ${NC} $y=$NC $vla$NC" "$a"
echo -e "           TROJAN/WS/GRPC ${NC}$y=$NC $trb${NC}" "$a"
echo -e "           SHADOW/WS/GRPC ${NC}$y=$NC $ssa${NC} $a"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "               ${KIRI} ${purple}𝕁𝕒𝕟𝕘𝕒𝕟 𝕃𝕦𝕡𝕒 𝔹𝕖𝕣𝕓𝕒𝕘𝕚 𝕐𝕒${NC} ${KANAN}"
echo -e " ${z}╭════════════════╮╭══════════════════╮╭════════════════════╮${NC}"
echo -e " ${z}│ ${NC}$y SSH$NC : $status_ssh" "       $y NGINX$NC : $status_nginx" "        $y XRAY$NC : $status_xray       $NC${z}│$NC" 
echo -e " ${z}│ ${NC}$y WS-ePRO$NC : $status_ws_epro" "   $y DROPBEAR$NC : $status_dropbear" "     $y HAPROXY$NC : $status_haproxy    $NC${z}│$NC" 
echo -e " ${z}╰════════════════╯╰══════════════════╯╰════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC [${r}01${NC}]$purple SSH MENU$NC     ${z}│$NC [${r}08${NC}]$purple DELL ALL EXP$NC ${z}│$NC [${r}15${NC}]$purple BCKP/RSTR   $NC${z}│$NC"
echo -e " ${z}│$NC [${r}02${NC}]$purple VMESS MENU$NC   ${z}│$NC [${r}09${NC}]$purple AUTOREBOOT$NC  ${z} │$NC [${r}16${NC}]$purple REBOOT      $NC${z}│$NC"    
echo -e " ${z}│$NC [${r}03${NC}]$purple VLESS MENU$NC   ${z}│$NC [${r}10${NC}]$purple INFO PORT$NC   ${z} │$NC [${r}17${NC}]$purple RESTART     $NC${z}│$NC"   
echo -e " ${z}│$NC [${r}04${NC}]$purple TROJAN MENU$NC  ${z}│$NC [${r}11${NC}]$purple SPEEDTEST$NC   ${z} │$NC [${r}18${NC}]$purple DOMAIN      $NC${z}│$NC" 
echo -e " ${z}│$NC [${r}05${NC}]$purple SHADOW MENU$NC  ${z}│$NC [${r}12${NC}]$purple RUNNING$NC     ${z} │$NC [${r}19${NC}]$purple CERT SSL    $NC${z}│$NC"
echo -e " ${z}│$NC [${r}06${NC}]$purple TRIAL MENU$NC   ${z}│$NC [${r}13${NC}]$purple CLEAR LOG$NC   ${z} │$NC [${r}20${NC}]$purple INS. UDP    $NC${z}│$NC"
echo -e " ${z}│$NC [${r}07${NC}]$purple VPS INFO$NC     ${z}│$NC [${r}14${NC}]$purple CREATE SLOW$NC ${z} │$NC [${r}21${NC}]$purple CLEAR CACHE $NC${z}│$NC"
echo -e " ${z}│$NC [${r}22${NC}]$purple BOT MENU$NC     ${z}|$NC [${r}23${NC}]$purple UPDATE SCRIPT$NC${z}|$NC [${r}24${NC}]$purple EDIT BANNER $NC${z}│$NC"
echo -e " ${z}│                                                          $NC${z}│$NC"
echo -e " ${z}│$NC [${r}00${NC}]$purple BACK TO EXIT MENU$NC ${KANAN} \E[0m\033[0;34m                              $NC${z}│$NC"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC$y Version$NC       ${Blue}=$NC$Y V3.0"
echo -e " ${z}│$NC$y Provider$NC      ${Blue}=$NC$RED ANGGUN_TUNNEL PREMIUM"
echo -e " ${z}│$NC$y Whatsapp$NC      ${Blue}=$NC$purple 6285365581599"
echo -e " ${z}│$NC$y User Buyer$NC    ${Blue}=$NC$purple $username"
echo -e " ${z}│$NC$y Script Status$NC ${Blue}=$NC $sts "
echo -e " ${z}│$NC$y Expiry script$NC ${Blue}=$green $exp$NC($r $certifacate ${NC}Days )"
echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo
read -p " ☞︎︎︎ 𝙎𝙞𝙡𝙖𝙝𝙠𝙖𝙣 𝙋𝙞𝙡𝙞𝙝 𝙈𝙚𝙣𝙪 𝘿𝙞𝙖𝙩𝙖𝙨 : " opt

case $opt in
1 | 01)
clear
run_cc
run_exp
m-sshws
;;
2 | 02)
clear
run_cc
run_exp
m-vmess
;;
3 | 03)
clear
run_cc
run_exp
m-vless
;;
4 | 04)
clear
run_cc
run_exp
m-trojan
;;
5 | 05)
clear
run_cc
run_exp
m-ssws
;;
6 | 06)
clear
run_cc
run_exp
m-trial
;;
7 | 07)
clear
run_cc
run_exp
gotop
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
8 | 08)
clear
run_cc
run_exp
xp
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
9 | 09)
clear
run_cc
run_exp
autoreboot
;;
10)
clear
run_cc
run_exp
prot
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
11)
clear
run_cc
run_exp
speedtest
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
12)
clear
run_cc
run_exp
run
;;
13)
clear
run_cc
run_exp
echo "CLEAR LOG DONE"
sleep 2
menu
;;
14)
clear
run_cc
run_exp
sd
;;
15)
clear
run_cc
run_exp
menu-backup
;;
16)
clear
run_cc
run_exp
reboot
;;
17)
clear
run_cc
run_exp
restart
;;
18)
clear
run_cc
run_exp
addhost
;;
19)
clear
run_cc
run_exp
fixcert
;;
20)
clear
run_cc
run_exp
echo -e "${green}ANDA YAKIN UNTUK MEMASANG SCRIPT INI ? $NC"
echo -e "${green}MINIMAL RAM 2 GB BIAR DISK TIDAK FULL $NC"
echo -e "${green}OS SUPPORT UBUNTU 20.04 ONLY $NC"

read -p "SUDAH LAPOR KE ADMIN ? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  echo -e "${green}START. . . $NC"
elif [[ $arg == 'y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  clear
  echo -e "${Blue}START . . .$NC"
elif [[ $arg == 'N' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  menu
  exit 0
elif [[ $arg == 'n' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
else
  echo -e "${RED}Argumen Tidak Diketahui! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
fi
##########
clear
wget https://raw.githubusercontent.com/Rerechan02/UDP/main/ssh/udp.sh && chmod +x udp.sh && ./udp.sh
;;
21)
clear
run_cc
run_exp
echo "CLEAR LOG DONE"
sleep 2
menu
;;
22)
clear
run_cc
run_exp
bot
;;
23)
clear
run_cc
run_exp
echo -e "${green}ANDA YAKIN UNTUK UPDATE SCRIPT INI ? $NC"
echo -e "${green}MINIMAL RAM 2 GB BIAR DISK TIDAK FULL $NC"
echo -e "${green}OS SUPPORT UBUNTU 20.04 ONLY $NC"
upsc
;;
24)
clear
run_cc
run_exp
nano /etc/issue.net
menu
;;
0 | 00)
figlet ANGGUN PROJECT
exit
;;
x)
run_cc
run_exp
menu
;;
*)

run_cc
run_exp
menu
;;
esac
