#!/bin/bash

# upload file to transfer.sh
function transfer { curl --upload-file "$1" "https://transfer.sh/$1"; echo; }

# start program and detatch from shell
function run { $@ > /dev/null 2>&1 & disown > /dev/null 2>&1; }

# kill all jobs running in background
function killjobs { kill $(jobs -p); }

# open new terminal window with optional directory
function term { run alacritty --working-directory="$(realpath ${1:-$(pwd)})"; }

# make new directory (can contain new subdirectories) and cd into it
function mkcd { mkdir "$1" && cd "$1"; }

# show full path of file
function path { echo "$PWD/$1"; }

# list serial ports
function lserial { (cd /dev/serial/by-id/; for id in *; do echo -e "$(realpath --relative-to /dev/ $id)\t$id"; done) }

# extract compressed file
function extract () {
	if [ -f "$1" ] ; then
		case "$1" in
			*.tar.bz2)   tar xvjf "$1"    ;;
			*.tar.gz)    tar xvzf "$1"    ;;
			*.bz2)       bunzip2 "$1"     ;;
			*.rar)       unrar x "$1"     ;;
			*.gz)        gunzip "$1"      ;;
			*.tar)       tar xvf "$1"     ;;
			*.tbz2)      tar xvjf "$1"    ;;
			*.tgz)       tar xvzf "$1"    ;;
			*.zip)       unzip "$1"       ;;
			*.Z)         uncompress "$1"  ;;
			*.7z)        7z x "$1"        ;;
			*)           echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

# go up x directories
up(){
	local d=""
	for ((i=1 ; i <= ${1:-1} ; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd "$d"
}

ytplay () {
	url=$(clipget)
	run vlc $(youtube-dl -g -f mp4 "${url%%&*}")
}