# 👨‍💼 Informe de Gestión de Usuarios y Permisos

Este informe detalla las operaciones realizadas para configurar la jerarquía de usuarios y grupos en el sistema.

## 1. Creación de Usuarios y Grupos

### Usuarios Creados:
Los usuarios `alice`, `bob`, y `charlie` fueron creados con el comando `useradd -m -s /bin/bash`.
* **alice**: Rol de Administración y Testing.
* **bob**: Rol de Desarrollo.
* **charlie**: Rol de Testing.
*(Verificación de usuarios en `configs/users-created.txt`)*

### Estructura de Grupos:
Se crearon los grupos `developers`, `testers` y `administrators`.

| Grupo | Miembros | Propósito |
| :--- | :--- | :--- |
| **developers** | alice, bob | Acceso de lectura/escritura al directorio de proyectos. |
| **testers** | alice, charlie | Acceso a entornos de prueba. |
| **administrators** | alice | Permisos elevados para tareas de gestión. |
*(Verificación de membresías en `configs/groups-configuration.txt`)*

## 2. Configuración de Permisos de Archivos

Se configuró el directorio `/shared/projects` para el uso exclusivo del equipo de desarrollo.

* **Comando de Creación:** `sudo mkdir -p /shared/projects`
* **Propietario:** `root`
* **Grupo:** `developers`
* **Permisos (Octal):** `770` (rwxrwx---)
    * Propietario y Grupo tienen permisos de Lectura, Escritura y Ejecución (Navegación).
    * Otros usuarios no tienen permisos.

## 3. Configuración de Seguridad (`sudo`)

Se implementó una política `NOPASSWD` para el grupo `developers` que les permite reiniciar el servicio `apache2` sin ingresar una contraseña. Esta regla se documenta en `configs/sudoers-changes.txt`.
