# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lifan/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lifan/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/lifan/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lifan/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source "$(brew --prefix powerlevel10k)/share/powerlevel10k/powerlevel10k.zsh-theme"
source ~/dotfiles/env/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

RUBIES=(
    /Users/lifan/.rubies/*
)
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-3.4.1 # run chruby to see actual version

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

source /Users/lifan/.config/broot/launcher/bash/br
