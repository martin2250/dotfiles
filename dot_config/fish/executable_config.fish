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
function cdl
	cd "$1";
	ls;
end

# git aliases
alias gca='git commit -a'
alias gp='git pull --rebase'
alias gpu='git push'

# clipboard actions
alias clipget='xclip -selection c -o'	# get clipboard to stdout
alias clipset='xclip -selection c'		# set clipboard from stdin

function run
	$argv > /dev/null 2>&1 &
	disown > /dev/null 2>&1;
end

function mkcd
	mkdir "$argv";
	cd "$argv";
end

set -u pure_threshold_command_duration -1
set -u pure_enable_git false