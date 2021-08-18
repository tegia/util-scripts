source "$HOME/.antigen.repo/antigen.zsh"

antigen use oh-my-zsh

DISABLE_AUTO_TITLE="true"

antigen bundle git
antigen bundle pip
antigen bundle docker
antigen bundle autojump
antigen bundle command-not-found

antigen bundle zsh-users/zsh-autosuggestions

antigen theme jispwoso

antigen apply

PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[cyan]%}%m\
%{$reset_color%}:%{$fg[magenta]%}%~\
 %{$fg_bold[blue]%}$(git_prompt_info) %{$reset_color%}
${ret_status}%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'


export WORKON_HOME=$HOME/.pyenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
[[ -r /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh


# Aliases
alias suser='su -'

# user configs
[[ -r /etc/zsh/zshrc.local ]] && source /etc/zsh/zshrc.local
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

[[ -r "$HOME/.autoenv.sh" ]] && source "$HOME/.autoenv.sh"
