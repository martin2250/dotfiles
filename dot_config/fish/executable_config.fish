# change default behavior of shell utils
alias ls='ls --color=auto'
alias dd='dd status=progress'
alias ddsync='dd status=progress conv=fdatasync'
alias find='find 2>/dev/null'
alias grep='grep --color=auto'
alias sc='systemctl'

# custom commands
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

# ripgrep filenames
alias rgf='rg --files | rg'

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

function ytplay
	set url (clipget)
	set url (string split '&' $url)[1]
	run vlc --no-video-title-show (youtube-dl -g -f mp4 "$url")
end

set -u pure_threshold_command_duration -1
set -u pure_enable_git false

set -x PATH     $PATH ~/bin ~/.local/bin/ ~/.cargo/bin/
set -x EDITOR   /usr/bin/nano
set -x TERMINAL /usr/bin/alacritty
set -x TERM     xterm-256color

if test -x /usr/bin/lsd
	alias ls=lsd
	alias la='lsd -lA --blocks "permission,user,size,date,name"'
	alias lt='lsd --tree --depth 2'
else
	alias la='ls -hoa'
end
