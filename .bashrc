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

# Export path for packages
export PATH="/home/khoand1307/.local/bin:$PATH" # .local/bin
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"  # Nvim

# Powerline
source ~/.bash-powerline.sh

# Start SSH Agent and load keys
eval $(keychain --eval --quiet id_ed25519)
eval $(keychain --eval --agents ssh id_rsa)

# ==========================
# Tmux Auto-Start
# ==========================
# Check if the shell is interactive and NOT already inside a tmux session
# # ==========================
# Tmux Auto-Start
# ==========================
if [[ $- =~ i ]] && [[ -z "$TMUX" ]]; then
    # Attach to existing session, or create a new one if none exists
    tmux attach-session || tmux new-session

    # Prevent bash from running any remaining background commands
    return
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Enable checkwinsize
shopt -s checkwinsize
