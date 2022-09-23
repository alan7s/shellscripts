#!/bin/bash
pw_length=(4 6 8) #variação de tamanho dos 4 tipo de senhas
for i in ${pw_length[@]}; do
 pwgen -A -0 -s $i 1 >> senhas.txt #uma senha apenas com letras minúsculas
 pwgen -c -0 -s $i 1 >> senhas.txt #uma senha com letras minúsculas e maiúsculas
 pwgen -c -n -s $i 1 >> senhas.txt #uma senha com letras minúsculas, letras maiúsculas e dígitos numéricos
 pwgen -y -n -s $i 1 >> senhas.txt #uma senha com letras minúsculas, letras maiúsculas, dígitos numéricos e caracteres especiais
done
senhas=$(cat senhas.txt | wc -l)
for i in $(seq $senhas);do
 useradd teste$i -p $(cat senhas.txt | sed $i'!d') #cria os usuários de teste com as senhas geradas
 if [[ $? == 0 ]];then
  echo "Usuário teste"$i" criado!"
 else
  echo "Usuário teste"$i" falhou!"
 fi
done
