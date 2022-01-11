#!/bin/bash
cd /etc/apache2/ssl_certs
curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest| grep browser_download_url  | grep linux-amd64 | cut -d '"' -f 4 | wget -qi - 
mv mkcert-v* mkcert
chmod a+x mkcert
mv mkcert /usr/local/bin/
mkcert -CAROOT
cd /etc/apache2/ssl_certs

mkcert localhost 127.0.0.1 ::1