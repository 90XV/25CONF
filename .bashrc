#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

alias autofan='echo level auto | sudo tee /proc/acpi/ibm/fan'
alias maxfan='echo level 7 | sudo tee /proc/acpi/ibm/fan'
alias back='cd ..'
alias prev='cd -'
alias roblox='flatpak run org.vinegarhq.Sober'
alias show='kitty +kitten icat'
