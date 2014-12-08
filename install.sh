#!/bin/bash

TEST=0
if [[ $TEST -eq 1 ]]; then
  MKDIR="echo mkdir"
  MV="echo mv"
  LN="echo ln"
  CP="echo cp"
else
  MKDIR=mkdir
  MV=mv
  LN=ln
  CP=cp
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

function setupcp()
{
  SRC=$1
  DST=$2

  backup $DST
  $CP -sf $SRC $DST

}
function setupln()
{
  SRC=$1
  DST=$2

  backup $DST
  $LN -sf $SRC $DST

}

setupln .rcm/bash/bash.d $HOME/.bash.d
setupcp .rcm/bash/bash-init $HOME/.bashrc
setupcp .rcm/bash/bash-init $HOME/.bash_profile

setupln .rcm/vim $HOME/.vim
setupcp .rcm/vim/dotvimrc $HOME/.vimrc

setupcp .rcm/emacs/dotemacs $HOME/.emacs
setupln .rcm/emacs/emacs.d $HOME/.emacs.d
