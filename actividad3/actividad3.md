# Actividad 3: Administración de Usuarios, Grupos y Permisos en Linux

**Nombre:** Javier Alexander Girón Donis

**Carnet:** 202000510
---

## Parte 1: Gestión de Usuarios

### 1. Creación de Usuarios

**Comandos:**
```bash
sudo useradd usuario1
sudo useradd usuario2
sudo useradd usuario3
```

### 2. Asignación de Contraseñas

**Comandos:**
```bash
sudo passwd usuario1
# Ingresar nueva contraseña para usuario1

sudo passwd usuario2
# Ingresar nueva contraseña para usuario2

sudo passwd usuario3
# Ingresar nueva contraseña para usuario3
```

### 3. Información de Usuarios

**Comandos:**
```bash
id usuario1
```

### 4. Eliminación de Usuarios

**Comandos:**
```bash
sudo userdel -r -f usuario3
```

## Parte 2: Gestión de Grupos

### 1. Creación de Grupos

**Comandos:**
```bash
sudo groupadd grupo1
sudo groupadd grupo2
```

### 2. Agregar Usuarios a Grupos

**Comandos:**
```bash
sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2
```

### 3. Verificar Membresía

**Comandos:**
```bash
groups usuario1
groups usuario2

```

### 4. Eliminar Grupo

**Comandos:**
```bash
sudo groupdel grupo2
```

## Parte 3: Gestión de Permisos

### 1. Creación de Archivos y Directorios

**Comandos:**
```bash
# Cambiar al usuario1
sudo su - usuario1

# Crear un archivo y escribir en él
echo "Este es el contenido del archivo1" > ~/archivo1.txt

# Crear un directorio y un archivo dentro de él
mkdir ~/directorio1
echo "Contenido de archivo2" > ~/directorio1/archivo2.txt

```

### 2. Verificar Permisos

**Comandos:**
```bash
ls -l ~/archivo1.txt
ls -ld ~/directorio1
```

### 3. Modificar Permisos usando `chmod` con Modo Numérico

**Comandos:**
```bash
chmod 640 ~/archivo1.txt
```

### 4. Modificar Permisos usando `chmod` con Modo Simbólico

**Comandos:**
```bash
chmod u+x ~/directorio1/archivo2.txt
```


### 5. Cambiar el Grupo Propietario

**Comandos:**
```bash
sudo chgrp grupo1 ~/directorio1/archivo2.txt
```


### 6. Configurar Permisos de Directorio

**Comandos:**
```bash
chmod 740 ~/directorio1
```

### 7. Comprobación de Acceso

**Comandos:**
```bash
# Cambiar al usuario2
sudo su - usuario2

# Intentar acceder a archivo1.txt y directorio1/archivo2.txt
cat /home/usuario1/archivo1.txt
cat /home/usuario1/directorio1/archivo2.txt
```

### 8. Verificación Final

**Comandos:**
```bash
# Cambiar de nuevo a usuario1
sudo su - usuario1

# Verificar permisos y propietarios
ls -l ~/archivo1.txt
ls -ld ~/directorio1
ls -l ~/directorio1/archivo2.txt
```

### ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?
Gestionar correctamente los usuarios y permisos en un sistema operativo es crucial para mantener la seguridad del sistema y proteger la información sensible. Al controlar quién tiene acceso a determinados archivos y directorios, se previene el acceso no autorizado y las posibles fugas de datos. Además, una buena gestión de permisos garantiza que solo las personas adecuadas puedan realizar cambios en el sistema, lo que ayuda a evitar errores humanos que podrían comprometer la estabilidad del sistema. 


### ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?
En Linux, además de los comandos básicos como chmod, chown, y chgrp, existen otras técnicas para gestionar permisos de manera más avanzada. Por ejemplo, se pueden usar las Listas de Control de Acceso (ACL) con comandos como setfacl y getfacl, que permiten establecer permisos más detallados para usuarios y grupos específicos. También está el comando umask, que define los permisos predeterminados para nuevos archivos y directorios creados por un usuario. Además, se puede utilizar el archivo /etc/sudoers para otorgar permisos de superusuario a usuarios específicos para ejecutar ciertos comandos sin necesidad de cambiar de usuario completamente. Finalmente, herramientas como SELinux o AppArmor ofrecen control de acceso adicional a nivel de sistema, proporcionando una capa extra de seguridad.
