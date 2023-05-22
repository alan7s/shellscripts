#!/bin/bash
cd /tmp
if wget 'http://download.virtualbox.org/virtualbox/7.0.6/VBoxGuestAdditions_7.0.6.iso'; then
    if sudo mount VBoxGuestAdditions_7.0.6.iso -o loop /mnt; then
        if sudo /mnt/VBoxLinuxAdditions.run; then
            sudo umount /mnt
            sudo reboot
        else
            echo "Erro ao executar o script de instalação das adições de convidado do VirtualBox."
        fi
    else
        echo "Erro ao montar o arquivo ISO das adições de convidado do VirtualBox."
    fi
else
    echo "Erro ao fazer o download do arquivo ISO das adições de convidado do VirtualBox."
fi
