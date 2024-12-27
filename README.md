# Proyecto: Despliegue de Aplicación con Contenedores - Local y Nube

## Integrantes
- **Alejandro Marín Hoyos** - 2259353-3743  
- **Carlos Alberto Camacho Castaño** - 2160331-3743  
- **Harrison Ineey Valencia Otero** - 2159979-3743  
- **Kevin Alexander Marín**  
- **Manuel Antonio Vidales Durán** - 2155481-3743  
- **Yessica Fernanda Villa Nuñez** - 2266301-3743

## Enlace video

## 1. Introducción

El proyecto propone una solución de transporte económico y eficiente para estudiantes universitarios, basada en una aplicación web intuitiva que conecta arrendadores (propietarios de motocicletas) con arrendatarios (estudiantes). El objetivo es desplegar esta aplicación en entornos locales y en la nube, garantizando escalabilidad, flexibilidad y altos estándares de satisfacción.

**Objetivo General:**  
Diseñar, desarrollar y desplegar una aplicación web modular y escalable, integrando Backend, Base de Datos y Frontend mediante contenedores y servicios en la nube.

**Objetivos Específicos:**
- Implementar una arquitectura distribuida y modular con operaciones CRUD.
- Desplegar en entornos locales y nube usando Docker Compose.
- Diseñar una interfaz intuitiva con funcionalidades clave como login, geolocalización y filtros personalizados.

---

## 2. Solución Local

### Arquitectura Local
La arquitectura local utiliza contenedores para modularidad y portabilidad:
1. **Backend:** Lógica de negocio con Node.js/Express.
2. **Base de Datos:** Almacenamiento con MySQL y volúmenes persistentes.
3. **Frontend:** Interfaz web desarrollada con Angular y servida con Nginx.

### Configuración de Contenedores
- **Backend:** Imagen basada en `node:18-alpine`. Expone el puerto `9001`.
- **Base de Datos:** Imagen oficial de MySQL 8.0. Incluye script de inicialización.
- **Frontend:** Imagen multi-etapa con construcción en Node.js y producción con Nginx.

### Docker Compose
El archivo `docker-compose.yml` define los servicios interconectados:
- **Frontend:** Puerto `80`, depende del backend.
- **Backend:** Puerto `9001`, depende de la base de datos.
- **MySQL:** Base de datos `bdcampus`, con persistencia.

**Comandos Principales:**
```bash
# Construir y levantar contenedores
docker compose build
docker compose up

# Detener y eliminar contenedores
docker compose down -v

# Reiniciar contenedor del backend
docker compose restart <nombre-del-backend>
```

---

## 3. Solución en la Nube

### Replicación de Arquitectura
El entorno en la nube utiliza DigitalOcean:
- **Red Privada:** Comunicación segura entre servicios.
- **Balanceador de Carga:** Distribuye el tráfico entre instancias del backend.
- **Persistencia:** Volúmenes para almacenar datos de la base de datos.

### Configuraciones
1. **Escalabilidad Automática:** Ajusta instancias según demanda.
2. **Réplicas del Backend:** Tres instancias simultáneas.
3. **Seguridad:** Reglas de firewall y claves SSH.

### Flujo de Despliegue
1. Conexión a la instancia:
   ```bash
   ssh -i /Descargas/key.pem user@<IP-Pública>
   ```
2. Instalación de Docker:
   ```bash
   sudo apt-get update
   sudo apt-get install docker.io docker-compose
   ```
3. Transferencia del código fuente:
   ```bash
   scp -i /Descargas/key.pem -r /Descargas/ProyectoDocker user@<IP-Pública>:/ProyectoDocker
   ```
4. Construcción y despliegue:
   ```bash
   docker-compose build
   docker-compose up -d
   ```

---

## 4. Análisis y Conclusiones

### Comparación: Ambiente Local vs Nube
- **Local:** Baja latencia, dependiente del hardware, mayor riesgo de caídas.
- **Nube:** Alta disponibilidad, escalabilidad automática, mayor latencia si los servidores están lejos.

### Recomendaciones
1. Implementar **CDNs** para usuarios distantes.
2. Monitorear tiempos de respuesta y uso de recursos.
3. Automatizar despliegues con CI/CD para mantener consistencia.

**Conclusión:**  
La solución cumple con los objetivos de modularidad, escalabilidad y satisfacción del usuario, posicionando el proyecto como una alternativa viable y robusta para el transporte estudiantil.

