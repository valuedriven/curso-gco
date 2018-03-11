#!/bin/sh

source_dir="src/main"
build_dir=".build"

echo 'Preparando containeres ...'
docker-compose up -d

echo 'Criando estrutura de diretórios para build...'
mkdir -p ${build_dir}/lib
mkdir -p ${build_dir}/META-INF
mkdir -p ${build_dir}/script
mkdir -p ${build_dir}/WEB-INF/classes/META-INF
mkdir -p ${build_dir}/WEB-INF/lib

echo 'Copiando dependências...'
cp ${source_dir}/webapp/WEB-INF/web.xml   ${build_dir}/WEB-INF
cp ${source_dir}/webapp/index.html        ${build_dir}/
cp ${source_dir}/webapp/produto.html      ${build_dir}/
cp ${source_dir}/webapp/lib/angular.js    ${build_dir}/lib
cp ${source_dir}/webapp/script/produto.js ${build_dir}/script

echo "Compilando codigo fonte..."
docker-compose run --rm java javac -verbose -cp 'bibliotecas/*'  -d ${build_dir}'/WEB-INF/classes'  src/main/java/br/com/conchayoro/entity/Produto.java src/main/java/br/com/conchayoro/persistence/ProdutoDao.java  src/main/java/br/com/conchayoro/service/ProdutoService.java

cp ${source_dir}/resources/META-INF/persistence.xml ${build_dir}/WEB-INF/classes/META-INF
cp bibliotecas/* ${build_dir}/WEB-INF/lib

echo "Gerando instalável..."
docker-compose run --rm java jar cvf conchayoro.war -C ${build_dir} .

#echo "Implantando instalável..."

#Utilizar interface gráfica do Tomcat

#echo "Acessando aplicação..."

#curl http://localhost:8080/conchayoro


