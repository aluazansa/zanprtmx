#zanprtmx

# (Fix Manual) Fix Stunnel5 Error
* buat domain baru(bash slhost.sh)
```html
cd /usr/bin && wget https://raw.githubusercontent.com/aluazansa/zanprtmx/main/slhost.sh
 ```

* edit manual ip domain
```html
nano /var/lib/crot/ipvps.conf
 ```
```html
IP=masukan host subdomain kamu
 ```

* edit manual domain
```html
nano /etc/xray/domain
 ```
```html
isi dengan host subdomain kamu
 ```

* lalu update cert
```html
wget https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray/certv2ray.sh && chmod +x certv2ray.sh && bash certv2ray.sh
 ```
* atau
```html
certv2ray
 ```
