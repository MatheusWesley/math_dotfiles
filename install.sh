#!/bin/bash

# Caminhos das pastas
DOTFILES_DIR="$HOME/math_dotfiles/"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$CONFIG_DIR/backup"

# Verifica se a pasta de backup já existe, se não, cria
if [ ! -d "$BACKUP_DIR" ]; then
  # echo "Criando pasta de backup em $BACKUP_DIR..."
  mkdir -p "$BACKUP_DIR"
fi

# Função para fazer backup e copiar arquivos
backup_and_copy() {
  local file="$1"
  local dest="$2"

  # Se o arquivo ou pasta já existir, faz o backup
  if [ -e "$dest" ]; then
    echo "Fazendo backup de $dest em $BACKUP_DIR..."
    mv "$dest" "$BACKUP_DIR/"
  fi

  # Copia o arquivo ou pasta para o destino
  echo "Copiando $file para $dest..."
  cp -r "$file" "$dest"
}

# Apresentação ao usuario
echo ""
echo "Olá $USER, seja bem vindo!!"
echo ""
echo "Este script irá copiar meus arquivos de configuração para:"
echo $CONFIG_DIR
echo ""
read -p "Deseja continuar com o processo? (S/n): " confirm

if [[ $confirm == "" || $confirm == "S" ]]; then
  # Copiando o .zshrc e zshrc para ~/.config
  backup_and_copy "$DOTFILES_DIR/zshconfig/.zshrc" "$CONFIG_DIR/.zshrc"
  backup_and_copy "$DOTFILES_DIR/zshconfig/zshrc" "$CONFIG_DIR/zshrc"

  # Copiar a pasta nvim para ~/.config
  backup_and_copy "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

  echo "Processo concluído! ✅"
else
  if [[ $confirm == "n" ]]; then

    echo "Processo cancelado ❌"
  fi

fi
