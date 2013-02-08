#
# ~/.bash_profile
#

## [[ -f ~/.bashrc ]] && . ~/.bashrc
#alsi -l -c1 cyan -c2 white -u -t
source ~/.bashrc

if [[ -z $DISPLAY ]] && ! [[ -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
  while true; do
    read -p 'Do you want to start X? (y/n): '
    case $REPLY in
      [Yy]) exec xinit -- /usr/bin/X -nolisten tcp vt1 &> ~/.xlog ;;
      [Nn]) break ;;
      *) printf '%s\n' 'Please answer y or n.' ;;
    esac
  done
fi
