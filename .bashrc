# ls -l command display in megabytes
alias la="ls -A"
alias lf="ls -F"
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
# export TERM="xterm-256color"

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
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/:/usr/local/CrossPack-AVR/bin:/Library/TeX/texbin"

#connect to CU server
alias server='ssh brownsr@eces-shell.colorado.edu'

#display connected serial comm ports
alias com='ls /dev/tty.*'

#display all connectd usb devices
alias usb="ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'"

#modify bash prompt
# export PS1="\033[32m\][\w]\[\033[0m\] \n\[\033[1;36m\]\u\[\033[1;33m\]$ \[\033[0m\]"
export PS1="\[\e[36m\][\w]\[\e[m\]\n\[\e[33m\]\!\[\e[m\][\u]\[\e[1;31m\]>> \[\e[m\]"

#open matlab in terminal
alias matlab='/Applications/MATLAB_R2014b.app/bin/matlab -nodesktop -nosplash'

#show and hide hidden files
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"

# Eternal bash history.
# if bash starts taking long time to load file size is getting too big
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# badge displays git branch (iterm)
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

export GOPATH=$HOME/go
export PATH+=$PATH:$GOPATH/bin
export PATH+="$PATH:/usr/local/opt/go/libexec/bin"

alias weather='curl http://wttr.in/Westminster'
alias moon='curl wttr.in/Moon'
