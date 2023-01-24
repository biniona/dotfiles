#!/bin/bash

function note {
    readonly yesterday="$(gdate --date='yesterday' +'%Y%m%d')"
    readonly today="$(date +'%Y%m%d')"

    note_date="$today"
    yesterday_pattern="^y.*$"
    days_ago_pattern="^[0-9]*$"
    get_date_pattern="^d[0-9]*$"
    if [[ -z "$1" ]]; then
        :
    elif [[ $1 =~ $yesterday_pattern ]]; then
        note_date="$yesterday";
    elif [[ $1 =~ $days_ago_pattern ]]; then
        note_date=$(gdate --date="$1 days ago" +"%Y%m%d")
    elif [[ $1 =~ $get_date_pattern ]]; then
        note_date=$1
        note_date="${note_date:1}"
    fi

    # touch and open a note document
    readonly file_name="$HOME/Notes/$note_date.txt"
    touch "$file_name"
    open_defualt_editor "$file_name"
}

