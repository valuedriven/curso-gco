FROM mysql:5

COPY init_db.sh /docker-entrypoint-initdb.d/init_db.sh

CMD ["mysqld"]

#FROM alpine

#ENV MYSQL_ROOT_PASSWORD=rootpwd

#RUN echo "Instalando MySql..." \
#echo "mysql-server-5.5 mysql-server/root_password password 1234" | debconf-set-selections \
#echo "mysql-server-5.5 mysql-server/root_password_again password 1234" | debconf-set-selections \
#apt-get install mysql-server -y \
#systemctl daemon-reload \
#systemctl enable mysql.service \
#systemctl stop mysql.service \
#sed '/\[mysqld\]/a skip-grant-tables' -i /etc/mysql/my.cnf \
#systemctl start mysql.service \
#mysql -u root -p1234 mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD'); flush privileges;" \
#sed '/skip-grant-tables/d' /etc/mysql/my.cnf \
#systemctl restart mysql.service


