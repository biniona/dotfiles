#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# this environment variable is used by
# vscode for finding a zsh configuration
export ZDOTDIR="$HOME"
plugins=(git)

ZSH_THEME="robbyrussell"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# add aliases
source "$HOME/.aliases"

# add secrets to environment
source "$HOME/.sensitive"

# add local configurations
source "$HOME/.local_config"

# add autocompletions
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# add vscode to path
PATH="$PATH:/usr/local/bin/code"

#include pipx binaries on path
PATH="$PATH:$HOME/.local/bin"

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

source $HOME/zsh-plugins/zsh-z/zsh-z.plugin.zsh
source $ZSH/oh-my-zsh.sh

#asdf setup
. "$HOME/.asdf/asdf.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
