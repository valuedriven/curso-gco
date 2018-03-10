#!/bin/sh

echo 'Preparando containeres ...'

docker-compose up -d

echo 'Definindo variáveis de ambiente ...'

docker-compose run --rm git config --global user.name "concha.yoro"
docker-compose run --rm git config --global user.email "user@conchayoro.com.br"

echo 'Criando repositório ...'

docker-compose run --rm git init

echo 'Verificando status do repositório ...'

docker-compose run --rm git status

echo 'Estagiando arquivos no repositório ...'

docker-compose run --rm git add ambiente/* artefatos/* bancoscript/* bibliotecas/* documentacao/* roteiros/* src/*

echo 'Verificando status do repositório ...'

docker-compose run --rm git status

echo 'Commitando arquivos no repositório ...'

docker-compose run --rm git commit -m "Versão inicial do projeto"

echo 'Criando uma tag ...'

docker-compose run --rm git tag -a v0.0.1 -m "Versão inicial"

echo 'Criando um branch ...'

docker-compose run --rm git checkout -b release-0.0.1

echo 'Listando branches...'

docker-compose run --rm  git branch

echo 'Retornando para ramo principal ...'

docker-compose run --rm git checkout master

echo 'Verificando atualização do branch...'

docker-compose run --rm git branch

echo 'Alterando arquivo index.html'

sed '/\Bem vindo a Concha Y Oro!!!/a Manter Produtos' -i 'src/main/webapp/index.html'

docker-compose run --rm git add src/*

echo 'Verificando status do repositório ...'

docker-compose run --rm git status

echo 'Commitando arquivos no repositório ...'

docker-compose run --rm git commit -m "Alteração da página index.html"

echo 'Verificando status do repositório ...'

docker-compose run --rm git status

echo 'Criando uma tag ...'

docker-compose run --rm git tag -a v0.0.2 -m "Alteração da página principal"

echo 'Criando um branch ...'

docker-compose run --rm git checkout -b release-0.0.2

echo 'Retornando para ramo principal ...'

docker-compose run --rm git checkout master

echo 'Listando branches...'

docker-compose run --rm git branch

