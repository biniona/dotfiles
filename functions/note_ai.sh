#!/bin/bash

# Depends: claude CLI, gdate (coreutils), your existing `note` function.
# Optional: export CLAUDE_MODEL to override the default model.

function note_ai {
    ACTION_ITEMS=$(claude -p "Read this file @$(note -n 1). Return only the list of action items as a plain string. If no action items are found, return an empty string. Return action items as a bulleted plaintext list. Label the list with the heading Action Items:")
    echo "$ACTION_ITEMS"
    echo "--------------------------------"
    echo "$ACTION_ITEMS" >> "$(note -n)"
    note
}
