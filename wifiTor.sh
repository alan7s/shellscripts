#!/bin/bash
# script para iniciar rede tor no ponto de acesso wifi

# subir wifi
if ! sudo systemctl restart hostapd; then
  echo "Failed to restart hostapd"
  exit 1
fi

# restart rede tor [demora conectar]
if ! sudo service tor stop; then
  echo "Failed to stop tor"
  exit 1
fi

if ! sudo service tor start; then
  echo "Failed to start tor"
  exit 1
fi
echo "All commands executed successfully"
