#file:     ~/.bashrc

# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -la'
alias la='ls --color=auto -a'
alias e='exit'


##----------------------------Change Directory------------##
##--Correct typo__##
#alias cd..='cd ..'
##----------------##
alias cd.='cd ..'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias grep='grep --color=auto'
##--------------------------------------------------------##



#calculator with math support
alias bc='bc -l'
##-------------------------##



#gtk frontend of diff
alias diff='diffuse'
##------------------##


##-----------shows individual partition usges---------------##
alias df='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'
##----------------------------------------------------------##


##--------------------------Vi/Vim-------------------------------------##
alias vi='vim'
alias svi='sudo vim'
alias edit='vim'
##---------------------------------------------------------------------##


##----------------------------Copy/Move--------------------------------##
alias mv='mv -i'
alias cp='cp -i'
#alias rm='rm -i'
# Move deleted files to ~/.trash intead of deleting them.(Most safe option)
rm () {
sudo mv $1 /home/garry/.trash
}
##---------------------------------------------------------------------##


# using rsync to copy files with progressbar
alias cpsync='rsync --stats --progress -ravzhE'
##---------------------------------------##


# Some aliases for colored pacman output
alias update='sudo pacman-color -Syu'
alias refresh='sudo pacman-color -Syyu'
alias pacman='sudo pacman-color'
##-----------------------------------##




##----------------------------Miscellaneous----------------------------##

alias ping='ping -c 5'
alias h='history'
alias date='date +"%a %d-%m-%Y %I:%M %p"'
alias root='su root'
alias meminfo='free -m -l -t'
alias psmem='sudo python /home/garry/.scripts/ps_mem.py'
alias wget='wget -c'
alias feh='feh -.'
alias music='ncmpcpp'
alias c='clear'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'


#show files without commented (#) lines
alias nocomment='grep -Ev '\''^(#|$)'\'''

##---------------------------------------------------------------------##

##-------------------update Archlinux mirrors--------------------------##
alias mirror-update='/home/garry/.scripts/mirror-update'
##---------------------------------------------------------------------##




export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim
#alsi -l -c1 cyan -c2 white -u -t
#command xset r rate 300 50
#command alsi -a -u -cyan
#export PROMPT_COMMAND='alsi -a -u -cyan'
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;94m\]┌───< \[\e[0;35m\]\u\[\e[0;94m\] >───< \[\e[0;93m\]\w\[\e[0;94m\] >\n\[\e[0;94m\]└───>\[\e[0m\] '
PS1='\[\e[1;33m\]├──\[\e[1;35m\]| \[\e[0;36m\]\u\[\e[0;34m\] \[\e[1;35m\]|\[\e[1;33m\]─\[\e[1;35m\]| \[\e[0;32m\]\w\[\e[1;33m\] \[\e[1;35m\]|\n\[\e[1;33m\] └─\[\e[1;35m\]| \[\e[1;32m\]\@\[\e[1;33m\] \[\e[1;35m\]|\[\e[1;33m\]──\[\e[1;33m\]╼ \[\e[0m\]'


#PATH
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:/home/garry/.gem/ruby/1.9.1/bin

#COLORS
trap "printf '\e[0m'" DEBUG
eval $(dircolors -b ~/.dir_colors)

#VARIOUS
export HISTSIZE=100
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
shopt -s cdspell
shopt -s expand_aliases

#MAN
# Colored "man" pages, comment out if using rxvt-unicode with the colored man pages option enabled.See man 5 termcap
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[0;34m") \
		LESS_TERMCAP_md=$(printf "\e[0;34m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}


##export LESS_TERMCAP_mb=$'\E[0;36m'
##export LESS_TERMCAP_md=$'\E[0;36m'
##export LESS_TERMCAP_me=$'\E[0m'
##export LESS_TERMCAP_se=$'\E[0m'
##export LESS_TERMCAP_so=$'\E[1;44;33m'
##export LESS_TERMCAP_ue=$'\E[0m'
##export LESS_TERMCAP_us=$'\E[1;32m'

#BROWSER
if [ -n "$DISPLAY" ]; then
	BROWSER=firefox
else
	BROWSER=w3m
fi
export BROWSER


#export TERMINAL=urxvt

#EXTRACT
extract () {
if [ -f $1 ] ; then
export TERM=xterm-256color
export EDITOR=vim
case $1 in
*.lrz) lrztar -d $1 && cd $(basename "$1" .lrz) ;;
*.tar.bz2) tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
*.tar.gz) tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
*.tar.xz) tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
*.bz2) bunzip2 $1 && cd $(basename "$1" /bz2) ;;
*.rar) unrar x $1 && cd $(basename "$1" .rar) ;;
*.gz) gunzip $1 && cd $(basename "$1" .gz) ;;
*.tar) tar xvf $1 && cd $(basename "$1" .tar) ;;
*.tbz2) tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
*.tgz) tar xvzf $1 && cd $(basename "$1" .tgz) ;;
*.zip) unzip $1 && cd $(basename "$1" .zip) ;;
*.Z) uncompress $1 && cd $(basename "$1" .Z) ;;
*.7z) 7z x $1 && cd $(basename "$1" .7z) ;;
*) echo "don't know how to extract '$1'..." ;;
esac
else
echo "'$1' is not a valid file!"
fi
}

# --FILE--
#EXECUTABLE PERMISSION
ex() {
	chmod +x $1 
}
##---------------##




###########################################################################################################################################
#					EXAMPLES										       #
###########################################################################################################################################

###PS1='\[\e[4;32m\]\u\[\e[1;33m\]@\[\e[1;31m\]\h\[\e[m\] \[\e[0;32m\]\w\[\e[m\] \[\e[1;33m\]-->\[\e[m\] \[\e[1;37m\]'
###PS1='\[\e[1;31m\]\u@\h\[\e[m\] \[\e[0;32m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] \[\e[1;37m\]'
##PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
##PS1='\[\e[1;32m\]┌─\u\[\e[1;33m\]@\[\e[1;31m\]\h\[\e[m\] \[\e[0;32m\]\w\[\e[m\] \[\e[1;33m\]\n└─>\[\e[m\] \[\e[1;37m\]'
##PS1='[\u@\h \W]\$ '
##export PS1="\[\e[32;1m\]\T: \w > \[\e[0m\]"


###########################################################################################################################################
#					COLOR SAMPLES										       #
###########################################################################################################################################

# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37



############################################################################################################################################
#					COLOR INIT STRINGS									        #
############################################################################################################################################

# Below are the color init strings for the basic file types. A color init
# string consists of one or more of the following numeric codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white

############################################################################################################################################
#					END OF FILE											#
############################################################################################################################################
