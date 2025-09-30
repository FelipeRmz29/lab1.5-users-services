#!/bin/bash

echo "Iniciando script de limpieza del Lab 1.5..."

# --- 1. Limpieza de Servicios Personalizados ---
echo "Deteniendo y deshabilitando simple-service..."
# Detener el servicio (si está corriendo)
sudo systemctl stop simple-service
# Deshabilitar el inicio automático
sudo systemctl disable simple-service
# Eliminar el archivo de la unidad de servicio
sudo rm -f /etc/systemd/system/simple-service.service
# Eliminar el script ejecutable (usando /home/Felipe/ como ruta base de tu usuario)
sudo rm -f /home/Felipe/simple-service.sh
# Recargar systemd para que reconozca los cambios
sudo systemctl daemon-reload

# --- 2. Eliminar Directorios Compartidos y Cambios en Sudoers ---
echo "Eliminando directorios compartidos y reglas sudo..."
sudo rm -rf /shared/projects
sudo rm -f /etc/sudoers.d/developers # Elimina la regla NOPASSWD

# --- 3. Eliminar Usuarios (con directorio home) ---
echo "Eliminando usuarios alice, bob, charlie y temp_user..."
sudo userdel -r alice
sudo userdel -r bob
sudo userdel -r charlie
sudo userdel -r temp_user
sudo userdel -r service_account

# --- 4. Eliminar Grupos ---
echo "Eliminando grupos developers, testers y administrators..."
sudo groupdel developers
sudo groupdel testers
sudo groupdel administrators
# Elimina a alice del grupo sudo si fue añadida para las pruebas
sudo deluser alice sudo 2>/dev/null 

echo "Limpieza completada. El sistema ha sido restaurado."
