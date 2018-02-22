#!/bin/sh

#validate: validate the project is correct and all necessary information is available
#compile: compile the source code of the project
#test: test the compiled source code ing a suitable unit testing framework. These tests should not require the code be packaged or deployed
#package: take the compiled code and package it in its distributable format, such as a JAR.
#install: install the package into the local repository, for use as a dependency in other projects locally
#deploy: done in an integration or release environment, copies the final package to the remote repository for sharing with other developers and projects.

#clean: cleans up artifacts created by prior builds
#site: generates site documentation for this project

echo 'Criando arquétivo maven ...'

docker-compose run maven -B archetype:generate -DarchetypeArtifactId=maven-archetype-webapp  -DartifactId=conchayoroapp -DgroupId=br.com.conchayoro -Dpackage=br.com.conchayoro  -Dversion=1.0.0-SNAPSHOT

docker-compose run maven clean -f conchayoroapp/pom.xml 

sudo cp -r fonte/src/main conchayoroapp/src

sudo cp artefatos/pom.xml-dependencias-integracao-nexus conchayoroapp/pom.xml

docker-compose run maven compile -f conchayoroapp/pom.xml

docker-compose run maven package -f conchayoroapp/pom.xml

ls conchayoroapp/target

#Parei aqui.

cp conchayoro/pom.xml-integracao-maven-tomcat conchayoroapp/pom.xml

cp conchayoro/settings.xml-integracao-maven-tomcat .m2/settings.xml


mvn tomcat7:redeploy -f conchayoroapp/pom.xml

Caso necessário, alterar permissão para publicação, utilizando o comando a seguir:

$ sudo chmod -R 0755 /opt/tomcat/webapps

Acessar aplicação por meio do navegador.

http://[GUEST_IP]:8080/conchayoroapp





