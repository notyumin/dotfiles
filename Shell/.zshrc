# Environment Variables
export PATH=$PATH:/usr/local/go/bin:/home/allinav/.local/bin

# Zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ls="eza --icons=always"

# zoxide, oh-my-posh
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config './.config/omp/nordtron.omp.json')"
eval $(thefuck --alias)

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Case-insensitive Completion https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # case-insensitive matching only if there are no case-sensitive matches

# Start asdf
. "$HOME/.asdf/asdf.sh"

