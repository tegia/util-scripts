source "$HOME/.antigen.repo/antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle docker
antigen bundle autojump
antigen bundle command-not-found

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle superbrothers/zsh-kubectl-prompt

antigen theme dpoggi

antigen apply

# Aliases
alias suser='su -'

# user configs
[[ -r /etc/zsh/zshrc.local ]] && source /etc/zsh/zshrc.local
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

[[ -r "$HOME/.autoenv.sh" ]] && source "$HOME/.autoenv.sh"