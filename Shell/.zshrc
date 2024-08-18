export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Environment Variables
export PATH=$PATH:/usr/local/go/bin:/home/allinav/.local/bin

# Zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
# alias ls="ls --color=auto"

# zoxide and oh-my-posh
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/nordtron.omp.json')"

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start asdf
. "$HOME/.asdf/asdf.sh"
