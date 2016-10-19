#
# Zsh Config
#

# Path to your oh-my-zsh installation.
export ZSH=/root/.oh-my-zsh

ZSH_THEME="blinks"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder


# Plugin Config
ZSH_TMUX_AUTOSTART=true       # Default: false
ZSH_TMUX_AUTOSTART_ONCE=true  # Default: true
ZSH_TMUX_AUTOCONNECT=false    # Default: true
ZSH_TMUX_AUTOQUIT=false       # Default: ZSH_TMUX_AUTOQUIT=${ZSH_TMUX_AUTOSTART}
ZSH_TMUX_FIXTERM=true         # Default: true



# Plugins
plugins=(colored-man-pages cp docker git gitignore git-flow gradle mvn npm python tmux tmuxinator vagrant vundle)


source $ZSH/oh-my-zsh.sh


# User configuration

export LANG=en_US.UTF-8
export EDITOR='vim'
set -o vi

# Zsh modules
#autoload -U zmv

# Source configs
. ~/.zsh/aliases

# Secrets
[[ -f ~/.secrets ]] && . ~/.secrets

# system specific config
[[ -f ~/.localrc ]] && . ~/.localrc

