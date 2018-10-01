####################################################################
# Author: Oscar
# Date: 25-Ago-2018 11:49
# Description: Script to generate scripts with automatic header
####################################################################

#!/bin/bash

if [ -z "$1" ]
then 
	echo "No ha asignado un nombre a su archivo"
else
	if [ -z "$2" ]
	then
		echo "No ha dado una descripción para su archivo"
	else
		touch $1.sh
		echo "####################################################################" > $1.sh
		echo "# Author:  $(whoami)" >> $1.sh
		echo "# Date:  $(date)" >> $1.sh
		echo "# Description: " $2 >> $1.sh
		echo "####################################################################" >> $1.sh
		echo "" >> $1.sh
		echo "#!/bin/bash" >> $1.sh

		nano $1.sh

		chmod 755 $1.sh

		echo "Desea ejecutar su script? (Y/N)"
		read exe
		if [ $exe == "Y" ]
		then
			./$1.sh
		fi
	fi
fi
