FROM debian:jessie

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install unzip wget build-essential libpcre3 libpcre3-dev libssl-dev

# Downloading nginx RTMP and nginx

RUN cd /tmp && wget http://nginx.org/download/nginx-1.9.10.tar.gz

RUN cd /tmp && wget https://github.com/arut/nginx-rtmp-module/archive/master.zip

RUN cd /tmp && unzip master.zip && tar -xvf nginx-1.9.10.tar.gz

RUN cd /tmp/nginx-1.9.10/ && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master && make && make install

CMD /usr/local/nginx/sbin/nginx -g 'daemon off;'

EXPOSE 80
