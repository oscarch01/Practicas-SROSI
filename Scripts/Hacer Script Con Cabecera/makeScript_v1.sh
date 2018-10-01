####################################################################
# Author: Oscar
# Date: 25-Ago-2018 11:49
# Description: Script to generate scripts with automatic header
####################################################################

#!/bin/bash

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

./$1.sh
