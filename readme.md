##### RODAR APENAS NA PRIMEIRA CONFIGURAÇÃO #####
1. apt-get update
2. apt-get upgrade -y
3. apt-get install rar

#### COMANDO DOCKER PARA DESTRUIR TODAS AS IMAGENS
$ docker rmi -f $(docker images -a -q)