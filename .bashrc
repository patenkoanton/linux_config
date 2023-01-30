# my aliases
alias v='vim -c "so ~/myvimrc"'
alias nvimrc='vim ~/.config/nvim/init.vim'
alias ebash="vim ~/.bashrc"
alias src="source ~/.bashrc"
alias q="cd .."
alias l="ls -lah"
alias lsko="l *.ko"
alias gre="grep --ignore-case --color=auto -n"
alias grer="gre -r"
alias vd="vimdiff"
alias c="cat"
alias fin="find . -iname"
alias netman_restart="service network-manager restart"
alias fsize="du -hs"
alias disk_usage="df -ah"
alias hist="history"

# So that tmux doesn't break vim colorscheme
export TERM=screen-256color

export cpp="/home/banana/documents/c_applics/cpp_play"
export docs="/home/banana/documents"
export uni="/home/banana/documents/university/"

# git aliases
unset GIT_EDITOR
alias gst="git status --ignored"
alias gcom="git commit"
alias gcoma="git commit --amend"
alias gfix="git commit --amend --no-edit"
alias gadd="git add"
alias gsta="git stash"
alias gbra="git branch"
alias gche="git checkout"
alias glog="git log"
alias glo="git log"
alias glogo="git log --oneline"
alias grem="git remote -v"
alias gsho="git show --stat"
alias gd="git difftool"
alias gds="git difftool --staged"
alias gd2="gd HEAD~ HEAD"
alias gdv="git difftool --tool=vimdiff"

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# update history file immediately after every command
# instead of waiting until the terminal is closed
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=200000000000000
HISTFILESIZE=200000000000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF --block-size="K"'
alias la='ls -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases

fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=~/.local/bin:"$PATH"

# zephyr project
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=~/zephyr-sdk-0.11.2
#export ZEPHYR_BASE=/home/banana/documents/c_projects/zephyrproject/zephyr

# environment variables
export HISTSIZE=9999999     # little hack needed for gdb history
