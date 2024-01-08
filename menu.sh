#!/bin/bash
clear
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/4
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
clear
# ==================================================
#EXPIRED
xp    
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33;1m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
ori='\e[32;1m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
echo 1 > /proc/sys/vm/drop_caches
run_izin() {
  # Disable IPv6
  sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
  sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
  
  # Link izin IP VPS

  url_izin='https://raw.githubusercontent.com/arismaramar/izin/main/izin.txt'

  # Mendapatkan IP VPS saat ini
  ip_vps=$(curl -s ifconfig.me)

  # Mendapatkan isi file izin.txt dari URL
  izin=$(curl -s "$url_izin")

  # Memeriksa apakah konten izin.txt berhasil didapatkan
  if [[ -n "$izin" ]]; then
    while IFS= read -r line; do
      # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
      nama=$(echo "$line" | awk '{print $1}')
      ipvps=$(echo "$line" | awk '{print $2}')
      tanggal=$(echo "$line" | awk '{print $3}')

      # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
      if [[ "$ipvps" == "$ip_vps" ]]; then
        echo "Nama VPS: $nama"
        echo "IP VPS: $ipvps"
        echo "Tanggal Kadaluwarsa: $tanggal"
        break
      fi
    done <<< "$izin"

    # Memeriksa apakah IP VPS ditemukan dalam izin.txt
    if [[ "$ipvps" != "$ip_vps" ]]; then
      # Add your message here for when the VPS doesn't have permission
clear
      echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
      echo -e "                 • ANGGUN_PREMIUM SEDERHANA •                 "
      echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
      echo -e ""
      echo -e "\e[93m Nama\e[32;1m   : $nama "
      echo -e "\e[93m IP VPS\e[32;1m : $ip_vps"
      echo -e "\e[93m Domain\e[32;1m : $(cat /etc/xray/domain)"
      echo -e ""
      echo -e "\e[93m SSH\e[32;1m    : LOCKED "
      echo -e "\e[93m VMESS\e[32;1m  : LOCKED "
      echo -e "\e[93m VLESS\e[32;1m  : LOCKED "
      echo -e "\e[93m TROJAN\e[32;1m : LOCKED "
      echo -e ""        
      echo -e "${red} VPS Anda Tidak Izinkan \e[32;1m "
      echo -e "${red} Contact Admin UTK MASUK\e[32;1m" | lolcat
      echo -e ""
      echo -e "\e[93m Telegram\e[32;1m : https://t.me/amantubilah"
      echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
      echo -e ""
      exit 0
    fi
  else
    echo "Konten izin.txt tidak berhasil didapatkan dari URL"
    exit 0
  fi
  clear
}
run_izin
run_exp() {
xp
}      
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
ISP=$(cat /root/.myisp)
CITY=$(cat /root/.mycity)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(cat /root/.myip)
UPDATE="https://raw.githubusercontent.com/arismaramar/izin/main/"
clear
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
r="\033[1;31m" 
g="\033[1;92m"
w="\033[1;36m"
clear
echo -e " ───────────────────────────────────────────────────── " | lolcat
echo -e " \e[1;97;41m     ANGGUN_TUNNEL PREMIUM           \033[0m"
echo -e " ─────────────────────────────────────────────────────" | lolcat
echo -e " $w ⇲ $NC${r} SYSTEM OS    \033[1;93m =$NC "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e " $w ⇲ $NC${r} IP VPS       \033[1;93m =$NC $(cat /root/.myip)"
echo -e " $w ⇲ $NC${r} ISP          \033[1;93m =$NC $(cat /root/.isp)"
echo -e " $w ⇲ $NC${r} CITY         \033[1;93m =$NC $(cat /root/.city)"
echo -e " $w ⇲ $NC${r} DOMAIN       \033[1;93m =$NC $domain"	
echo -e " $w ⇲ $NC${r} DATE & TIME  \033[1;93m =$NC $DATE2"	
echo -e " $w ⇲ $NC${r} UPTIME       \033[1;93m =$NC $uptime"
echo -e " ───────────────────────────────────────────────────── " | lolcat
echo -e " \e[1;97;41m                TOTAL ACCOUNT ON VPS                \033[0m"
echo -e " ─────────────────────────────────────────────────────" | lolcat
echo -e "  ${r}SSH / WS / UDP / DNS  \033[1;93m=$NC $ssh1"
echo -e "  ${r}VMESS / WS / GRPC     \033[1;93m=$NC $vma"
echo -e "  ${r}VLESS / WS / GRPC     \033[1;93m=$NC $vla"
echo -e "  ${r}TROJAN / WS / GRPC    \033[1;93m=$NC $tra"
echo -e " ───────────────────────────────────────────────────── " | lolcat
echo -e " \e[1;97;41m                    SCRIPT MENU                      \033[0m"
echo -e " ─────────────────────────────────────────────────────" | lolcat
echo -e "     ${g}1. ${w}MENU SSH          ${g}6. ${w}STATUS SERVICE"
echo -e "     ${g}2. ${w}MENU VMESS        ${g}7. ${w}UPDATE SCRIPT"
echo -e "     ${g}3. ${w}MENU VLESS        ${g}8. ${w}ADD BOT TELEGRAM"
echo -e "     ${g}4. ${w}MENU TROJAN       ${g}9. ${w}CHANGE BANNER SSH"
echo -e "     ${g}5. ${w}MENU SYSTEM       ${g}x. ${w}EXIT PANEL SCRIPT"
echo -e " ───────────────────────────────────────────────────── " | lolcat
echo -e " ${r}HARI ini${NC} \033[1;93m=$NC ${red}$ttoday${NC}. ${r}KEMARIN${NC} \033[1;93m=${NC} ${red}$tyest${NC}. ${r}BULAN${NC} \033[1;93m=${NC} ${red}$tmon$NC"
echo -e " ───────────────────────────────────────────────────── " | lolcat
echo -e "  ${r}Script Version \E[0m\033[1;93m=$NC V1.0"
echo -e "  ${r}Client Name    \E[0m\033[1;93m=$NC $nama"
echo -e "  ${r}Script Expired \E[0m\033[1;93m=$NC $tanggal"
echo -e " ───────────────────────────────────────────────────── " | lolcat
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; run_izin ; menu-ssh ;;
2) clear ; run_izin ; menu-vmess ;;
3) clear ; run_izin ; menu-vless ;;
4) clear ; run_izin ; menu-trojan ;;
5) clear ; run_izin ; menu-system ;;
6) clear ; run_izin ; running ;;
7) clear ; run_izin ; wget ${UPDATE}update.sh && chmod +x update.sh && ./update.sh ;;
8) clear ; run_izin ; bot ;;
9) clear ; run_izin ; nano /etc/issue.net ;;
x) exit ;;
*) echo "Anda Salah Tekan " ; sleep 1 ; menu ;;
esac
