#!/bin/sh

#validate: validate the project is correct and all necessary information is available
#compile: compile the source code of the project
#test: test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
#package: take the compiled code and package it in its distributable format, such as a JAR.
#install: install the package into the local repository, for use as a dependency in other projects locally
#deploy: done in an integration or release environment, copies the final package to the remote repository for sharing with other developers and projects.

#clean: cleans up artifacts created by prior builds
#site: generates site documentation for this project

echo 'Criando arquétivo maven ...'

docker-compose run maven -B archetype:generate -DarchetypeArtifactId=maven-archetype-webapp  -DartifactId=conchayoroapp -DgroupId=br.com.conchayoro -Dpackage=br.com.conchayoro  -Dversion=1.0.0-SNAPSHOT

docker-compose run git status

docker run -it --rm -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven maven mvn clean install -f conchayoroapp/pom.xml

docker run -it --rm -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven maven mvn compile -f conchayoroapp/pom.xml

docker run -it --rm -w /usr/src/mymaven maven mvn clean -f conchayoroapp/pom.xml

===

Parei aqui


9. Criar implantável.

$ mvn package -f conchayoroapp/pom.xml

Observar o resultado de sucesso esperado.

Observar o arquivo .war gerado no diretório “target” do projeto.

$ ls conchayoroapp/target


10. Preparar aplicação para publicação no conteiner web.

$ cp conchayoro/pom.xml-integracao-maven-tomcat conchayoroapp/pom.xml

$ cp conchayoro/settings.xml-integracao-maven-tomcat .m2/settings.xml


Verificar alteração no arquivo pom.xml (na seção build).

$ more conchayoroapp/pom.xml

Verificar configuração do Maven.

$ more .m2/settings.xml


11. Publicar aplicação no conteiner web.

$ mvn tomcat7:redeploy -f conchayoroapp/pom.xml


Caso necessário, alterar permissão para publicação, utilizando o comando a seguir:

$ sudo chmod -R 0755 /opt/tomcat/webapps

Acessar aplicação por meio do navegador.

http://[GUEST_IP]:8080/conchayoroapp





