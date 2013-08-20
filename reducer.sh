#!/bin/bash
################################################################
# Script para reducir el tamanio de un archivo de imagen
# Toma com parametros el direcotorio de las imagenes originales
# y el directorio a donde se van a grabar las modificaciones.
# (copyleft) Milton Labanda
# 19 de Agosto 2013
################################################################

size=800x600 	# Tamanio por defecto 
d=$(pwd)	# Directorio por defecto
if [ -d "$1" ]; then
	din=$1
else
	din=$d
fi

if [ -d "$2" ]; then
	dout=$2
else
	dout=$d
fi

for image in $(ls  $din*.JPG); do 
	echo $image
	echo "Convirtiendo ...$image"
	name=$(basename $image)
	convert $image -resize 800x600 $dout$name
done

echo "Fin de proceso !!!"