#!/bin/bash
help(){
 echo "Crie um arquivo com nome jogos.txt no mesmo diretório"
 echo "Coloque um jogo por linha no arquivo no formato: 01-02-03-04-05-06"
 echo "Execute o script passando o resultado da loteria"
 echo "Exemplo: ./loteria_check.sh 01 02 03 04 05 06"
}
if [ $1 == "-h" ];then
 help
else
 typeset arr winner cont game store n
 IFS=$'\n'
 declare -a arr winner
 winner=$@
 echo "Loteria resultado:" ${winner[@]}
 echo "Resultado seus jogos:"
 for game in $(cat jogos.txt | tr '-' ' '); do
  arr+=($game)
 done
 declare -i cont game
 cont=0
 game=1
 for j in ${arr[@]};do
  echo "--------------------------------------------------"
  store=$j
  IFS=$' '
  for i in $store;do
   n=$i
   for k in ${winner[@]};do
    if [ $n == $k ]; then
     cont+=1
    fi
   done
  done
  echo "Jogo:" $game "| Acertos: " $cont
  echo $j
  echo "--------------------------------------------------"
  cont=0
  game+=1
  IFS=$'\n'
 done
fi
