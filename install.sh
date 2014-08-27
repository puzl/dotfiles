#!/bin/bash

TEST=0
if [[ $TEST -eq 1 ]]; then
  MKDIR="echo mkdir"
  MV="echo mv"
  LN="echo ln"
else
  MKDIR=mkdir
  MV=mv
  LN=ln
fi

BACKUPDIR=~/.rcm.backup.$$ 

function backup()
{
  ITEM=$1
  if [[ ! -d $BACKUPDIR && $TEST -eq 0 ]]; then
    $MKDIR $BACKUPDIR
  fi
  if [[ -e $ITEM ]]; then
    $MV $ITEM $BACKUPDIR
  fi
}

function setup()
{
  SRC=$1
  DST=$2

  backup $DST
  $LN -s $SRC $DST

}

setup $HOME/.rcm/dotvim $HOME/.vim
setup $HOME/.rcm/dotvim/vimrc $HOME/.vimrc
setup $HOME/.rcm/prezto $HOME/.zprezto
setup $HOME/.rcm/prezto/runcoms/zlogin $HOME/.zlogin
setup $HOME/.rcm/prezto/runcoms/zlogout $HOME/.zlogout
setup $HOME/.rcm/prezto/runcoms/zpreztorc $HOME/.zpreztorc
setup $HOME/.rcm/prezto/runcoms/zprofile $HOME/.zprofile
setup $HOME/.rcm/prezto/runcoms/zshenv $HOME/.zshenv
setup $HOME/.rcm/prezto/runcoms/zshrc $HOME/.zshrc
