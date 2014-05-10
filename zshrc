# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Use CWD for C-x C-f in Emacs
if [ -n "$INSIDE_EMACS" ]; then
    chpwd() { print -P "\033AnSiTc %d" }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi

# Enable rbenv shim and autocomplete
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

# Load the Github API token for Homebrew if available
GH_API_FILE=~/.homebrew_gh_api
[ -f $GH_API_FILE ] && source $GH_API_FILE

export GOPATH=/Users/zach/Dev/Go
export PATH="$GOPATH/bin:/usr/local/opt/go/libexec/bin:/Applications/Racket_v6.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export TERM=xterm-256color
export RBENV_ROOT=/usr/local/var/rbenv

# Homebrew Aliases
alias bupd='brew update && brew outdated'
alias bupg='brew upgrade'
alias bupa='bupd && bupg'
alias bs='brew search'
alias bi='brew install'
alias binf='brew info'
