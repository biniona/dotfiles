#!/bin/bash

function note {
    readonly today="$(date +'%Y%m%d')"


    open_file=true
    note_date="$today"
    days_ago_pattern="^[0-9]*$"
    get_date_pattern="^d[0-9]*$"

    for arg in "$@"; do
        case "$arg" in
        -n|--no-open)
            open_file=false
            ;;
        *)
            if [[ $arg =~ $days_ago_pattern ]]; then
            note_date=$(gdate --date="$arg days ago" +"%Y%m%d")
            elif [[ $arg =~ $get_date_pattern ]]; then
            note_date="${arg:1}"
            fi
            ;;
        esac
    done

    # touch and open a note document
    readonly file_name="$HOME/Notes/$note_date.txt"
    touch "$file_name"
    $open_file && code "$file_name" || echo "$file_name"
}

