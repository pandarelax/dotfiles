# ~/.zshrc
#
# source ~/aliases.zsh
# ssh settings
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_ed25519_wsl 2>/dev/null

# History ayarları
HISTSIZE=1000
HISTFILESIZE=2000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt append_history

# Colors & ls
[ -x "$(which dircolors)" ] && { \
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
  || eval "$(dircolors -b)"; }
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# less pipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# NVM tamamlayıcı
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# uv & uvx completion
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# Zsh plugins (manuel veya antibody/oh-my-zsh ile)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship başlat
eval "$(starship init zsh)"
