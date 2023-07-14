# Set up zsh-autocomplete
eval "source ~/Documents/Coding/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Set up starship
eval "$(starship init zsh)"
export VIRTUAL_ENV_DISABLE_PROMPT=0

# Set up zoxide
eval "$(zoxide init zsh)"

# set up editor
export EDITOR=hx

# Setup navigation shortcuts
cx() { z "$1" && lsd; }
alias home="cx ~"
alias config="cx ~/.config"
alias za="zellij a"
alias zs="zellij -s"
zla() { zellij a "$(zellij ls | fzf)" ; }
python-init() {
    mkdir "$1"
    cd "$1"
    python3 -m venv .venv
    source .venv/bin/activate
    gi python,macos,git > .gitignore
    git init
    touch requirements.txt
    mkdir src
    touch src/__init__.py src/main.py
    cp ~/.config/dev-requirements.txt dev-requirements.txt
    pip3 install -r dev-requirements.txt
}

# Setup reload alias
alias reload="source ~/.zshrc"

# Setup dotfile git alias
alias dotfile="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Setup application alias
alias du="dust"
alias lg="lazygit"
alias ld="lazydocker"

# Set options
setopt always_to_end
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt correct_all
setopt share_history
setopt append_history
setopt nonomatch
setopt glob_dots
setopt prompt_subst

# Setup bat theme
export BAT_THEME="Catppuccin-macchiato"

# Setup PATH
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Setup zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi
rm -f ~/.zcompdump; compinit
chmod -R go-w '/opt/homebrew/share/zsh'

# Setup zsh-syntax-highlighting
source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Configure gitignore.io
gi () { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ; }

# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
# Created by `pipx` on 2023-06-12 12:46:11
export PATH="$PATH:/Users/avi/.local/bin"

# Setup compinit
autoload -Uz compinit && compinit

source /Users/avi/.config/broot/launcher/bash/br

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/avi/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
