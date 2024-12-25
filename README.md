# ProyectoDocker
# ProyectoDocker

```bash


docker stop $(docker ps -q -a)
docker system prune -a


docker compose build
docker compose up

a veces hay un bug con el script, si al final no sale "conexion a la base exitosa"
simplemente vuelve hacer:
docker compose up
al final sale algo asi:
backend-1   | Conexión exitosa a la BD


revisar que la api se haya conectado
http://localhost:9001/api/usuarios

la app:
http://localhost:4200/home




```
