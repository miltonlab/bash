#!/bin/bash
###########################################################################
# Copyright (C) <2013>  <Milton Labanda>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
# or see <http://www.gnu.org/licenses/>
############################################################################

# Script para reducir el tamanio de un archivo de imagen, toma com parametros
# el direcotorio de las imagenes originales y el directorio a donde se van a 
# grabar las modificaciones.
# Se requiere instalar ImageMagick para utilizar el comando 'convert'.

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

for image in $(ls $din*.JPG $din*.jpg); do 
	echo $image
	echo "Convirtiendo ... $image"
	name=$(basename $image)
	convert $image -resize $size $dout$name
done

echo "Fin de proceso !!!"
