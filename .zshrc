# Load .profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Plugin manager
source ~/scripts/antigen.zsh
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# Git
setopt prompt_subst
. ~/scripts/git-prompt.sh

# Load aliases
#source ~/.zsh/aliases.zsh

# Global
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -v
zstyle :compinstall filename '/home/neosiae/.zshrc'
autoload -Uz compinit
compinit

prompt() {
  NEW_LINE=$'\n'
  HOST="%F{green}$(whoami)"
  BRANCH=$'%F{red}$(__git_ps1 "%s")'
  DIR="%F{blue}[ $(basename $PWD) ] $BRANCH"
  PROMPT="$DIR$NEW_LINE$HOST "
}

add-zsh-hook precmd prompt
