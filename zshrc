# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# - - - ALIASES - - -
alias powertop='sudo powertop'
alias systemctl='sudo systemctl'
alias ghpub="git subtree push --prefix dist origin gh-pages"
alias irc="TERM=screen-256color weechat-curses"

# Pacman aliases
alias pacman='sudo pacman'
alias pacu='pacman -Syu'
alias pacs='pacman -Ss'
alias paci='pacman -S'
alias pacr='pacman -R'
alias pacrs='pacman -Rs'
alias pacin='pacman -Qi'

# Cower aliases
alias pacas='cower -s'
alias pacai='cower -d'
alias pacau='cower -u'
alias pacaud='cower -ud'


# Set Scala Home so Intellij can find it
export SCALA_HOME=/usr/share/scala

# Always use 5 threads
alias scons='scons -j5'
alias make='make -j5'

# Use proper colors for tmux
alias tmux='TERM=screen-256color-bce tmux'
# - - - - - - - - - -

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Solarized ls colors
#eval `dircolors ~/.builds/dircolors-solarized/dircolors.ansi-dark`

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Use CWD for C-x C-f in Emacs
if [ -n "$INSIDE_EMACS" ]; then
    chpwd() { print -P "\033AnSiTc %d" }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

# Use GODIT for editor
export EDITOR=godit

# Go variables
export GOPATH=$HOME/dev/lang/go
export GOOS=linux
export GOARCH=amd64
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Set C/C++ Compiler
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# Use 256-color when available
if [[ $COLORTERM == "gnome-terminal" ]]; then
    export TERM=xterm-256color
fi

# Chromium binary for Karma
export CHROME_BIN=/usr/bin/chromium

