# ProyectoDocker
# ProyectoDocker

```bash


docker stop $(docker ps -q -a)
docker system prune -a


docker compose build
docker compose up

revisar que la api se haya conectado
http://localhost:9001/api/usuarios

la app:
http://localhost:4200/home

aqui toca ingresar la base de datos manual entonces dejando correr el docker compose up
en otra terminal hacer estos comandos: 

docker exec -it proyectodocker-mysql-1 bash

mysql -u root -p

1234
use bdcampus;
//aqui copiar y pegar las tablas de init.sql


```
