# zsh configuration
export ZSH="/usr/share/oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git
	virtualenv)

# user configuration
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# update all packages
alias pm_upgrade='/usr/bin/sudo /sbin/apk -U upgrade'

source $ZSH/oh-my-zsh.sh
function config_install {
    git clone --bare "${1}" $HOME/.cfg
    config config --local status.showUntrackedFiles no
    config checkout
}
