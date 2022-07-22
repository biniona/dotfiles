# Preferred editor for local and remote sessions
export EDITOR='vim'

# add aliases
source .aliases

# add secrets to environment
source .sensitive

# load functions
for FILE in $HOME/functions/*; do source $FILE; done
