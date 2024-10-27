#!/bin/bash

function today {
    readonly today_date="$(date +'%Y%m%d')"

    # echo today's date
    echo "$today_date"
}

# create a file with today's date. If no extension is provided, a .txt file is created.
function todayf {
    leading_period="\..*"
    if [[ -z "$1" ]]; then
        extension="txt"
    elif [[ $1 =~ $leading_period ]]; then
        extension="${1:1}" 
    else
        extension="$1";
    fi
    echo "$(today).$extension" | xargs touch && echo "created: $(pwd)/$(today).$extension"
}

