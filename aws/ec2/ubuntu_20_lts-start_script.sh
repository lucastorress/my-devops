#!/bin/bash

# Atualizar a lista de pacotes e atualizar todos os pacotes existentes
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar pré-requisitos para o Docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adicionar o repositório do Docker às fontes do APT
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Atualizar a lista de pacotes após adicionar o repositório do Docker
sudo apt-get update -y

# Instalar Docker
sudo apt-get install -y docker-ce

# Adicionar o usuário atual ao grupo Docker para executar comandos Docker sem sudo
sudo usermod -aG docker ${USER}

# Instalar Docker Compose
# Verificar a última versão do Docker Compose em https://github.com/docker/compose/releases
COMPOSE_VERSION="2.26.1"
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Tornar o binário do Docker Compose executável
sudo chmod +x /usr/local/bin/docker-compose

# Reiniciar o sistema para aplicar todos os updates e configurações
sudo reboot
