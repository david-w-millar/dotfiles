# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

### oh-my-zsh tmux plugin config
#export ZSH_TMUX_AUTOSTART=true
zstyle ':omz:module:tmux' auto-start 'yes'
if [ "$TMUX" = "" ]; then tmux -2; fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# # git-flow
#plugins=(git rails ruby gem github mysql vagrant archlinux gradle grails python redis-cli rvm ssh-agent vundle)
#plugins=(git-flow git ruby gem vagrant gradle grails python rvm ssh-agent vundle)
#plugins=(tmux tmuxinator git-flow git-extras git ruby gem bundler vagrant gradle grails python rvm ssh-agent vundle capistrano colored-man cp gnu-utils heroku)
plugins=(tmux git github gitignore git-flow mvn ruby gem bundler vagrant gradle grails rails rake sbt scala python rvm ssh-agent vundle colored-man gnu-utils heroku bower brew brew-cask cp docker node npm web-search)


source $ZSH/oh-my-zsh.sh

# Millar

# Misc
set -o vi

# Source configs
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.secrets

# system specific config
[[ -f ~/.localrc ]] && . ~/.localrc
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.jenv/bin:$PATH"
export EDITOR="vim"

export PATH="/usr/local/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/dave/.gvm/bin/gvm-init.sh" ]] && source "/Users/dave/.gvm/bin/gvm-init.sh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
