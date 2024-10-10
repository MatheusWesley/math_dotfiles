#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           
# -----------------------------------------------------
# ML4W zshrc loader
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/zshrc 
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc 
# -----------------------------------------------------

for f in ~/.config/zshrc/*; do 
    if [ ! -d $f ] ;then
        c=`echo $f | sed -e "s=.config/zshrc=.config/zshrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done


export WARP_ENABLE_WAYLAND=1
export MESA_D3D12_DEFAULT_ADAPTER_NAME=NVIDIA
export WGPU_BACKEND=gl

# Meus Alias
alias zx='clear'
alias ls='exa -a --icons'
alias ll='exa -al --icons'
alias lt='exa -a --tree --level=1 --icons'
alias x='exit' # fecha terminal

# Notes
alias n='$HOME/notes-cli/notes.sh'
alias notes='$HOME/notes-cli/notes.sh'
alias notesl='notes -l'

# Git
alias newRepo='$HOME/math_dotfiles/newRepoGit.sh'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
