#!/bin/sh

echo 'Criando estrutura de diretórios para build...'
build_dir="build"
mkdir -p ${build_dir}
mkdir -p ${build_dir}/lib
mkdir -p ${build_dir}/META-INF
mkdir -p ${build_dir}/script
mkdir -p ${build_dir}/WEB-INF/classes/META-INF
mkdir -p ${build_dir}/WEB-INF/lib

echo "Compilando codigo fonte..."
docker-compose run java javac -verbose -cp 'bibliotecas/*'  -d ${build_dir}'/WEB-INF/classes'  fonte/src/main/java/br/com/conchayoro/entity/Produto.java fonte/src/main/java/br/com/conchayoro/persistence/ProdutoDao.java  fonte/src/main/java/br/com/conchayoro/service/ProdutoService.java

echo 'Copiando dependências...'
cp fonte/src/main/webapp/WEB-INF/web.xml ${build_dir}/WEB-INF
cp fonte/src/main/webapp/index.html ${build_dir}/
cp fonte/src/main/webapp/produto.html ${build_dir}/
cp fonte/src/main/webapp/lib/angular.js ${build_dir}/lib
cp fonte/src/main/webapp/script/produto.js ${build_dir}/script
cp fonte/src/main/resources/META-INF/persistence.xml ${build_dir}/WEB-INF/classes/META-INF
cp bibliotecas/* ${build_dir}/WEB-INF/lib

echo "Gerando instalável..."
docker-compose run java jar cvf conchayoro.war -C ${build_dir} .

#echo "Implantando instalável..."

#Utilizar interface gráfica do Tomcat

#echo "Acessando aplicação..."

#curl http://localhost:8080/conchayoro

