#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# source bash alias 
source ~/.bash_aliases

# use terminal in vim mode 
bindkey -v
bindkey 'jk' vi-cmd-mode
bindkey -v "^A" beginning-of-line
bindkey -v "^B" backward-char
bindkey -v "^E" end-of-line
bindkey -v "^B" backward-char
bindkey -v "^F" forward-char
bindkey -v "^K" kill-line
bindkey -v "^N" history-substring-search-down
bindkey -v "^P" history-substring-search-up
bindkey -v "^U" kill-whole-line
bindkey -v "^Y" yank
bindkey -M vicmd "^A" beginning-of-line
bindkey -M vicmd "^E" end-of-line
bindkey -M vicmd "^B" backward-char
bindkey -M vicmd "^F" forward-char
bindkey -M vicmd "^K" kill-line
bindkey -M vicmd "^U" kill-whole-line
bindkey -M vicmd "^N" history-substring-search-down
bindkey -M vicmd "^P" history-substring-search-up
bindkey -M vicmd v edit-command-line
export KEYTIMEOUT=30 # this reduces the delay when switching modes
