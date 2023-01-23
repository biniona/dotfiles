#!/bin/bash

# copy a variable to clipboard and remove new line
function copy_var {
  echo "$1" | tr -d '\n' | pbcopy
}