#!/bin/bash
PCRE_URL="https://jaist.dl.sourceforge.net/project/pcre/pcre/8.41/"
PCRE_NAME="pcre-8.41"
PCRE_SUFFIX=".tar.bz2"

# install pcre
cd /usr/local/src
echo `pwd`
echo '--------------------------- download pcre -----------------------------------------'
wget $PCRE_URL$PCRE_NAME$PCRE_SUFFIX
tar -xvf $PCRE_NAME$PCRE_SUFFIX
cd ./$PCRE_NAME
echo '--------------------------- start install pcre -----------------------------------------'
./configure&&make&&make install
cd ..
rm $PCRE_NAME$PCRE_SUFFIX
echo '--------------------------- pcre install finished! --------------------------------'


echo '--------------------------- start install nginx -------------------------------'
cd /usr/local/src
wget http://nginx.org/download/nginx-1.12.2.tar.gz
tar -zxvf nginx-1.12.2.tar.gz
cd nginx-1.12.2

./configure --sbin-path=/usr/local/nginx/nginx \
	--conf-path=/usr/local/nginx/nginx.conf \
	--pid-path=/usr/local/nginx/nginx.pid \
	--with-http_ssl_module \
	--with-pcre=/usr/local/src/pcre-8.41

make
make install
rm /usr/local/src/nginx-1.12.2.tar.gz
echo '---------------------------- install nginx finished --------------------------'

