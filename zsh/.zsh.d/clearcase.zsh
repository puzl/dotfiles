setsnap () {
    views=$(subst | sed -e 's/:.*\\/ /g')

    if [[ -z "$1" ]]
    then
        echo $views
    else
        view=$(echo $views | egrep -i "\<$1\>" | cut -f1 -d" " | tr a-z A-Z)
        if [[ -z "$view" ]]
        then
            echo "ERROR: view $1 does not exist"
            echo $views
        elif [[ "$view" == "$CC_VIEW_SPEC" ]]
        then
            echo "Already in view $view"
        elif [[ -n $CC_VIEW_SPEC ]]
        then
            echo "ERROR: A view is currently set -- run unsetview and try again"
        else
            CC_VIEW_SPEC=$view $SHELL --login -i
        fi
    fi
}

zstyle ':completion:*' fake-files   '/app' '/hdwr' '/kernel' '/system' '/devTools' '/vendor'
