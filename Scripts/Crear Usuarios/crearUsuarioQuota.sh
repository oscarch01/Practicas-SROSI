#!/usr/bin/env python

###################################################################
# Autor: oscar
# Fecha: vie sep  7 21:50:35 CDT 2018
# Descripcion: Crear usuario mediante determinadas reglas de forma interactiva con quotas
###################################################################
import os
import crypt
import re
import getpass

def validateString(s):
    letterUpper_flag = False
    special_flag = False
    leng_flag = False
    number_flag = False
    for i in s:
        if i.isalpha():
            if i.isupper():
                letterUpper_flag = True
        if i.isdigit():
            number_flag = True

    regex = re.compile('[@_!#$%^&*()<>?/\|}{~:]') 
    if not(regex.search(s) == None): 
       special_flag = True

    if (len(s) >= 8): 
       leng_flag = True

    return letterUpper_flag and number_flag and special_flag and leng_flag

user = raw_input("Ingrese un usuario: ")

name = raw_input("Ingrese un nombre de usuario: ")

home = raw_input("Ingrese una directorio hogar (si no existe se creara): ")

d_group = raw_input("Desea agregar el usuario a un grupo [S/N]: ")

if d_group == "S":
    group = raw_input("Ingrese un grupo: ")

d_skel = raw_input("Desea usar un esqueleto [S/N]: ")

if d_skel == "S":
    skel = raw_input("Ingrese un directorio esqueleto: ")
        
shell = raw_input("Ingrese una consola predeterminada: ")

password = getpass.getpass("Ingrese una contrasenia para su usuario (minimo de 8 caracteres, debe contener al menos una mayuscula, un caracter especial y un numero): ")

while not (validateString(password)):
    password = getpass.getpass("Contrasenia incorrecta, no cumple con los estandares de seguridad, por favor ingrese otra: ")

encPass = crypt.crypt(password,"22")

if d_group == "S" and d_skel == "S":
    os.system("sudo useradd -d "+home+" -m -k "+skel+" -s "+shell+" -c "+name+" -g "+group+" -p "+encPass+" "+user)
elif d_group == "S" and d_skel != "S":
    os.system("sudo useradd -d "+home+" -m -s "+shell+" -c "+name+" -g "+group+" -p "+encPass+" "+user)
elif d_group != "S" and d_skel == "S":
    os.system("sudo useradd -d "+home+" -m -k "+skel+" -s "+shell+" -c "+name+" -p "+encPass+" "+user)
elif d_group != "S" and d_skel != "S":
    os.system("sudo useradd -d "+home+" -m -s "+shell+" -c "+name+" -p "+encPass+" "+user)

#setquota

quotatype = raw_input("Que tipo de quota desea utilizar (Bloques/Nodos) [B/N]: ")
soft = raw_input("Cual es el limite ligero: ")
hard = raw_input("Cual es el limite duro: ")

if quotatype == "B":
    os.system("sudo setquota -u "+user+" "+soft+" "+hard+" 0 0 -a")
else:
    os.system("sudo setquota -u "+user+" 0 0 "+soft+" "+hard+" -a")

login = raw_input("Usuario creado con exito, desea ingresar con el? [S/N]: ")

if login == "S":
    os.system("su -l "+user)