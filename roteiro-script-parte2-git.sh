#!/bin/sh

echo 'Definindo variáveis de ambiente ...'

docker-compose run git config --global user.name "concha.yoro"
docker-compose run git config --global user.email "user@conchayoro.com.br"

echo 'Criando repositório ...'
docker-compose run git init

#Initialized empty Git repository in /git/.git/

echo 'Verificando criação do repositório (diretório .git)...'

ls -la 

echo 'Verificando conteúdo do diretório .git...'

ls -la .git

echo 'Verificando status do repositório ...'

docker-compose run git status

#On branch master
#
#No commits yet
#
#Untracked files:
#  (use "git add <file>..." to include in what will be committed)
#
#	NotasAula.odt
#
#nothing added to commit but untracked files present (use "git add" to track)

echo 'Estagiando arquivos no repositório ...'

docker-compose run git add .

echo 'Verificando status do repositório ...'

docker-compose run git status

#On branch master
#
#No commits yet
#
#Changes to be committed:
#  (use "git rm --cached <file>..." to unstage)
#
#	new file:   NotasAula.odt
#       ...

echo 'Commitando arquivos no repositório ...'

docker-compose run git commit -m "Versão inicial do projeto"

#349 files changed, 23598 insertions(+)
# create mode 100644 NotasAula.odt
# ...


echo 'Verificando status do repositório ...'

docker-compose run git status

#On branch master
#nothing to commit, working tree clean

docker-compose run git branch

#*master

echo 'Criando branch ...'

docker-compose run git checkout -b release-0.0.1

#Switched to a new branch 'release-0.0.1'

docker-compose run git branch

#  master
#* release-0.0.1

echo 'Criando uma tag ...'

docker-compose run git tag -a v0.0.1 -m "Versão inicial"

echo 'Retornando para ramo principal ...'

docker-compose run git checkout master

#Switched to branch 'master'

echo 'Verificando atualização do branch...'

docker-compose run git branch

echo 'Alterando arquivo index.html'

sed '/\Bem vindo a Concha Y Oro!!!/a Manter Produtos' -i 'fonte/src/main/webapp/index.html'

docker-compose run git add .

echo 'Verificando status do repositório ...'

docker-compose run git status


echo 'Commitando arquivos no repositório ...'

docker-compose run git commit -m "Alteração da página index.html"

echo 'Verificando status do repositório ...'

docker-compose run git status

