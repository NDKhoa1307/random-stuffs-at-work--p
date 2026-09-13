#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias lg='lazygit'

PS1='[\u@\h \W]\$ '

# Local environment and package paths
. "$HOME/.local/bin/env"
export PATH="/home/khoand1307/.local/bin:$PATH"

# Powerline prompt
source ~/.bash-powerline.sh

# Start SSH Agent via keychain
eval $(keychain --eval --agents ssh id_ed25519)

# ==========================
# Tmux Auto-Start (uncomment to auto-attach tmux on interactive shells)
# ==========================
# if [[ $- =~ i ]] && [[ -z "$TMUX" ]]; then
#     tmux attach-session || tmux new-session
#     return
# fi

# Enable window resize tracking
shopt -s checkwinsize
