#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|_|  \___|
#                           
# -----------------------------------------------------
# Carregador ML4W zshrc
# -----------------------------------------------------

# Você pode definir sua configuração personalizada 
# adicionando arquivos em ~/.config/zshrc 
# ou criando uma pasta ~/.config/zshrc/custom
# com cópias dos arquivos de ~/.config/zshrc
# -----------------------------------------------------

for f in ~/.config/zshrc/*; do 
    if [[ ! -d $f ]]; then
        c=$(echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom=")
        [[ -f $c ]] && source $c || source $f
    fi
done

# -----------------------------------------------------
# Configurações do Wayland e gráficos
# -----------------------------------------------------
# Terminal Warp no Wayland
export WARP_ENABLE_WAYLAND=1
export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA
export WGPU_BACKEND=gl

# -----------------------------------------------------
# Aliases
# -----------------------------------------------------
# Comandos para terminal e gerenciamento de diretórios
alias zx='clear'
alias ls='exa -a --icons'
alias ll='exa -al --icons'
alias lt='exa -a --tree --level=1 --icons'
alias x='exit'

# Gerenciamento de notas
note_aliases=("n='$HOME/notes-cli/notes.sh'" "notes='$HOME/notes-cli/notes.sh'" "notesl='notes -l'")
for alias_def in "${note_aliases[@]}"; do
    alias $alias_def
done

# Comandos do Git
alias newRepo='$HOME/math_dotfiles/newRepoGit.sh'

# -----------------------------------------------------
# NVM (Node Version Manager)
# -----------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # Carrega nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # Carrega bash_completion do nvm
