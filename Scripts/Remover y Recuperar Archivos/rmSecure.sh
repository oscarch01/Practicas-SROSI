####################################################################
# Author:  oscar
# Date:  sáb ago 25 16:22:02 CDT 2018
# Description:  Script to remove a file safely
####################################################################

#!/bin/bash

if [ -z "$1" ]
then
	echo "No ha dado un nombre de archivo"
else
	if [ -e "$1" ]
	then
		if [ ! -d ~/.Trash ]
		then
			mkdir ~/.Trash
		fi

		if [ ! -d ~/.Trash/info ]
		then
			mkdir ~/.Trash/info
		fi

		if [ ! -d ~/.Trash/files ]
		then
			mkdir ~/.Trash/files
		fi

		touch ~/.Trash/info/$1.info
		fullpath=$(readlink -f $1)
		echo "$fullpath" > ~/.Trash/info/$1.info
		mv $1 ~/.Trash/files
		echo "archivo eliminado"
	else
		echo "El archivo que desea eliminar no existe"
	fi
fi
