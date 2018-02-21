FROM tomcat:alpine

EXPOSE 8080

#COPY ./init_web.sh /docker-entrypoint-initdb.d/init_web.sh

#COPY ./../lib/mysql-connector-java-5.1.5.jar /usr/local/tomcat/lib

COPY ./tomcat-users.xml /usr/local/tomcat/conf

COPY ./context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml



