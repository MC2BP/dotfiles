HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
export LANG=en_US.utf8
export LANGUAGE=en_US.utf8
zstyle :compinstall filename '/home/ki/.zshrc'
autoload -Uz compinit
compinit
autoload -U colors && colors

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats ' %b'

PROMPT='%F{green}%n@%m %F{blue}- %~ %F{yellow}${vcs_info_msg_0_}%f
%F{white}> '

# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
#autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
#setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
#add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red  
#PROMPT='%1~ %F{red}${vcs_info_msg_0_}%f %# '

export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

alias please=doas
alias vim=nvim
alias xi=xbps-install
alias xq=xbps-query
alias xr=xbps-remove

export CC=/usr/bin/gcc
export GCC=/usr/bin/gcc
