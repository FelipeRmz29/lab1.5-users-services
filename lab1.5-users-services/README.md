# 💻 Laboratorio 1.5: Administración de Usuarios y Servicios en Linux

## Nombre del Estudiante: Felipe [Tu Apellido]
## Sistema Operativo: [Tu Distribución: Ej. Ubuntu 22.04 LTS]
## Fecha de Entrega: [Fecha actual]

Este proyecto documenta las habilidades fundamentales de administración de sistemas Linux, incluyendo la gestión de usuarios, grupos, permisos de archivos, y el control de servicios del sistema (`systemd`).

---

### Estructura del Proyecto

* **`configs/`**: Archivos que documentan las configuraciones de usuarios y permisos (`users-created.txt`, `groups-configuration.txt`).
* **`docs/`**: Informes detallados sobre el trabajo realizado.
* **`logs/`**: Salidas de comandos de monitoreo y diagnóstico (`performance-report.txt`, `troubleshooting-steps.txt`).
* **`screenshots/`**: Evidencia visual de los 6 pasos clave del laboratorio.
* **`services/`**: Copia del archivo de unidad del servicio personalizado (`simple-service.service`).
* **`scripts/`**: Scripts de automatización (`user-creation-script.sh`, `cleanup-script.sh`, etc.).

---

### Automatización

Los siguientes scripts permiten recrear y limpiar el entorno de este laboratorio:

#### 1. Script de Configuración
Este script crea los usuarios, grupos y establece los permisos iniciales.
```bash
./scripts/user-creation-script.sh

