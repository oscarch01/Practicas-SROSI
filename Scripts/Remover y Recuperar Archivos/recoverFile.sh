####################################################################
# Author:  oscar
# Date:  sáb ago 25 17:19:17 CDT 2018
# Description:  Script to recover a file deleted safely
####################################################################

#!/bin/bash
if [ -z "$1" ]
then
	echo "No ha dado un nombre de archivo a recuperar"
else
	if [ -e ~/.Trash/files/"$1" ]
		then
			originalpath=$(cat ~/.Trash/info/$1.info)
			mv ~/.Trash/files/$1 $originalpath
			rm ~/.Trash/info/$1.info
			echo "Archivo restaurado a ($originalpath)"
		else
			echo "Ese archivo no existe en la papelera"
	fi
fi
