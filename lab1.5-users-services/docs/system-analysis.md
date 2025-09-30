# 📊 Informe de Análisis y Monitoreo del Sistema

Este informe documenta el estado operativo y de rendimiento del sistema, basándose en herramientas de monitoreo en tiempo real y análisis de logs.

## 1. Monitoreo de Rendimiento (htop)

Se utilizó `htop` (Captura 06) para monitorear el uso de CPU, Memoria y los procesos en tiempo real.
* **Hallazgos:** El sistema opera bajo baja carga, con un uso mínimo de RAM y CPU (aproximadamente [ej. 1-2%] de carga promedio). La memoria Swap ([ej. 0K/0K]) no fue utilizada, indicando recursos suficientes.
* **Reporte Detallado:** La salida completa de los comandos de rendimiento (`uptime`, `free -h`, `df -h`) se encuentra en `logs/performance-report.txt`.

## 2. Análisis de Logs (journalctl)

Se examinaron los logs del sistema (`journalctl`) para identificar errores y revisar el estado del servicio SSH.

* **Análisis de Logs de Errores:** Se ejecutó `journalctl -p err --since "24 hours ago"`. El resultado del análisis de logs está en `logs/service-logs-analysis.txt`.
* **Análisis de Logs de Usuario:** Los comandos `last` y `lastlog` se utilizaron para registrar la actividad de inicio de sesión de los usuarios del sistema.

## 3. Servicios Clave

Se verificó el estado de los servicios clave para la operación del servidor, confirmando que `ssh.service` y `apache2.service` se encuentran en estado `active (running)`.
