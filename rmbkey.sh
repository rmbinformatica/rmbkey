#!/bin/bash
echo "Instalando as chaves SSH da RMB Informatica..."
mkdir .ssh
curl key.rmbinformatica.net -L -o .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
echo "Desativando login por senha no servidor SSH..."
sed -i -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
echo "Reinicializando o servidor SSH..."
service sshd restart
