#!/bin/bash

bash -c "$(curl -fsSL https://raw.github.com/motohidentaku/dotfiles/master/etc/install.sh)"

sudo apt-get update
sudo apt-get upgrade

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには1個の引数が必要です。" 1>&2
  exit 1
fi

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
source $HOME/.poetry/env


poetry new $1
cd $1
poetry add -D black
poetry add -D pyproject-flake8
poetry add -D flake8-bugbear
poetry add -D isort
poetry add -D mypy
poetry add -D pre-commit

poetry add pyper
poetry add pandas
poetry add sklearn
poetry add sqlalchemy
poetry add pymysql
