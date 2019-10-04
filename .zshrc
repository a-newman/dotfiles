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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/anelise/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/anelise/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/anelise/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/anelise/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# this makes gpustat use the same indices as cuda 
export CUDA_DEVICE_ORDER=PCI_BUS_ID

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
