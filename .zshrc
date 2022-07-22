# Path to your oh-my-zsh installation.
export ZSH="/Users/alek.binion/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

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

# load functions
for FILE in /Users/alek.binion/functions/*; do source $FILE; done

if [ ! -S /Users/alek.binion/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" /Users/alek.binion/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=/Users/alek.binion/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:/opt/apache-maven-3.6.3/bin

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#direnv setup
eval "$(direnv hook zsh)"
