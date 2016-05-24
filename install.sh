#!/bin/bash
DIRS="bash global mintty sim vim inputrc emacs zsh"

if [[ $# -gt 0 ]]; then
    DIRS=$*
fi

for dir in $DIRS
do
    stow $dir
done

echo you must install spacemacs with windows mklink
