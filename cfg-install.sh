config_repo='https://github.com/biniona/dotfiles.git'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare $config_repo $HOME/.cfg
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Checkout failed. Back up existing dotfiles and try again.";
    exit 0
fi;
config config --local status.showUntrackedFiles no
