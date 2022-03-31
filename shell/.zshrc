# zsh configuration
export ZSH="/usr/share/oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git
	virtualenv)

# package manager aliases
alias pm_upgrade='/usr/bin/sudo /sbin/apk -U upgrade'
alias pm_fix='/usr/bin/sudo /sbin/apk fix'
alias pm_install='/usr/bin/sudo /sbin/apk add'
source $ZSH/oh-my-zsh.sh
