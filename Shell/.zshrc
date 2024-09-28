# Environment Variables
export PATH=$PATH:/usr/local/go/bin:/home/allinav/.local/bin

# Zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ls="eza --icons=always"

# zoxide and oh-my-posh
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/nordtron.omp.json')"

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start asdf
. "$HOME/.asdf/asdf.sh"
