#!/bin/bash

# Verifica se o GitHub CLI está instalado
if ! command -v gh &>/dev/null; then
  echo "GitHub CLI (gh) não está instalado. Instale-o e tente novamente."
  exit 1
fi

# Solicita a mensagem de commit
read -p "Digite o commit (Padrão: Initial commit): " commit_message

# Verifica se a mensagem de commit está vazia e define uma mensagem padrão
if [[ -z $commit_message ]]; then
  commit_message="Initial commit"
fi

# Inicializa o repositório Git, adiciona arquivos, faz o commit e cria o repositório no GitHub
git init
git add .
git commit -m "$commit_message"

# Cria o repositório no GitHub (você pode mudar para privado ou deixar público)
gh repo create --public --source=. --remote=origin

# Faz o push para o repositório remoto
git push -u origin master

# Notifica o usuário
notify-send "GitRepo" "Repositório criado com sucesso!"
