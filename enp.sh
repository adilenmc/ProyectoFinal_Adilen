#!/bin/bash
# Variables que direccionen las bases de datos
data="ProyecFinal/estaciones-ENP"

# Se extraen manualmente las coordenadas
# declare declara variables, en este caso un array
# -A lo hace asociativo, es decir, almacena valores y se les da un indicador, que en este caso es el nombre de las ENP
# Funciona de maner similar a los diccionarios de python
declare -A enp_coord=(
    ["ENP1"]="-99.1220,19.2713"
    ["ENP2"]="-99.0999,19.3840"
    ["ENP3"]="-99.0948,19.4818"
    ["ENP4"]="-99.1949,19.4037"
    ["ENP5"]="-99.0805,19.1624"
    ["ENP6"]="-99.0924,19.2107"
    ["ENP7"]="-99.1269,19.4197"
    ["ENP8"]="-99.1945,19.3674"
    ["ENP9"]="-99.1281,19.4833"
)
# Se crea un documento con lo que serían lo encabezados de la tabla
echo "Estación,Longitud,Latitud,Tmax,Pmax,Date">pembu.CSV


for archivo in 2022-*-ENP*-L1.CSV;do # Los archivos se manejan con expansiones ya que su nombre se rige por patrones consecutivos
	mes=$(echo "$archivo"| cut -d- -f2) # Separa mes de la fecha registrada

	enp=$(echo "$archivo"| cut -d- -f3|cut -d. -f1) # Extrae ENP
	# Usa doble cut porque el nombre esta "rodeado" de guión y punto
	
	# Agregar COORDENADAS
	coord=${enp_coord[$enp]} # Busca en el array y le indica la clave que previamente ya definimos como enp
	lon=$(echo $coord | cut -d, -f1)
	lat=$(echo $coord | cut -d, -f2)
	# cut separa lat y lon

	pmax=$( tail -n +10 "$archivo" | sort -t , -k 8 -g | tail -n 1 | cut -d, -f8)
	tmax=$( tail -n +10 "$archivo" | sort -t , -k 8 -g | tail -n 1 | cut -d, -f2)
	# el tail -n +9 nos permite saltar las lineas de descripcion del documento

	date="2022-${mes}"
	echo "${enp},${lon},${lat},${tmax},${pmax},${date}">>"pembu.CSV"
	# >> redirecciona la salida al archivo previamente definido pmbu.CSV
	# Manda la salida estandar del comando, en este caso el que acomoda las salidas, hacia el archivo. Lo añade al final de la informacion existente.
done



