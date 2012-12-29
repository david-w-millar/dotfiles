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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# # git-flow
plugins=(git rails ruby gem github mysql vagrant archlinux gradle grails python redis-cli rvm ssh-agent vundle)

source $ZSH/oh-my-zsh.sh

# Millar
export PATH=/home/dave/.rvm/gems/ruby-1.9.3-p327/bin:/home/dave/.rvm/gems/ruby-1.9.3-p327@global/bin:/home/dave/.rvm/rubies/ruby-1.9.3-p327/bin:/home/dave/.rvm/bin:/home/dave/bin:/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/gant/bin:/usr/share/java/gradle/bin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/qt/bin:/home/dave/apps/idea-IU-117.798/bin

# Source configs
. ~/.zsh/config
. ~/.zsh/aliases

# system specific config
[[ -f ~/.localrc ]] && . ~/.localrc

