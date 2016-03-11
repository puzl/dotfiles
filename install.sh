#!/bin/bash

for dir in bash global mintty sim vim inputrc emacs
do
    stow $dir
done

echo you must install spacemacs with windows mklink
