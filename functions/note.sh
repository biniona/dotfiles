#!/bin/bash

function note {
    # touch and open a note document
    readonly file_name="$HOME/Notes/$(date +'%Y%m%d').txt"
    touch "$file_name"
    open_defualt_editor "$file_name"
}

