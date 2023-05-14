#!/bin/bash
merah='\e[1;31m'
hijau='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y
rm -f /root/domain
rm -f /etc/v2ray/domain
rm -f /etc/xray/domain
rm -rf /etc/xray/domain
rm -rf /root/nsdomain
rm -rf /var/lib/crot/ipvps.conf
rm nsdomain
domain rm
mkdir -p /usr/bin/xray
mkdir -p /usr/bin/v2ray
mkdir -p /etc/xray
mkdir -p /etc/v2ray
echo "$SUB_DOMAIN" >> /etc/v2ray/domain
#
sub=$(</dev/urandom tr -dc a-z0-9 | head -c5)
subsl=$(</dev/urandom tr -dc a-z0-9 | head -c5)
DOMAIN=zanprtmx.my.id
SUB_DOMAIN=zanprtmx-${sub}.zanprtmx.my.id
NS_DOMAIN=zerosl-${sub}.zanprtmx.my.id
CF_ID=visedal502@xunleu.com
CF_KEY=cbde4ee98873c27dac57e619238acd7428425
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Memperbarui DNS untuk ${SUB_DOMAIN}..."
ZONE=$(curl -sLX DAPATKAN "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=aktif" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" | jq -r .result[0].id)

RECORD=$(curl -sLX DAPATKAN "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; Kemudian
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false }' | jq -r .result.id)
fi

HASIL=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false }')
echo "Memperbarui DNS NS untuk ${NS_DOMAIN}..."
ZONE=$(curl -sLX DAPATKAN "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=aktif" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" | jq -r .result[0].id)

RECORD=$(curl -sLX DAPATKAN "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; Kemudian
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" \
     --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false }' | jq -r .result.id)
fi

HASIL=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci X-Auth: ${CF_KEY}" \
     -H "Tipe-Konten: aplikasi/json" \
     --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${SUB_DOMAIN}'","ttl":120,"proxied":false }')
rm -rf /etc/xray/domain
rm -rf /root/nsdomain
echo "IP=""$SUB_DOMAIN" >> /var/lib/crot/ipvps.conf
gema "Host : $SUB_DOMAIN"
gema $SUB_DOMAIN > /root/domain
gema "Host SlowDNS : $NS_DOMAIN"
echo "$NS_DOMAIN" >> /root/nsdomain
echo "$SUB_DOMAIN" >> /etc/xray/domain
CD