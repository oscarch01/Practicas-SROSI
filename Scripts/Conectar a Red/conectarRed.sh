####################################################################
# Author:  oscar
# Date:  lun sep 17 13:23:35 CDT 2018
# Description:  Este script conecta a una red alambrica o inalambrica
####################################################################

#!/bin/bash
echo "Que tipo de interfaz desea utilizar"
echo "	1) Alambrica"
echo "	2) Inalambrica"
read type

case $type in
	1)
		echo "Que tipo de configuración desea?"
		echo "	1) Manual"
		echo "	2) DHCP"
		read type2
		case $type2 in
			1)
				echo "por favor  verifique que tiene conectado un cable de red"
				echo "introduzca una dirección IP valida"
				read ipaddr
				echo "ingrese una mascara de red en formato  CDIR"
				read netmask
				echo "Ingresa una dirección de salida valida"
				read routedef
				sudo ip address add $ipaddr/$netmask dev enp2s0f2
				sudo ip route add default via $routedef
				;;
			2)
				sudo dhclient enp2s0f2 -v
				;;
			*) 
			echo "Selección erronea"
				;;
		esac
		;;
	2)
		echo "Seleccione un protocolo de conexión:"
		echo "	1) WPA"	
		echo "	2) WEP"
		read type3
		case $type3 in 
			1)
				echo "ingrese el SSID"
				read wpassid
				echo "ingrese su contraseña"
				read wpapassword
				wpa_passphrase $wpassid $wpapassword > wpa.conf
				sudo wpa_supplicant -D wext -c wpa.conf -i wlp3s0
				;;
			2)
				echo "ingrese el SSID"
				read wepssid
				echo "ingrese su contraseña"
				read weppassword
				sudo iwconfig wlp3s0 essid $wepssid key $weppassword
				;;
			*)
				echo "opción invalida"
				;;
		esac

		echo "Que tipo de configuración desea?"
		echo "	1) Manual"
		echo "	2) DHCP"
		read type2
		case $type2 in
			1)
				echo "por favor  verifique que tiene conectado un cable de red"
				echo "introduzca una dirección IP valida"
				read ipaddr
				echo "ingrese una mascara de red en formato  CDIR"
				read netmask
				echo "Ingresa una dirección de salida valida"
				read routedef
				sudo ip address add $ipaddr/$netmask dev wlp3s0
				sudo ip route add default via $routedef
				;;
			2)
				sudo dhclient wlp3s0 -v
				;;
			*) 
			echo "Selección erronea"
				;;
		esac
		;;
	*)
		echo "Selección erronea"
		;;

esac
