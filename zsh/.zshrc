# Initial Setup
[ -z "$TMUX" ] && export TERM=tmux-256color

case $- in *i*)
  [ -z "$TMUX"  ] && exec tmux
esac

zvm_after_init_commands+=('[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh')

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Start TMUX Session everytime
#[ -x "$(command -v tmux)" ] \
#  && [ -z "${TMUX}" ] \
#  && (tmux attach || tmux ) >/dev/null 2>&1

source ~/.zplug/init.zsh

zplug chriskempson/base16-shell, from:github
zplug "jeffreytse/zsh-vi-mode"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export VDPAU_DRIVER=va_gl
export LIBVA_DRIVER_NAME=i965
#export AMD_VULKAN_ICD=RADV
#export VDPAU_DRIVER=radeonsi
#export LIBVA_DRIVER_NAME=radeonsi
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export MOZ_X11_EGL=1

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="oxide"
export USE_CCACHE=1
unsetopt auto_cd
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in damuse).
# export UPDATE_ZSH_DAmuse=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Skip forward/back a word with opt-arrow
bindkey '[C' forward-word
bindkey '[D' backward-word

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)
# MODE_INDICATOR="%F{red}*%f"
ZVM_CURSOR_STYLE_ENABLED=false
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

## PATH declarations
export PATH=$HOME/bin:/usr/local/bin:/home/tiago/.local/bin:$PATH
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/opt/firefox:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
#Compilation flags
export ARCHFLAGS="-arch x86_64"

## Aliases and Personal functions
alias t2='tmux -2'
alias transpt='clear;trans -t pt-BR '
alias ntp='sudo ntpdate -u pool.ntp.org'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias weather='curl wttr.in'
alias tobrl='/home/tiago/bin/projects/ruby/tobrl'
alias yay='paru'
alias yth264='mpv --ytdl-format="bestvideo[ext=mp4][height<=?1080][fps<=30]+bestaudio[ext=m4a]"'

function mcd() {
  mkdir -p "$1"
  cd "$1"
}

function tp_config() {
  local TOUCHPAD="ETPS/2 Elantech Touchpad";
  local ACCEL=$(xinput list-props $TOUCHPAD \
    | grep Accel \
    | awk '{gsub(/[():]/,"");print $4}' FS=' ' \
    | head -n1);
      local BTN_MAP=$(xinput list-props $TOUCHPAD \
        | grep 'Mapping Enabled' \
        | awk '{gsub(/[():]/,"");print $6}' FS=' ' \
        | head -n1);

      xinput set-prop $TOUCHPAD $ACCEL 0.5
      xinput set-prop $TOUCHPAD $BTN_MAP 1 0

      if [ $? -eq 0 ]; then
        print 'Touchpad configured'
      else
        echo "Oops, something went wrong"
      fi
    }

## FZF config
[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh


## NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}"  ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"

eval "$(rbenv init -)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
