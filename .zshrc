# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)

ZSH_THEME="robbyrussell"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# add aliases
source .aliases

# add secrets to environment
source .sensitive

# add local configurations
source .local_config

# function used by functions directory, must be declared first
function open_defualt_editor {
    code "$@"
}

# load functions
for FILE in $HOME/functions/*; do source $FILE; done

if [ ! -S $HOME/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" $HOME/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#direnv setup
eval "$(direnv hook zsh)"

source /Users/alek.binion/zsh-plugins/zsh-z/zsh-z.plugin.zsh
source $ZSH/oh-my-zsh.sh

