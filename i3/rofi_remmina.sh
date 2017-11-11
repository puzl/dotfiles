#!/bin/bash

if [ -z $@ ]
then
    for file in ~/.remmina/*.remmina
    do
        name=$(egrep ^name= $file | cut -f2 -d=)
        group=$(egrep ^group= $file | cut -f2 -d=)
        printf "%-30s %-30s\n" "$name" "$group"
    done | sort -k2
else
    SESSION=$@
    SESSION=$(echo $SESSION | cut -f1 -d" ")
    FILE=$(grep -l ${SESSION} ~/.remmina/*.remmina)
    remmina -c $FILE
fi
