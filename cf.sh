#!/bin/bash
merah='\e[1;31m'
hijau='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
gema "api.cloudflare.com"
jernih
apt install jq curl -y
DOMAIN=makmurvpn.tk
sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
SUB_DOMAIN=server-${sub}.makmurvpn.tk
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
gema "Host : $SUB_DOMAIN"
gema $SUB_DOMAIN > /root/domain
gema $SUB_DOMAIN > /etc/v2ray/domain