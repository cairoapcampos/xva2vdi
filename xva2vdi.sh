#!/bin/bash

######################################################
# Script de Conversão de XVA para VDI (xva2vdi)      #
# Versão: 1.0 - 22/06/21                             #
# Autor: Cairo Ap. Campos                            #
######################################################

inputVM=inputVM.xva
outputImg=outputImg.img
outputDisc=outputDisc.vdi

echo
echo "A VM a ser convertida é: $inputVM"

refFolder=$(tar tf $inputVM | awk -F "/" {'print $1'} | sort | uniq -c | grep Ref | awk '{print $2}')
echo
echo "refFolder é: $refFolder"

lastBlockDisk=$(tar tf $inputVM | grep $refFolder | tail -n2 | grep checksum | cut -d"/" -f2 | cut -d"." -f1)
echo
echo "lastBlockDisk é: $lastBlockDisk"

echo
echo "Iniciando a criação da imagem ..."
echo
./xva2img.sh $inputVM  $refFolder $lastBlockDisk $outputImg

echo
echo "Criando um disco VDI apartir da imagem criada ..."
echo
vboxmanage convertfromraw $outputImg $outputDisc --format VDI
chmod 777 $outputDisc

echo
echo "Disco Criado! :)"
echo
