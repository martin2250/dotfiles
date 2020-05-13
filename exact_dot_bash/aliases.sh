#!/bin/bash

# make aliases work with sudo
alias sudo='sudo '

# change default behavior of shell utils
alias ls='ls --color=auto'
alias dd='dd status=progress'
alias ddsync='dd status=progress conv=fdatasync'
alias find='find 2>/dev/null'
alias grep='grep --color=auto'
alias sc='systemctl'

# custom commands
alias la='ls -thora'
alias open='run xdg-open'
alias pdfcombine='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile='
alias udevreload='sudo udevadm control --reload-rules; sudo udevadm trigger;'

# cd to directory and list files (has to be here so ls alias is already available)
function cdl { cd "$1"; ls; }

# git aliases
alias gca='git commit -a'
alias gp='git pull --rebase'
alias gpu='git push'

# clipboard actions
alias clipget='xclip -selection c -o'	# get clipboard to stdout
alias clipset='xclip -selection c'		# set clipboard from stdin

# replace commands
# if CMD_AVAILABLE bat; then
#	alias cat='bat'
# fi

if CMD_AVAILABLE htop; then
	alias top='htop'
fi

if CMD_AVAILABLE ncdu; then
	alias ncdu='ncdu --color dark -x --exclude .git --exclude node_modules'
fi

if CMD_AVAILABLE perf; then
	alias ccycles='perf stat -B -e cycles:u,instructions:u'
fi
