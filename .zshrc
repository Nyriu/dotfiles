#------------------------------------------#
#         OH MY ZSH - STUFF                #
#------------------------------------------#

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nyriu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  last-working-dir
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'
alias vim=nvim

# Fast edit dotfiles
alias editvim='nvim ~/.config/nvim/init.vim'
alias edvim='nvim ~/.config/nvim/init.vim'
alias edv='nvim -c "lcd ~/.config/nvim/" ~/.config/nvim/init.vim'
alias edp='nvim -c "lcd ~/.config/nvim/" ~/.config/nvim/lua/plugins.lua'
alias edc='nvim -c "lcd ~/.config/nvim/" ~/.config/nvim/lua/configs.lua'

alias editzsh='nvim ~/.zshrc'
alias edzsh='nvim ~/.zshrc'
alias edz='nvim ~/.zshrc'

alias notes='nvim ~/notes.md'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


DEFAULT_USER=nyriu

export PATH="$PATH:/home/nyriu/.local/bin:/home/nyriu/.local/share/gem/ruby/3.0.0/bin"


# # Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=1000
# SAVEHIST=1000
# setopt autocd extendedglob nomatch
# unsetopt beep
#bindkey -v
# # End of lines configured by zsh-newuser-install
# # The following lines were added by compinstall
# zstyle :compinstall filename '/home/nyriu/.zshrc'
# 
# autoload -Uz compinit
# compinit
# # End of lines added by compinstall


# Change keyboard layout
alias keymapIT='setxkbmap it'
alias keymapUS='setxkbmap us'

# C-S and C-Q do not disturb
stty -ixon

# Use trash
alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"
alias del="trash-put"


# Applications shortcuts
# TODO
#e() { evince "@" &}
#z() { nohup zathura "@" &>/dev/null &}
#v() { nohup viewnior "@" &>/dev/null &}


# Directories Aliases
alias uni="cd ~/Documents/Uni/QuintoAnno"
alias unimai="cd ~/Documents/Unimai"
alias formi="cd ~/Documents/Uni/QuintoAnno/ProgrArchParall"
#alias geom="cd ~/Documents/Uni/QuintoAnno/GeomComput"
#alias svdag="cd ~/Documents/Uni/QuintoAnno/Algoritmi_Avanzati/slide"
#alias rt="cd ~/Documents/Uni/QuintoAnno/Tirocinio3D/RayTracer"
#alias rtcuda="cd ~/Documents/Uni/QuintoAnno/ProgrArchParall/CUDA_RayTracer"
alias tesi="cd ~/Documents/Uni/QuintoAnno/Tesi"
alias web="cd ~/Documents/Unimai/websites/nyriu.github.io"
alias cv="cd ~/Documents/CV"
alias application="cd ~/Documents/Applications"
alias preparation="cd ~/Documents/ApplicationPreparation"

alias ttrpg="cd ~/Documents/TTRPG/ArsMagica"
alias hibernia="cd ~/Documents/TTRPG/ArsMagica/Hibernia"
alias schism="cd ~/Documents/TTRPG/ArsMagica/SchismWar"
#alias gamedev="cd ~/Documents/Unimai/GameDev/Engines/Halley/halley"
alias gamedev="cd ~/Documents/Unimai/GameDev/Proof_of_a_GameDev"

alias 3DPrinting="cd ~/Documents/Unimai/3DPrinting"
alias armchar="cd ~/Documents/TTRPG/ArsMagica/WizardMakerProject/george/armchar"
alias armchar-client="cd ~/Documents/TTRPG/ArsMagica/WizardMakerProject/george/armchar-client"




[ -f "/home/nyriu/.ghcup/env" ] && source "/home/nyriu/.ghcup/env" # ghcup-env
