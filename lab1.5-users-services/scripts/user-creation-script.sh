#!/bin/bash

# --- 1. Crear Grupos ---
echo "Creando grupos developers y testers..."
sudo groupadd developers
sudo groupadd testers

# --- 2. Crear Usuarios ---
echo "Creando usuarios alice, bob y charlie..."
sudo useradd -m -s /bin/bash alice
sudo useradd -m -s /bin/bash bob
sudo useradd -m -s /bin/bash charlie

# --- 3. Asignar Membresías ---
echo "Asignando usuarios a grupos..."
sudo usermod -aG developers alice
sudo usermod -aG developers bob
sudo usermod -aG testers charlie
sudo usermod -aG administrators alice # Alice es administradora

# --- 4. Configurar Directorio Compartido (/shared-data) ---
echo "Creando y configurando directorio compartido..."
sudo mkdir -p /shared/projects
sudo chown root:developers /shared/projects
sudo chmod 770 /shared/projects # R-W-X solo para owner y grupo

echo "Script de creación de usuarios finalizado."
