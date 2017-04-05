#!/bin/bash
DIRS="mintty sim spacemacs vim8 .git global zsh fzf astyle vim i3 emacs bash inputrc"

if [[ $# -gt 0 ]]; then
    DIRS=$*
fi

TMPDIR=~/.rcm.$$

for dir in $DIRS
do
	(cd $dir && find . -maxdepth 1 -print0 ) | while read -d $'\0' file
	do 
		file=$(echo $file | sed -e "s/^\.\///")
		if [[ "$file" != "." && "$file" != ".git" ]]; then
			if [[ -e ~/$file ]]; then
				mv ~/$file $TMPDIR
			fi
			ln -s ~/.rcm/$dir/$file ~/$file
		fi
	done
done
