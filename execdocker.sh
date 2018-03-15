# Author Marcos Ferreira da Rocha
# Ano 2018
# Version 1.1
# Email	marcos.fr.rocha@gmail.com
#
#Esse script adiciona uma faixa de endereços ips em uma interface de rede
#
# $1 rede
# $2 primeiro ip
# $3 segundo ip

count=$2
ultimoIP="`expr $3 + 1`"

while [ $count -lt $ultimoIP ]
do
  IP="${count}"
  ip addr add $1.$IP/24 dev  wlp3s1
  docker container run -it -d --rm -p $1.$IP:80:80 imagemglpi:versao2

  count=`expr $count + 1`
done


