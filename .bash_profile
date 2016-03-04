# ls -l command display in megabytes
alias lsm="ls -l --block-size=M"
alias lsa="ls -A"
alias lsf="ls -F"
alias lsl="ls -l"
alias ll='ls -1'

# easy move up directory
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'

#empty trash
alias empty="rm -rf ~/.Trash/*"

#raspberry pi ssh connection
alias rasp="ssh pi@192.168.2.2"

#modify color setting
export TERM="xterm-color"

#ls coloring
export CLICOLOR=1

#clear terminal screen
alias clc='clear'

#reload bash profile
alias reset='source /Users/Rane/.bash_profile'

#QT compile
alias qmake='/Users/Rane/Qt/5.5/clang_64/bin/qmake'
alias macdeployqt='/Users/Rane/Qt/5.5/clang_64/bin/macdeployqt'

#modifcaiton of path for macports
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

#connect to CU server
alias server='ssh brownsr@eces-shell.colorado.edu'

#display connected serial comm ports
alias com='ls /dev/tty.*'

#display all connectd usb devices
alias usb="ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'"

#modify bash prompt
export PS1="\033[32m\][\w]\[\033[0m\] \n\[\033[1;36m\]\u\[\033[1;33m\]$ \[\033[0m\]"

#open matlab in terminal
alias matlab='/Applications/MATLAB_R2014b.app/bin/matlab -nodesktop -nosplash'

#show and hide hidden files
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
#             oooo   o8o
#             `888   `"'
#    .oooo.    888  oooo   .oooo.    .oooo.o  .ooooo.   .oooo.o
#   `P  )88b   888  `888  `P  )88b  d88(  "8 d88' `88b d88(  "8
#    .oP"888   888   888   .oP"888  `"Y88b.  888ooo888 `"Y88b.
#   d8(  888   888   888  d8(  888  o.  )88b 888    .o o.  )88b
#   `Y888""8o o888o o888o `Y888"8o 8""888P' `Y8bod8P' 8""888P'
#
