#!/bin/bash

# Excluir diretórios, arquivos, grupos e usuários criados anteriormente;
# Todo provisionamento deve ser feito em um arquivo do tipo Bash Script;
# O dono de todos os diretórios criados será o usuário root;
# Todos os usuários terão permissão total dentro do diretório publico;
# Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
# Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem;
# Subir arquivo de script criado para a sua conta no GitHub.

# Pressupõe execução como root
# Em caso negativo:
#su

users=('carlos' 'maria' 'joao' 'debora' 'sebastiana' 'roberto' 'josefina' 'amanda' 'rogerio')

# Criar usuários
for usr in ${users[@]}; do
    echo "Criando usuário $usr"
    useradd $usr -m -s /bin/bash -p $(openssl passwd ${usr}123)
    passwd $usr -e
    echo "Usuário $usr criado com sucesso!"
    echo
done

# Criar grupos
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRO_SEC

# Criar diretórios
cd /
mkdir -m 777 publico
mkdir -m 770 adm ven sec
chgrp GRP_ADM adm/
chgrp GRP_VEN ven/
chgrp GRP_SEC sec/

# Incluir usuários nos grupos
usermod -G GRP_ADM carlos
usermod -G GRP_ADM maria
usermod -G GRP_ADM joao

usermod -G GRP_VEN debora
usermod -G GRP_VEN sebastiana
usermod -G GRP_VEN roberto

usermod -G GRP_SEC josefina
usermod -G GRP_SEC amanda
usermod -G GRP_SEC rogerio
