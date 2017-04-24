FROM debian:jessie

MAINTAINER Sovanna Hing <sovanna.hing@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY setup.sh /tmp/
RUN /bin/bash /tmp/setup.sh

COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/
COPY svlemp.conf /etc/supervisor/conf.d/

WORKDIR /var/www/

VOLUME /var/www/

EXPOSE 80

COPY entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
