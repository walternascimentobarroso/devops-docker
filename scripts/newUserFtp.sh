#!/bin/bash

##########################################################################################################
# Script para criar um novo usuário FTP no servidor Linux.                                               #
#                                                                                                        #
# Uso:                                                                                                   #
#                                                                                                        #
#   sh new-cria-ftp.sh <usuario> <diretorio>                                                             #
#                                                                                                        #
#   Exemplo:                                                                                             #
#                                                                                                        #
#   sh new-cria-ftp.sh infarmamarcaspre /consys/sitelinked/redes/infarmamarcas/upload/precificacao_trier #
#                                                                                                        #
# Este script cria um novo usuário FTP com o nome especificado e                                         #
# atribui um diretório específico para o mesmo.                                                          #
#                                                                                                        #
# Certifique-se de ajustar as permissões do diretório e configurar o                                     #
# vsftpd corretamente para permitir o acesso ao diretório do usuário                                     #
##########################################################################################################


# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script precisa ser executado como root."
    exit 1
fi

# Verifica se os argumentos foram fornecidos corretamente
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <usuario> <diretorio>"
    exit 1
fi

# Atribui os argumentos a variáveis
username="$1"
directory="$2"

# Verifica se o usuário já existe
if id "$username" &>/dev/null; then
    echo "O usuário '$username' já existe."
    exit 1
fi

# Cria o usuário
useradd -m "$username"

# Define a senha para o usuário
read -s -p "Digite a senha para '$username': " password
echo "$username:$password" | chpasswd

# Define o diretório home do usuário
usermod -d "$directory" "$username"

# Define o shell do usuário como nologin
usermod -s /sbin/nologin "$username"

# Adiciona o usuário à lista de usuários permitidos pelo vsftpd
echo "$username" >> /etc/vsftpd/user_list

# Adiciona o usuário à lista de usuários chrooted pelo vsftpd
echo "$username" >> /etc/vsftpd/chroot_list

# Reinicia o serviço vsftpd
systemctl restart vsftpd

# Exibe as informações de acesso
echo "Usuário '$username' foi criado com sucesso."
echo "Diretório: $directory"
echo "Senha: $password"