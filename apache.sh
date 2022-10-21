#!/bin/bash

# Restaurar o snapshot criado anteriormente no virtualbox;
# Atualizar o servidor;
# Instalar o apache2;
# Instalar o unzip;
# Baixar a aplicação disponível no endereço https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip no diretório /tmp;
# Copiar os arquivos da aplicação no diretório padrão do apache;
# Subir arquivo de script para um repositório no GitHub.

#su
apt update
apt upgrade -y
apt install apache2 unzip
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cp * /var/www/html/
