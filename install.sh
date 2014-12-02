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
  $LN -sf $SRC $DST

}

setup .rcm/bash/bash_profile $HOME/.bashrc
setup .rcm/bash/bash_profile $HOME/.bash_profile
setup .rcm/bash/bash_aliases $HOME/.bash_aliases
setup .rcm/bash/bash_funcs $HOME/.bash_funcs
setup .rcm/dotvim $HOME/.vim
setup .rcm/dotvim/vimrc $HOME/.vimrc
setup .rcm/prezto $HOME/.zprezto
setup .rcm/prezto/runcoms/zlogin $HOME/.zlogin
setup .rcm/prezto/runcoms/zlogout $HOME/.zlogout
setup .rcm/prezto/runcoms/zpreztorc $HOME/.zpreztorc
setup .rcm/prezto/runcoms/zprofile $HOME/.zprofile
setup .rcm/prezto/runcoms/zshenv $HOME/.zshenv
setup .rcm/prezto/runcoms/zshrc $HOME/.zshrc
setup .rcm/emacs/dotemacs $HOME/.emacs
setup .rcm/emacs/emacs.d $HOME/.emacs.d
