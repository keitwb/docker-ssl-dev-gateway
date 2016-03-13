FROM nginx:1.9.11
MAINTAINER Ben Keith <keitwb@gmail.com>

ENTRYPOINT ["/entrypoint"]
VOLUME ["/etc/nginx/ssl"]

RUN rm /etc/nginx/conf.d/default.conf

COPY entrypoint /entrypoint
COPY dev.conf /etc/nginx/dev.conf.template
