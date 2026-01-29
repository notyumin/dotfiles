# Environment Variables
export ASDF_DATA_DIR=~/.asdf
export PATH=$ASDF_DATA_DIR/shims:$PATH:/usr/local/go/bin:~/.local/bin:~/go/bin

# Vi mode
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Zsh autosuggestions and syntax highlighting
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls="eza --icons=always"

# zoxide, oh-my-posh
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config '~/.config/omp/nordtron.omp.json')"
eval $(thefuck --alias)

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Case-insensitive Completion https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # case-insensitive matching only if there are no case-sensitive matches

# Yazi cd on exit
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

[ -f "/home/allinav/.ghcup/env" ] && . "/home/allinav/.ghcup/env" # ghcup-env

echo ".                                             ." | fmt -c -w $COLUMNS
echo ".     What a wonderful thought it is          ." | fmt -c -w $COLUMNS
echo ".       that some of the best days of our     ." | fmt -c -w $COLUMNS
echo ".         lives haven't even happened yet     ." | fmt -c -w $COLUMNS
echo ".                                             ." | fmt -c -w $COLUMNS
echo ".                         ~ Anne Frank        ." | fmt -c -w $COLUMNS

