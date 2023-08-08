Due to the highly sensitive nature of my previous job, i can't upload the complete files we worked on.
Instead, i will display some random code snippets from various files.




# -*- coding: latin-1 -*-
import csv
import os
import xlrd
import shutil
import re
import copy
import contadores
#from pyproj import Proj, transform
import tkMessageBox
from Tkinter import *

filtro_E = True





#SECCION DE COORDENADAS
#############################################################################################################################################

#Transforma del sistema de proyeccion de GCBA a EPSG 4326

#def transformar_coordenadas(x,y):
#	inProj = Proj(init='+proj=tmerc +lat_0=-34.6297166 +lon_0=-58.4627 +k=0.9999980000000001 +x_0=100000 +y_0=100000 +ellps=intl +towgs84=-148,136,90,0,0,0,0 +units=m +no_defs')
#	outProj = Proj(init='epsg:4326')
#	x2,y2 = transform(inProj,outProj,x,y)
#	print x,y
#	print x2,y2
#	raw_input()
#	return str(x2) + ";" + str(y2)

	
#SECCION DE MAILS
#############################################################################################################################################

def arreglar(email):
######################### CON @
	if "@" in email:
		lista_email = email.split("@")
		if "hotma" in lista_email[1] and ("co" in lista_email[1] or ".c" in lista_email[1] or "." in lista_email[1]): ######## corrige hotmail.comsdaf o sin com
			lista_email[1] = "hotmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "hotma" in lista_email[1] and not ("." in lista_email[1]): ######## corrige hotmail sin .com
			lista_email[1] = "hotmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "ho" in lista_email[1] and ("il" in lista_email[1] and "t" in lista_email[1]): ######## corrige hotmail sin .com
			lista_email[1] = "hotmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "HOTMA" in lista_email[1] and ("CO" in lista_email[1] or ".C" in lista_email[1] or "." in lista_email[1]): ######## corrige HOTMAIL.COMsdaf o sin com
			lista_email[1] = "hotmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "HOTMA" in lista_email[1] and not ("." in lista_email[1]): ######## corrige HOTMAIL sin .com
			lista_email[1] = "hotmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "gmai" in lista_email[1] and ("co" in lista_email[1] or ".c" in lista_email[1] or "." in lista_email[1]): ######## corrige gmail.comsdfg o sin com
			lista_email[1] = "gmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "gmai" in lista_email[1] and not ("." in lista_email[1]): ######## corrige gmail sin .com
			lista_email[1] = "gmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "GMAI" in lista_email[1] and ("CO" in lista_email[1] or ".C" in lista_email[1] or "." in lista_email[1]): ######## corrige GMAIL.COMsdaf o sin com
			lista_email[1] = "gmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "GMAI" in lista_email[1] and not ("." in lista_email[1]): ######## corrige GMAIL sin .com
			lista_email[1] = "gmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "yaho" in lista_email[1] and ("com.ar" in lista_email[1]): ######## corrige yahoo.com.arsdfg
			lista_email[1] = "yahoo.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "yaho" in lista_email[1] and ("co" in lista_email[1] or ".c" in lista_email[1]): ######## corrige yahoo.comsdfg
			lista_email[1] = "yahoo.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "yaho" in lista_email[1] and not ("." in lista_email[1]): ######## corrige yahoo sin .com
			lista_email[1] = "yahoo.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "YAHO" in lista_email[1] and ("COM.AR" in lista_email[1]): ######## corrige YAHOO.COM.ARsdaf o sin com
			lista_email[1] = "yahoo.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "YAHO" in lista_email[1] and ("CO" in lista_email[1] or ".C" in lista_email[1] or "." in lista_email[1]): ######## corrige YAHOO.COMsdaf o sin com
			lista_email[1] = "yahoo.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "YAHO" in lista_email[1] and not ("." in lista_email[1]): ######## corrige YAHOO sin .com
			lista_email[1] = "yahoo.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "liv" in lista_email[1] and ("com." in lista_email[1]): ######## corrige live.com.ar.
			lista_email[1] = "live.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "sinectis" in lista_email[1]: ######## corrige sinectis
			lista_email[1] = "sinectis.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "fibert" in lista_email[1]: ######## corrige fibertel.com.ar
			lista_email[1] = "fibertel.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "ciuda" in lista_email[1] and (".com" in lista_email[1] and "ar" in lista_email[1]) and not "banco" in lista_email[1]: ######## corrige ciudad.com.ar
			lista_email[1] = "ciudad.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "ciuda" in lista_email[1] and (".com" in lista_email[1] and "ar" in lista_email[1]) and "banco" in lista_email[1]: ######## corrige ciudad.com.ar
			lista_email[1] = "bancociudad.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "filo" in lista_email[1] and ("uba" in lista_email[1]): ######## corrige uba.ar
			lista_email[1] = "uba.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "live" in lista_email[1] and "com" in lista_email[1] and "ar" in lista_email[1]:
			lista_email[1] = "live.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "live" in lista_email[1] and "com" in lista_email[1]:
			lista_email[1] = "live.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "speedy.com." in lista_email[1]:
			lista_email[1] = "speedy.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "OUTLOOK" in lista_email[1] and not "a" in lista_email[1]:
			lista_email[1] = "OUTLOOK.COM"
			email = lista_email[0] + "@" + lista_email[1]
		elif "marshall" in lista_email[1]:
			lista_email[1] = "marshallmoffar.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "hot" in lista_email[1]:
			lista_email[1] = "hotmail.com"
			email = lista_email[0] + "@" + lista_email[1]
		elif "HOT" in lista_email[1]:
			lista_email[1] = "HOTMAIL.COM"
			email = lista_email[0] + "@" + lista_email[1]
		elif "LIVE" in lista_email[1] and not "." in lista_email[1]:
			lista_email[1] = "LIVE.COM"
			email = lista_email[0] + "@" + lista_email[1]
		elif "LIVE.COM.AR" in lista_email[1]:
			lista_email[1] = "LIVE.COM.AR"
			email = lista_email[0] + "@" + lista_email[1]
		elif "fibertel" in lista_email[1]:
			lista_email[1] = "fibertel.com.ar"
			email = lista_email[0] + "@" + lista_email[1]
		elif "FIBERTEL" in lista_email[1]:
			lista_email[1] = "FIBERTEL.COM.AR"
			email = lista_email[0] + "@" + lista_email[1]	
				

		
	############ SIN @
	
	elif "yahoo.com.ar" in email:              ######## corrige yahoo.com.ar sin @
		lista_email = email.split("yahoo.com.ar")
		email = lista_email[0]+ "@" + "yahoo.com.ar"
	elif "yahoo.com" in email:              ######## corrige yahoo.com sin @
		lista_email = email.split("yahoo.com")
		email = lista_email[0]+ "@" + "yahoo.com"
	elif "hotmail.com" in email:              ######## corrige hotmail.com sin @
		lista_email = email.split("hotmail.com")
		email = lista_email[0]+ "@" + "hotmail.com"
	elif "gmail.com" in email:              ######## corrige gmail.com sin @
		lista_email = email.split("gmail.com")
		email = lista_email[0]+ "@" + "gmail.com"
	elif "fibertel.com.ar" in email:              ######## corrige fibertel.com.ar sin @
		lista_email = email.split("fibertel.com.ar")
		email = lista_email[0]+ "@" + "fibertel.com.ar"
	
######################## Caracteres extraños
	lista_permitidos = ["-","_","&","#","@","."]
	for letra in (email):
		if not letra.isdigit() and not letra.isalpha() and not letra in lista_permitidos:
			email = email.replace(letra,"")	
	
	
	return email
	
	
	
	
	

def corregir_mail(email):
		email = email.rstrip("\n")
		email = email.lower()
		if email.strip() == "":
			return ";\n"
		contadores.n_mails+=1
		email_viejo = email
		email = email.replace(" ","")
		email = email.replace('"',"")
		email = email.replace('<',"")
		email = email.replace(".com.com",".com")
		email = arreglar(email)
		resultado = validateEmail(email)
		linea = email
		if resultado==1 and email_viejo==linea:
			contadores.n_mailsok+=1
		if resultado==1 and email_viejo<>linea:
			contadores.n_mailscorregidos+=1
		if resultado == 1:
			linea = linea + ";valid\n"
			valido = True
		elif resultado == 0:
			linea = linea + ";invalid\n"
			valido = False
			contadores.n_mailsdescartados+=1
		else:
			linea = resultado+";valid\n"
			valido = True
		return linea	

		
def validateEmail(email,vez = 0):
	email = email.rstrip("\n")
	email = email.replace(" ","")
	email = email.replace('"',"")
	email = email.replace('<',"")
	email = email.replace(".com.com",".com")
	if "www." in email:
		email = email.replace("www.","")
	if "www" in email:
		email = email.replace("www","")
	if not "@" in email and not "." in email:
		return 0
	lista_mail_aux = email.split("@")
	if len(lista_mail_aux[0]) <=2:
		return 0
	if len(lista_mail_aux) <> 2:
		return 0
	lista_mail_aux_2 = email
	if "everey" in lista_mail_aux_2:
		return 0
	if "@bancocredicoop.coop" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if len(lista_email[0]) >= 3 and lista_email[1] == "bancocredicoop.coop":
				return 1
	if ".coop" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if len(lista_email[0]) >= 3:
				return 1
	if ".info" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if len(lista_email[0]) >=3:
				return 1
	if "noremberg" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "noremberg.com.ar":
				return 1
	if "nobleagri" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "nobleagri.com":
				return 1				
	if "nordelta" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "nordelta.com":
				return 1
	if "novoplack" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "novoplack.com":
				return 1
	if "novotime" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "novotime.com":
				return 1
	if "noticiaspositivas" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "noticiaspositivas.org":
				return 1
	if "nortel" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "nortel.com":
				return 1
	if "novobra" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "novobra.com.ar":
				return 1
	if "nosis" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "nosis.com.ar":
				return 1			
	if "noblegrain" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "noblegran.com":
				return 1			
	if "notredame" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "notredame.com.ar":
				return 1
	if "norcenter" in email:
		lista_email = email.split("@")
		if len(lista_email) == 2:
			if lista_email[1] == "norcenter.com":
				return 1		
	
			
	if ("@no" in email.lower() or "no.no" in email.lower() or "nopo" in email.lower() or "notengo" in email.lower() or "todos@" in email.lower() or "cgpc" in email.lower()) and len(email.split("@")[0]) < 8:
		return 0
	if ("notiene" in email.lower() or  "noposee" in email.lower() or "sinmail" in email.lower()):
		return 0
	if email.split("@")[0].lower() == "no" or email.split("@")[0].lower() == "nop" or email.split("@")[0].lower() == "nt" or email.split("@")[0].lower() == "not":
		return 0
	
	
	if len(email) > 7:
		if re.match("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$", email) != None:
			lista_aux = email.split("@")
			caracter = lista_aux[0][0]
			if len(lista_aux[0]) >= 4 and len(lista_aux[1]) >= 5:
				return 1
			elif len(lista_aux[0]) >= 2 and not "hotmail" in lista_aux[1] and not "yahoo" in lista_aux[1] and not "gmail" in lista_aux[1] and not "live" in lista_aux[1]:
				return 1
	return 0


#SECCION DE DNIS	
#############################################################################################################################################	


def corregir_dni(dni):
	dni = dni.strip(" ")
	if dni <> "":
		contadores.n_dni+=1
	else:
		return ""
	dnianterior=dni
	for i in range(1,len(dni)-2):
		if (dni[i] == "o" or dni[i] == "O") and dni[i-1].isdigit() and dni[i+1].isdigit():
			dni = dni.replace("o","0")
			dni = dni.replace("O","0")
	for letra in dni:
		if not letra.isdigit():
			dni = dni.replace(letra,"",1)
		
	if "E+" in dni:
		dni = ""
	dni = dni.lstrip("0")
	if  len(dni) > 8 or len(dni) < 5:
		dni = ""
	if dni=="":
		contadores.n_dnidescartados+=1
	elif dnianterior<>dni:
		contadores.n_dnicorregidos+=1
	else:
		contadores.n_dniok+=1
	return dni
	
#SECCION DE SEPARAR NOMBRES
#############################################################################################################################################

#Modificar el archivo para aclarar si primero está el nombre o primero está el apellido.

def separar_nombre(nombre,lista_nombres_masculinos,lista_nombres_femeninos):
	salida = modificar_nom(nombre,lista_nombres_masculinos,lista_nombres_femeninos)
	return salida
		
def buscar_nombre_femenino(nombre,lista_nombres_femeninos):
	bot = 0
	top = len(lista_nombres_femeninos)-1
	mid = (bot+top) // 2
	while bot <= top:
		if nombre == lista_nombres_femeninos[mid]:
			return mid
		else:
			if nombre < lista_nombres_femeninos[mid]:
				top = mid -1
			else: 
				bot = mid +1
			mid = (bot+top) // 2	
	return -1

def buscar_nombre_masculino(nombre,lista_nombres_masculinos):
	bot = 0
	top = len(lista_nombres_masculinos)-1
	while bot <= top:
		mid = (bot+top) // 2	
		if nombre == lista_nombres_masculinos[mid]:
			return mid
		else:
			if nombre < lista_nombres_masculinos[mid]:
				top = mid -1
			else: 
				bot = mid +1		
	return -1

def quitar_acentos(cadena):
	d = {'\xc1':'A',
        '\xc9':'E',
        '\xcd':'I',
        '\xd3':'O',
        '\xda':'U',
        '\xdc':'U',
        '\xd1':'N',
        '\xc7':'C',
        '\xed':'i',
        '\xf3':'o',
        '\xf1':'n',
        '\xe7':'c',
        '\xba':'',
        '\xb0':'',
        '\x3a':'',
        '\xe1':'a',
        '\xe2':'a',
        '\xe3':'a',
        '\xe4':'a',
        '\xe5':'a',
        '\xe8':'e',
        '\xe9':'e',
        '\xea':'e',
        '\xeb':'e',
        '\xec':'i',
        '\xed':'i',
        '\xee':'i',
        '\xef':'i',
        '\xf2':'o',
        '\xf3':'o',
        '\xf4':'o',
        '\xf5':'o',
        '\xf0':'o',
        '\xf9':'u',
        '\xfa':'u',
        '\xfb':'u',
        '\xfc':'u',
        '\xe5':'a',
		'\xf6':'o',
		'ó':'o',
		'é':'e',
		'á':'a',
		'ú':'u',
		'í':'i'
		}
	nueva_cadena = cadena
	for c in d.keys():
		nueva_cadena = nueva_cadena.replace(c,d[c])
	return nueva_cadena.upper()

def modificar_nom(nombre,lista_nombres_masculinos,lista_nombres_femeninos):
	nombre = nombre.replace("  "," ")
	nombre = nombre.lstrip(" ")
	nombre = nombre.rstrip(" ")
	nombre_viejo = nombre
	nombre = quitar_acentos(nombre)
	nombre_separado = []
	libre = True
	if nombre == "":
		return ""
	lista_nombre = nombre.split(" ")

	lista_apellido = copy.deepcopy(lista_nombre)
	antes = ""
	
	if len(lista_nombre) == 2:
		for nombre in lista_apellido:
			index = buscar_nombre_femenino(nombre,lista_nombres_femeninos)
			if index <> -1:
				nombre_separado.append(nombre)
				lista_nombre.remove(nombre)
				libre = False
				break
		if libre:
			for nombre in lista_apellido:
				index = buscar_nombre_masculino(nombre,lista_nombres_masculinos)
				if index <> -1:			
					nombre_separado.append(nombre)
					lista_nombre.remove(nombre)
					libre = False
					break
	else:
		for nombre in lista_apellido:
			index = buscar_nombre_femenino(nombre,lista_nombres_femeninos)
			if len(nombre) <=3:
				antes = nombre
				continue
			if index <> -1:
				if antes <> "":
					nombre_separado.append(antes)
					lista_nombre.remove(antes)	
					antes = ""
				lista_nombre.remove(nombre)
				nombre_separado.append(nombre)
				libre = False
			if antes <> "":
				antes = ""						
			if len(nombre_separado) > 0 and len(lista_nombre) == 1 and len(nombre_separado[len(nombre_separado)-1]) > 3:	
				break
		if libre:
			for nombre in lista_apellido:
				index = buscar_nombre_masculino(nombre,lista_nombres_masculinos)
				if len(nombre) <=3:
					antes = nombre
					continue
				if index <> -1:
					if antes <> "":
						nombre_separado.append(antes)
						lista_nombre.remove(antes)	
						antes = ""
					lista_nombre.remove(nombre)
					nombre_separado.append(nombre)
					libre = False
				if antes <> "":
					antes = ""				
				if len(nombre_separado) > 0 and len(lista_nombre) == 1 and len(nombre_separado[len(nombre_separado)-1]) > 3:	
					break
	if nombre_separado == []:
		nombre_separado = lista_nombre
		lista_nombre = []
	final = ""
	for palabra in nombre_separado:
		final = final + palabra + " "
	final = final.rstrip(" ")+";"
	for palabra in lista_nombre:
		final = final + palabra + " "

	
	final = final + " "
	
	final = final.rstrip(" ")
	final = final.lstrip(" ")
	
	return final.lower()
	

#SECCION DE BUSCAR SEXO
#############################################################################################################################################


def buscar_sexo(nombre,lista_nombres_masculinos,lista_nombres_femeninos):
	nombre = nombre.replace("  "," ")
	nombre = nombre.lstrip(" ")
	nombre = nombre.rstrip(" ")
	nombre = quitar_acentos(nombre)
	if nombre == "":
		return ""
	index = buscar_nombre_femenino(nombre,lista_nombres_femeninos)
	if index <> -1:
		return "F"
	index = buscar_nombre_masculino(nombre,lista_nombres_masculinos)
	if index <> -1:			
		return "M"	
	libre = True
	lista_nombre = nombre.split(" ")
	index = buscar_nombre_femenino(lista_nombre[0],lista_nombres_femeninos)
	if index <> -1:
		return "F"
	index = buscar_nombre_masculino(lista_nombre[0],lista_nombres_masculinos)
	if index <> -1:
		return "M"
	if len(lista_nombre) > 1:
		for nombre in lista_nombre:
			index = buscar_nombre_femenino(nombre,lista_nombres_femeninos)
			if index <> -1:
				return "F"
		if libre:
			for nombre in lista_nombre:
				index = buscar_nombre_masculino(nombre,lista_nombres_masculinos)
				if index <> -1:			
					return "M"
	return ""
	
	
	
#SECCION DE SEPARAR NOMBRE Y BUSCAR SEXO
#############################################################################################################################################


def separar_y_buscar(nombre,lista_nombres_masculinos,lista_nombres_femeninos):
	nombre = nombre.replace("  "," ")
	nombre = nombre.strip(" ")
	nombre = quitar_acentos(nombre)
	nombre_separado = []
	libre = True
	if nombre == "":
		return ""
	nombre_viejo = nombre
	lista_nombre = nombre.split(" ")
	lista_apellido = copy.deepcopy(lista_nombre)
	antes = ""
	if len(lista_nombre) == 2:
		for nombre in lista_apellido:
			index = buscar_nombre_femenino(nombre,lista_nombres_femeninos)
			if index <> -1:
				nombre_separado.append(nombre)
				lista_nombre.remove(nombre)
				libre = False
				break
		if libre:
			for nombre in lista_apellido:
				index = buscar_nombre_masculino(nombre,lista_nombres_masculinos)
				if index <> -1:		
					nombre_separado.append(nombre)
					lista_nombre.remove(nombre)
					libre = False
					break
	else:
		for nombre in lista_apellido:
			index = buscar_nombre_femenino(nombre,lista_nombres_femeninos)
			if len(nombre) <=3:
				antes = nombre
				continue
			if index <> -1:
				if antes <> "":
					nombre_separado.append(antes)
					lista_nombre.remove(antes)	
					antes = ""
				lista_nombre.remove(nombre)
				nombre_separado.append(nombre)
				libre = False
			if antes <> "":
				antes = ""
			if len(nombre_separado) > 0 and len(lista_nombre) == 1 and len(nombre_separado[len(nombre_separado)-1]) > 3:	
				break
		if libre:
			for nombre in lista_apellido:
				index = buscar_nombre_masculino(nombre,lista_nombres_masculinos)
				if len(nombre) <=3:
					antes = nombre
					continue
				if index <> -1:
					if antes <> "":
						nombre_separado.append(antes)
						lista_nombre.remove(antes)	
						antes = ""
					lista_nombre.remove(nombre)
					nombre_separado.append(nombre)
					libre = False
				if antes <> "":
					antes = ""				
				if len(nombre_separado) > 0 and len(lista_nombre) == 1 and len(nombre_separado[len(nombre_separado)-1]) > 3:	
					break
	if nombre_separado == []:
		nombre_separado = lista_nombre
		lista_nombre = []
	final = ""
	nombrefinal = ""
	for palabra in nombre_separado:
		nombrefinal = nombrefinal + palabra + " "
	final = nombrefinal.rstrip(" ")+";"
	for palabra in lista_nombre:
		final = final + palabra + " "
	final = final.rstrip(" ")
	final = final.capitalize()
	final = final+";"+buscar_sexo(nombrefinal.strip(" "))
	return final
	
	
	
#SECCION DE NOMBRE DE PILA
#############################################################################################################################################	
	
def buscar_nombre_pila(nombre,lista_nombres_masculinos,lista_nombres_femeninos):
	nombre = nombre.replace("  "," ") 
	nombre = nombre.lstrip(" ")
	nombre = nombre.rstrip(" ")
	nombre_viejo = nombre
	nombre = quitar_acentos(nombre)
	
	if nombre == "":
		return ""
	lista_nombre = nombre.split(" ")
	
	linea_nombre_pila = ""
	resto_nombre_desde = 0
	linea_resto_nombre = ""
	for i in range(len(lista_nombre)):
		if len(lista_nombre[i]) > 2:
			index = buscar_nombre_femenino(lista_nombre[i],lista_nombres_femeninos)
			if index <> -1:
				linea_nombre_pila = lista_nombre[i].capitalize()
				resto_nombre_desde = i+1
				if lista_nombre[i]=='MARIA' and len(lista_nombre)-(i+1)>0:
					linea_nombre_pila = linea_nombre_pila + " " + lista_nombre[i+1].capitalize()
					resto_nombre_desde = i+2
				break
			else:
				index = buscar_nombre_masculino(lista_nombre[i],lista_nombres_masculinos)
				if index <> -1:
					linea_nombre_pila = lista_nombre[i].capitalize()
					resto_nombre_desde = i+1
					break
	for i in range(resto_nombre_desde, len(lista_nombre)):
		linea_resto_nombre = linea_resto_nombre + " " + lista_nombre[i].capitalize()
	return linea_nombre_pila.lstrip(" ") + ";" + linea_resto_nombre.lstrip(" ")
	
#SECCION DE TELEFONOS
#############################################################################################################################################

def procesar_tel_aux(tel):
	if tel[0] == "0":
		tel = tel[1:len(tel)]
	if tel[0:2] == "15":
		tel = tel[2:len(tel)]
	return tel
		
def crear_var(decision):
	dicc_arch = {}
	for j in range(decision):
		i = j+1
		cadena = "telefonos"+str(i)+".csv"
		dicc_arch[i] = open(cadena,"w")
	return dicc_arch
	
def separar(archivo_entrada):
	no = True
	n_registro = 0
	for linea in archivo_entrada:
		n_registro+=1
		linea = linea.replace("\n","")
		lista = linea.split(";")
		if no:
			i = len(lista)
			dicc_arch = crear_var(i)
			no = False
		elif len(lista) > i+1:
			for palabra in lista:
				if "E+" in palabra:
					lista.pop(lista.index(palabra)-1)
					lista[lista.index(palabra)] = ""
					continue
				if not palabra.isdigit():
					palabra_final = ""
					for letra in palabra:
						if letra.isdigit():
							palabra_final = palabra_final+letra
					lista[lista.index(palabra)] = palabra_final	
		for j in range(i):
			try:
				k = j+1	
				dicc_arch[k].write(lista[k-1]+"\n")
			except:
				continue
	return i

def separar_numeros(numero_viejo):
	lista_palabras = []
	palabra = ""
	for letra in numero_viejo:
		if letra.isdigit():
			palabra+=letra
		elif not palabra in lista_palabras:
			lista_palabras.append(palabra)
			palabra = ""
	if not palabra in lista_palabras:
		palabra = palabra.lstrip("0")
		lista_palabras.append(palabra)
	total = ""
	lista_total = []
	for palabra in lista_palabras:
		total = total+palabra
		total = total.lstrip("0")		
		if len(total) > 6:
			lista_total.append(total)
			total = ""
	return lista_total

def separar_especial(numero_viejo):
	lista_palabras = []
	palabra = ""
	for letra in numero_viejo:
		if letra.isdigit():
			palabra+=letra
		elif not palabra in lista_palabras:
			lista_palabras.append(palabra)
			palabra = ""
	if not palabra in lista_palabras:
		palabra = palabra.lstrip("0")
		lista_palabras.append(palabra)
	return lista_palabras
	
def modificar_tel(numero,n_registro,dicc_sobrantes):

	celular = False
	if "C°" in numero:
		celular = True
	modif = True
	if numero == "":
		return ""
	numero_viejo = numero
	if "E+" in numero or "e+" in numero:
		return "---"	
	if "int" in numero or "INT" in numero:
		numero = ""
		
	if not numero.isdigit() and numero <> "":
		for letra in numero:
			if not letra.isdigit():
				numero = numero.replace(letra,"")				
	sin_modi = numero	
	
	if numero == "":
		return ""
	if "00000" in numero and len(numero) < 15:
		return ""	
	if numero[0] == "0":
		numero = numero.lstrip("0")
	if numero[0:2] == "15" and len(numero) == 10:
		numero = "11" + numero[2:len(numero)]
	if numero[0:2] == "54":
		numero = "11" + numero[2:len(numero)]
	if len(numero) == 8:
		numero = "11" + numero
	if len(numero) == 16:
		numero = "11"+numero[0:8]+";"+"11"+numero[8:16]
	if len(numero) == 18:
		if numero[0] == "4" and (numero[8:10] == "15" or numero[8:10] == "11"):
			numero = "11"+numero[0:8]+";"+"11"+numero[10:18]
		elif (numero[0:2] == "15" or numero[0:2] == "11"):
			numero = "11"+numero[2:10]+";"+"11"+numero[10:18]
		elif (numero[8:10] == "11" or numero[8:10] == "15"):
			numero = "11"+numero[0:8]+";"+"11"+numero[10:18]
	if numero[0:4] == "5411":
		numero = numero[2:len(numero)]	
	if len(numero) == 7:
		numero = "114"+numero
	if numero[0:3] == "549" and len(numero) > 10:
		numero = numero.replace("549","",1)
	if numero[0:2] == "54" and len(numero) > 10 and not "/" in numero_viejo and not "-" in numero_viejo:
		numero = numero.replace("54","",1)
	if len(numero) == 10 and numero[0:2] == "11":
		numero = numero #lel :v
	if len(numero) == 12 and numero[0:4] == "1115":
		numero = "11" + numero[4:12]
	if len(numero) == 12 and ("11" in numero or "15" in numero):
		for i in range(len(numero)/2):
			if numero[i:i+2] == "11":
				numero=numero.replace("11","",1)				
				break
			if numero[i:i+2] == "15":
				numero=numero.replace("15","",1)			
				break
		numero = numero.lstrip("0")
	if len(numero) == 12 and numero[4] == "4":
		numero = "11"+numero[4:12]
	if len(numero) == 20 and (numero[10:12] == "15" or numero[10:12] == "11"):
		if numero[0:2] == "15":
			numero = numero.replace("15","11",1)
		numero = numero[0:10]+";"+"11"+numero[12:20]
	if len(numero) == 15:
		if numero[7] == "4":
			numero = "114"+numero[0:7]+";"+"11"+numero[7:15]		
		elif numero[0] == "4":
			numero = "11"+numero[0:8]+";"+"114"+numero[8:15]
	if len(numero) == 17 and numero[7:9] == "15":		
		numero = "114"+numero[0:7]+";"+"11"+numero[9:17]
	numero = numero.lstrip("0")
	numero = numero.lstrip("0")
	numero = numero.lstrip("0")	
	if len(numero) == 13:
		if numero[5] == "4":	
			numero = "11"+numero[5:13]
		elif numero[0:2] == "15":
			numero = "11"+numero[2:10]
	numero = numero.lstrip("0")
	if len(numero) == 14:
		if numero[4:6] == "11" or numero[4:6] == "15":
			numero = "11"+numero[6:14]
		else:
			lista_numeros = separar_numeros(numero_viejo)
			final = ""
			for palabra in lista_numeros:
				if len(palabra) == 7:
					final = final+";"+"114"+palabra
				if len(palabra) == 8:
					final = final+";"+"11"+palabra
			final = final.lstrip(";")
			numero = final
	if len(numero) > 10 and not numero_viejo.isdigit():
		lista_numeros = separar_numeros(numero_viejo)
		final = ""
		for palabra in lista_numeros:
			if len(palabra) == 8:
				final = final+";"+"11"+palabra
			if len(palabra) == 10 and (palabra[0:2] == "15" or palabra[0:2] == "11"):
				final = final+";"+"11"+palabra[2:10]
			if len(palabra) == 10 and palabra[0:2] <> "15" and palabra [0:2] <> "11":
				final = final+";"+palabra
			if len(palabra) == 7:
				final = final+";"+"114"+palabra
		final = final.lstrip(";")
		numero = final
		if numero == "":
			lista_numeros = separar_especial(numero_viejo)
			for palabra in lista_numeros:
				if len(palabra) == 8:
					final = final+";"+"11"+palabra
				if len(palabra) == 10 and (palabra[0:2] == "15" or palabra[0:2] == "11"):
					final = final+";"+"11"+palabra[2:10]
				if len(palabra) == 10 and palabra[0:2] <> "15" and palabra [0:2] <> "11":
					final = final+";"+palabra
				if len(palabra) == 7:
					final = final+";"+"114"+palabra	
		numero = final
	if len(numero) < 10:	
		numero = ""
	if len(numero) == 11:
		if numero[0:3] == "111":
			numero = numero.replace("111","11",1)
		else:
			numero = ""
	if len(numero) == 12:
		numero = ""
	if len(numero) <> 10 and not ";" in numero and numero <> "":
		numero = ""	
	if ";" in numero and not dicc_sobrantes.has_key(n_registro):
		lista_sobrantes = numero.split(";")
		dicc_sobrantes[n_registro] = lista_sobrantes[1]
		numero = lista_sobrantes[0]
	if numero == "1112345678":
		numero = ""
	if len(numero) > 2:
		caracter = numero[2]
		if numero[2:10] == caracter*8:
			numero = ""
	if len(numero) > 0 and numero[0].isdigit() and int(numero[0]) >=4:
		numero = ""
	if celular:
		numero = numero+"C°"
	return numero	
	
def corregir_telefono(nombre_entrada,dicc_sobrantes):
	archivo_entrada = open(nombre_entrada+".csv","r")
	archivo_salida = open(nombre_entrada+" normalizado.csv","w")
	cant_campos = 0
	n_registro = 0
	lista_encabezado = []
	cont = 0
	cont2 = 0
	global filtro_E
	for linea in archivo_entrada:
		linea = linea.rstrip("\n")
		n_registro+=1
		#if n_registro > 2222:
		#	break
		if n_registro == 1:
			lista_encabezado = linea.split(";")
			lista_linea = lista_encabezado
			lista_campos = []
			for i in range(len(lista_encabezado)):
				if "tel" in lista_encabezado[i] or "TEL" in lista_encabezado[i] or "cel" in lista_encabezado[i] or "CEL" in lista_encabezado[i] \
				or "fijo" in lista_encabezado[i] or "FIJO" in lista_encabezado[i] or "movil" in lista_encabezado[i] or "MOVIL" in lista_encabezado[i] \
				or "Tel" in lista_encabezado[i] or "Cel" in lista_encabezado[i] or "Fijo" in lista_encabezado[i] or "Movil" in lista_encabezado[i] or "PH" in lista_encabezado[i] or "ph" in lista_encabezado[i] or True: #TRUESSS
					if not "tipo" in lista_encabezado[i] and not "titu" in lista_encabezado[i]:
						lista_campos.append(lista_encabezado[i])
		else:
			lista_linea = []
			lista_linea = linea.split(";")
			for campo in lista_campos:
				pos = lista_encabezado.index(campo)				
				telefono_viejo = lista_linea[pos]
				lista_linea[pos] = modificar_tel(lista_linea[pos],n_registro,dicc_sobrantes)
				if filtro_E and lista_linea[pos] == "---":
					tkMessageBox.showinfo("Advertencia", "Numeros mal cargados con notacion cientifica", icon='warning')
					print 
					filtro_E = False
		linea_salida = ""
		for palabra in lista_linea:
			linea_salida = linea_salida + ";" + palabra
		linea_salida = linea_salida.replace(";","",1)
		archivo_salida.write(linea_salida+"\n")	
	
def principal_tel(cant):
	dicc_sobrantes = {}
	nombre_sobrantes = "telefonos"+str(cant+1)
	for i in range(cant):
		k = i+1
		nombre_entrada = "telefonos"+str(k)
		corregir_telefono(nombre_entrada,dicc_sobrantes)
	if len(dicc_sobrantes.values()) > 1:
		archivo_aux = open("telefonos1.csv","r")
		archivo_sobrante = open("telefonos"+str(cant+1)+" normalizado.csv","w")########
		n_registro = 0
		for linea in archivo_aux:
			n_registro+=1
			linea = linea.rstrip("\n")
			lista = linea.split(";")
			if dicc_sobrantes.has_key(n_registro):
				archivo_sobrante.write(dicc_sobrantes[n_registro]+"\n")
				
			else:
				archivo_sobrante.write("\n")
		return cant+1
	else:
		return cant

def averiguar_tipo(servicio):
	if "SRMC" in servicio or "PCS" in servicio or "STM" in servicio or "SRCE" in servicio:
		return "celular"
	else:
		return "telefono"
				
def averiguar_compania(operador):
	if "TELEFONICA" in operador:
		return "Movistar"
	if "TELECOM" in operador:
		return "Personal"
	if "CTI" in operador:
		return "Claro"
	if "RADIOCOMUNICACIONES MOVILES SOCIEDAD ANONIMA" in operador:
		return "Movistar"
	if "MINIPHONE" in operador:
		return "Personal"
	if "GTE PCS" in operador:
		return "Claro"
	if "NEXTEL" in operador:
		return "Nextel"
	if "C.T.I" in operador:
		return "Claro"
	if "FASTCOM SOCIEDAD ANONIMA" in operador:
		return "Fastcom"
	if "FEDERACION DE COOPERATIVAS DEL SERVICIO TELEFONICO DE LA ZONA SUR LIMITADA (FECOSUR)" in operador:
		return "Fecosur"
	return ""

def busqueda_binaria_4(telefono,lista_11_4):
	buscar = int(telefono[2:6])
	bot = 1
	top = len(lista_11_4)-1
	mid = (bot+top) // 2
	while bot <= top:
		dato = int(lista_11_4[mid][2])
		if buscar == dato:
			return lista_11_4[mid]
		else:
			if buscar < dato:
				top = mid -1
			else: 
				bot = mid +1
			mid = (bot+top) // 2	
	return -1
		
def busqueda_binaria_5(telefono,lista_11_5):
	buscar = int(telefono[2:6])
	bot = 1
	top = len(lista_11_5)-1
	mid = (bot+top) // 2
	while bot <= top:
		dato = int(lista_11_5[mid][2])
		if buscar == dato:
			return lista_11_5[mid]
		else:
			if buscar < dato:
				top = mid -1
			else: 
				bot = mid +1
			mid = (bot+top) // 2	
	return -1	
	
def comparar_solo_11_binario(nombre_archivo,lista_11_4,lista_11_5):
	archivo_entrada = open(nombre_archivo+" normalizado.csv","r")
	archivo_salida = open(nombre_archivo+" final.csv","w")
	cont = 0
	n_registro = 0
	cant_erroneos = 0
	cant_no_encontrados = 0
	celulares_encontrados = 0
	telefonos_encontrados = 0
	numeros_no_encontrados = 0
	numeros_no_analizados = 0
	blancos=0
	filtro = 0
	archivo_salida.write("INDEX"+";"+"Telefono"+";"+"Celular"+";"+"Compania"+"\n")
	for datos in archivo_entrada:
		try:
			telefono = datos.split(";")
		except:
			telefono = ""
		telefono = datos
		telefono = telefono.rstrip("\n")
		modificado = False
		n_registro+=1
		if n_registro == 1 and ("tel" in telefono or "cel" in telefono or "Tel" in telefono or "Cel" in telefono) :
			filtro = 1
			continue
		if n_registro == 1:
			continue
		#if n_registro > 10:
		#	break
		telefono = telefono.rstrip("\n")
		celular = False
		if "C°" in telefono:
			celular = True
			telefono = telefono.replace("C°","")
		tipo = ""
		compania = ""
		operador = ""
		servicio = ""
		modalidad = ""
		localidad = ""
		indicativo = ""
		bloque = ""
		numero_invalido = False
		blanco = False
		if telefono == "":
			numero_invalido = True	
			blancos+=1
			modificado = True 
			blanco = True
			telefono = ""				#Escribe espacios en blanco
		elif not telefono.isdigit():
			numero_invalido = True
			cant_erroneos+=1
			modificado = True 
			telefono = ""
		elif len(telefono) <> 10 and telefono <> "":
			cant_erroneos+=1
			numero_invalido = True
			modificado = True
			telefono = ""
		if telefono[0:2] == "11":
			index = busqueda_binaria_4(telefono,lista_11_4)
			if index == -1:
				index = busqueda_binaria_5(telefono,lista_11_5)
			if index <> -1:
				modificado = True
				operador = index[0]
				servicio = index[1]
				bloque = index[2]
				localidad = index[3]
				tipo = averiguar_tipo(servicio)	
			if modificado == False:
				numeros_no_encontrados+=1
				numero_invalido = True
				telefono = ""
		else:
			tipo = "telefono"
			if celular:
				tipo = "celular"
			
		
		if tipo == "celular":
			compania = averiguar_compania(operador)
		id = str(n_registro)
		if tipo == "celular":
			archivo_salida.write(id+";"+";"+telefono+";"+compania+";"+localidad+"\n")
		if tipo == "telefono":
			archivo_salida.write(id+";"+telefono+";"+";"+compania+";"+localidad+"\n")
		if tipo == "":
			archivo_salida.write(id+";"+";"+";"+";"+";"+";"+"\n")
			
def numeracion(cant,lista_11_4,lista_11_5):
	for i in range(cant):
		k = i+1
		nombre_archivo = "telefonos"+str(k)
		comparar_solo_11_binario(nombre_archivo,lista_11_4,lista_11_5)
	
def acomodar_numeros(cant):
	dicc_todo = {}
	for j in range(cant):
		procesar(j,dicc_todo)
	guardar(dicc_todo)
	
def procesar(j,dicc_todo):
	n_registro = 0
	i=j+1
	archivo_entrada = open("telefonos"+str(i)+" final.csv","r")
	for linea in archivo_entrada:
		n_registro+=1
		if n_registro == 1:
			continue
		#if n_registro > 10:
		#	break
		lista_linea = linea.split(";")
		if not dicc_todo.has_key(lista_linea[0]):
			dicc_todo[lista_linea[0]] = ["","","",""]
		if lista_linea[1] <> "":
			if dicc_todo[lista_linea[0]][0] == "":
				dicc_todo[lista_linea[0]][0] = lista_linea[1]
			elif dicc_todo[lista_linea[0]][1] == "":
				if dicc_todo[lista_linea[0]][0] <> lista_linea[1]:
					dicc_todo[lista_linea[0]][1] = lista_linea[1]
		if lista_linea[2] <> "":
			if dicc_todo[lista_linea[0]][2] == "":
				dicc_todo[lista_linea[0]][2] = lista_linea[2]
				dicc_todo[lista_linea[0]][3] = lista_linea[3].rstrip("\n")
	
def guardar(dicc_todo):
	archivo_salida = open("Telefonos Final.csv","w")
	archivo_salida.write("Index;Fijo1_ok;Fijo2_ok;Celular_ok;Compania_celular\n")
	for key in dicc_todo.keys():
		if not key.isdigit():
			dicc_todo.pop(key)
	claves = dicc_todo.keys()
	claves = [int(x) for x in claves]
	claves.sort()
	for clave in claves:
		clave = str(clave)
		linea_salida = str(clave)
		for valor in dicc_todo[clave]:
			linea_salida = linea_salida + ";" + valor
		archivo_salida.write(linea_salida+"\n")	
	
def normalizar_telefonos(lista_11_4,lista_11_5):
	archivo_entrada = open("tel temp.csv","r")
	cant = separar(archivo_entrada)
	cant = principal_tel(cant)
	numeracion(cant,lista_11_4,lista_11_5)
	acomodar_numeros(cant)
	archivo_entrada.close()
	for i in range(cant-1):									##########################
		i+=1
		os.remove("telefonos"+str(i)+".csv")
		os.remove("telefonos"+str(i)+" final.csv")
		os.remove("telefonos"+str(i)+" normalizado.csv")
#SECCION DE CUIL
#############################################################################################################################################	
	
def buscar_dni(cuil):
	dni = ""
	cuil = cuil.rstrip("\n")
	if len(cuil) == 11 and (dni[0:2] == "20" or dni[0:2] == "23" or dni[0:2] == "27"):
		dni = cuil[2:len(cuil)-1]
	else:
		cuil_modif = ""
		for letra in cuil:
			if letra.isdigit():
				cuil_modif = cuil_modif + letra
		dni = cuil_modif[2:len(cuil_modif)-1]
	return dni
	
