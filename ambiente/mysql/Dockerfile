#FROM bitnami/mysql:5
#RUN apk add --update --no-cache mysql mysql-client
#ENTRYPOINT ["mysql"]

FROM alpine:3.7

RUN apk add --update mysql mysql-client

COPY init_db.sh /docker-entrypoint-initdb.d/init_db.sh

CMD ["mysqld"]



