#file:     ~/.bashrc
# Check for an interactive session
[ -z "$PS1" ] && return
source ~/.alias
#export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim
#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;94m\]┌───< \[\e[0;35m\]\u\[\e[0;94m\] >───< \[\e[0;93m\]\w\[\e[0;94m\] >\n\[\e[0;94m\]└───>\[\e[0m\] '
#PS1='\[\e[1;33m\]├──\[\e[1;35m\]| \[\e[0;36m\]\u\[\e[0;34m\] \[\e[1;35m\]|\[\e[1;33m\]─\[\e[1;35m\]| \[\e[0;32m\]\w\[\e[1;33m\] \[\e[1;35m\]|\n\[\e[1;33m\] └─\[\e[1;35m\]| \[\e[1;32m\]\@\[\e[1;33m\] \[\e[1;35m\]|\[\e[1;33m\]──\[\e[1;33m\]╼ \[\e[0m\]'
PS1='\[\e[0;34m\]┌──< \[\e[1;36m\]\u\[\e[0;34m\] >───< \[\e[0;33m\]\w\[\e[0;34m\] >\n\[\e[0;34m\]└──< \[\e[1;32m\]\A\[\e[0;34m\] >───╼\[\e[0;36m\] '

#PATH
export PATH=$PATH:/usr/bin/vendor_perl/:$HOME/.scripts/

#COLORS
trap "printf '\e[0m'" DEBUG
export GREP_COLOR='1;36'
eval $(dircolors -b ~/.dir_colors)

#VARIOUS
export HISTSIZE=1000
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL="ignoreboth:erasedups"
shopt -s cdspell dirspell extglob histverify no_empty_cmd_completion expand_aliases checkwinsize

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

#BROWSER
if [ -n "$DISPLAY" ]; then
	BROWSER=google-chrome
else
	BROWSER=links
fi
export BROWSER

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

#-----Executable Permission--------#
ex() {
	chmod +x $1 
}
##--------------------------------##

#----------show process----------#
show() {
	ps aux | grep $1
}
##------------------------------##

## Change Directory and list contents
cdl() {
	cd $1; ls --color=auto;
}
##-------------------------------##

## See colored logs ( needs ccze package ) ##
see() {
	sudo tail -n 100 -f /var/log/$1 | ccze -A
}

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
