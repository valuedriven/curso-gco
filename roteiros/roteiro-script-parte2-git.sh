#!/bin/sh

echo 'Preparando containeres ...'

docker-compose up -d

echo 'Definindo variáveis de ambiente ...'
echo '==========================================================================='

docker-compose run --rm git config --global user.name "concha.yoro"
docker-compose run --rm git config --global user.email "user@conchayoro.com.br"

echo 'Criando repositório ...'
echo '==========================================================================='

docker-compose run --rm git init

echo 'Verificando status do repositório ...'
echo '==========================================================================='

docker-compose run --rm git status

echo 'Estagiando arquivos no repositório ...'
echo '==========================================================================='

docker-compose run --rm git add ambiente/* bancoscript/* bibliotecas/* documentacao/* roteiros/* src/*
docker-compose run --rm git add README.md docker-compose.yml pom.xml


echo 'Verificando status do repositório ...'
echo '==========================================================================='

docker-compose run --rm git status

echo 'Commitando arquivos no repositório ...'
echo '==========================================================================='

docker-compose run --rm git commit -m "Versão inicial do projeto"

echo 'Criando uma tag ...'
echo '==========================================================================='

docker-compose run --rm git tag -a v1.0.0 -m "Versão inicial"

echo 'Listando tags ...'
echo '==========================================================================='

docker-compose run --rm git tag

echo 'Criando um branch ...'
echo '==========================================================================='

docker-compose run --rm git checkout -b release-1

echo 'Listando branches...'
echo '==========================================================================='

docker-compose run --rm  git branch

echo 'Retornando para ramo principal ...'
echo '==========================================================================='

docker-compose run --rm git checkout master

echo 'Verificando atualização do branch...'
echo '==========================================================================='

docker-compose run --rm git branch

echo 'Alterando arquivo index.html'
echo '==========================================================================='

sed -i 's/Controlar/Manter/g' 'src/main/webapp/index.html'

docker-compose run --rm git add src/main/webapp/index.html

echo 'Verificando status do repositório ...'
echo '==========================================================================='

docker-compose run --rm git status

echo 'Commitando arquivos no repositório ...'
echo '==========================================================================='

docker-compose run --rm git commit -m "Alteração da página index.html"

echo 'Comparando arquivos entre branches ...'
echo '==========================================================================='

docker-compose run --rm git diff master release-1

echo 'Criando uma tag ...'
echo '==========================================================================='

docker-compose run --rm git tag -a v1.1.0 -m "Alteração da página index.html"

echo 'Criando um branch ...'
echo '==========================================================================='

docker-compose run --rm git checkout -b release-2

echo 'Retornando para ramo principal ...'
echo '==========================================================================='

docker-compose run --rm git checkout master

echo 'Listando branches...'
echo '==========================================================================='

docker-compose run --rm git branch

