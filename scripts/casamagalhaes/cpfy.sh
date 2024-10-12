#!/bin/bash
# ****************************************************************
#
# Script que faz a copia de arquivos para Caixas Linux
# Versão: 1.0
# Desenvolvido por: Matheus Wesley
# Contatos: https://matheuswesley.github.io/devlinks
#
# ****************************************************************


# Funções
copy_with_scp() {
  read -p "Informe o IP do computador remoto: " remote_ip
  if [[ -z "$remote_ip" ]]; then
    echo "Erro: IP não informado."
    return 1
  fi

  read -p "Informe o diretório ou arquivo remoto que deseja copiar: " remote_dir
  if [[ -z "$remote_dir" ]]; then
    echo "Erro: Diretório remoto não informado."
    return 1
  fi

  read -p "Informe o diretório local onde deseja salvar: " local_dir
  if [[ -z "$local_dir" ]]; then
    echo "Erro: Diretório local não informado."
    return 1
  fi

  # Verifica que a pasta local existe
  if [[ ! -d "$local_dir" ]]; then
    echo "O diretório local não existe. Criando diretório..."
    mkdir -p "$local_dir"
  fi

  echo "Iniciando a cópia de arquivos de $remote_ip:$remote_dir para $local_dir..."

  # Copiando com o SCP
  if scp -r "root@$remote_ip:$remote_dir" "$local_dir"; then
    echo "Cópia concluída com sucesso."
  else
    echo "Erro ao copiar os arquivos."
    return 1
  fi
}

copy_with_rsync() {
  read -p "Informe o IP do computador remoto: " remote_ip
  if [[ -z "$remote_ip" ]]; then
    echo "Erro: IP não informado."
    return 1
  fi

  read -p "Informe o diretório ou arquivo remoto que deseja copiar: " remote_dir
  if [[ -z "$remote_dir" ]]; then
    echo "Erro: Diretório remoto não informado."
    return 1
  fi

  read -p "Informe o diretório local onde deseja salvar: " local_dir
  if [[ -z "$local_dir" ]]; then
    echo "Erro: Diretório local não informado."
    return 1
  fi

  # Verifica que a pasta local existe
  if [[ ! -d "$local_dir" ]]; then
    echo "O diretório local não existe. Criando diretório..."
    mkdir -p "$local_dir"
  fi

  echo "Iniciando a cópia de arquivos de $remote_ip:$remote_dir para $local_dir..."

  # Copiando com o RSYNC
  if rsync -av --progress "root@$remote_ip:$remote_dir" "$local_dir"; then
    echo "Cópia concluída com sucesso."
  else
    echo "Erro ao copiar os arquivos."
    return 1
  fi
}

# Menu

menu() {
    echo "======================="
    echo "       MENU"
    echo "======================="
    echo "1) Copiar com SCP"
    echo "2) Copiar com RSYNC"
    echo "0) Sair"
}

opcoes() {
    local choice
    read -p "Escolha uma opção [0-2]: " opc

    case $opc in
        1)
            copy_with_scp
            ;;
        2)
            copy_with_rsync
            ;;
        0)
            echo "Saindo..."
            exit 0
            ;;
        *)
            clear
            echo "Opção inválida!"
            ;;
    esac
}

while true; do
    menu
    opcoes
    echo ""
  done
