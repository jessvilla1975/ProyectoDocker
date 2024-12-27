#!/bin/bash

# Navegar a la carpeta donde está el archivo docker-compose.yml (si es necesario)
# cd /ruta/a/tu/proyecto

# Detener y eliminar los contenedores en ejecución
echo "Deteniendo y eliminando contenedores en ejecución..."

docker stop $(docker ps -q -a)
docker system prune -a
# Construir las imágenes de Docker
echo "Construyendo imágenes..."
docker compose build

# Levantar los contenedores
echo "Levantando contenedores..."
docker compose up 

