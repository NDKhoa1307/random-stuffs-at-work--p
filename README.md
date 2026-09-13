# Dotfiles

This is `$HOME` itself, tracked as a git repo. Only the files below are
tracked — everything else (secrets, caches, downloads, project checkouts) is
denied by `.gitignore` and never gets added by accident.

## Tracked

| Path | What |
|---|---|
| `.bashrc`, `.bash_profile`, `.bash_logout` | Bash config |
| `.bash-powerline.sh` | Bash prompt |
| `.gitconfig` | Git identity/settings |
| `.tmux.conf` | tmux config (prefix `C-s`, mouse, vim-style panes, Catppuccin) |
| `.config/nvim/` | Neovim config (AstroNvim-based) |
| `.config/ruff/` | Ruff (Python linter) config |

## Deliberately NOT tracked

- Secrets/credentials: `.ssh/`, `.gnupg/`, `.aws/`, `.npm/`, `.docker/`,
  `.claude/.credentials.json`, `.config/github-copilot/auth.db`
- Caches/state: `.cache/`, `.local/`, `.bash_history`
- Installers/binaries: `nvim-linux-x86_64.tar.gz`, `session-manager-plugin.*`,
  `n/`, `yay/`
- Plugin managers' own clones (reinstalled, see below): `.tmux/plugins/tpm`,
  `.config/tmux/plugins/catppuccin`
- `projects/` — separate project checkouts, not environment config

## Bootstrapping a new machine

```sh
# 1. Clone this repo directly over $HOME (on the new machine, as $HOME):
git clone <remote-url> ~ 2>/dev/null || \
  (git init && git remote add origin <remote-url> && git fetch origin master && git checkout -f master)


# 2. Neovim: install the binary (nvim >= 0.10), then just launch it —
#    lazy.nvim will bootstrap itself and install all plugins from lazy-lock.json.
nvim

# 3. tmux: install tmux, then the plugin manager (TPM) and theme, matching
#    the paths .tmux.conf expects:
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/catppuccin/tmux ~/.config/tmux/plugins/catppuccin
# start tmux, then press: prefix + I   (installs tmux-yank/cpu/battery)

# 4. Shell: .bashrc expects `keychain` (ssh-agent wrapper) and `lazygit` on
#    PATH, and sources ~/n/... via n-install for Node version management -
#    install those separately if you use them.
```
