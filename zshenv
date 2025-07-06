# Ortam değişkenleri & PATH
export PATH="/mnt/c/Windows/System32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:$PATH"
export PATH="$HOME/.local/bin:/opt/nvim/bin:/usr/local/go/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export XDG_RUNTIME_DIR=/tmp/xdg_runtime

# Rust Cargo ortamı
[ -f "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

