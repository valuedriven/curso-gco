#!/bin/sh

echo 'Criando repositório ...'

docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git git init



