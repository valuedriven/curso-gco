FROM httpd:2.4.29-alpine

RUN apk add --update git && \
    a2enmod cgi alias env

RUN cat git.conf >> /etc/apache2/httpd.conf

VOLUME /data/git

EXPOSE 80

