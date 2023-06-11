# Set up zsh-autocomplete
eval "source ~/Documents/Coding/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Set up starship
eval "$(starship init zsh)"

# Set up zoxide
eval "$(zoxide init zsh)"

# Set up pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# set up editor
export EDITOR=hx

# Setup navigation shortcuts
cx() { z "$1" && lsd; }
alias home="z ~"
alias ls="lsd"
alias za="zellij a"
alias zs="zellij -s"
zla() { zellij a "$(zellij ls | fzf)" ; }


# Setup reload alias
alias reload="source ~/.zshrc"

# Setup colima alias
alias colima-start="export COLIMA_STATE=aarch64-docker && colima start" # https://alexos.dev/2022/01/02/docker-desktop-alternatives-for-m1-mac/#recommended-option---colima
alias colima-stop="unset COLIMA_STATE && colima stop"

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

# Setup go/bin in PATH
export PATH="$HOME/go/bin:$PATH"

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