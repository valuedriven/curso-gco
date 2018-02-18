#!/bin/sh

touch /var/run/mysqld/mysqld.sock
touch /var/run/mysqld/mysqld.pid
chown -R mysql:mysql /var/run/mysqld/mysqld.sock
chown -R mysql:mysql /var/run/mysqld/mysqld.sock
chmod -R 644 /var/run/mysqld/mysqld.sock

service mysql-server restart
