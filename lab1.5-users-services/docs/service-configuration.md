# ⚙️ Informe de Servicios y Troubleshooting (`systemd`)

Este documento abarca la gestión de servicios estándar (Apache2, SSH) y la creación de una unidad de servicio personalizada.

## 1. Gestión de Servicios Estándar

Se verificó que los servicios clave como **SSH** y **Apache2** se encontraban en estado `active (running)`. La evidencia de su estado y dependencias se encuentra en los archivos de la carpeta `services/`.

* **Servicio SSH:** Verificado como fundamental para la administración remota. (Ver `services/service-status-report.txt`)

## 2. Servicio Personalizado (`simple-service`)

Se creó el script ejecutable `simple-service.sh` (que registra la hora en `/tmp/simple-service.log`) y se encapsuló en una unidad `systemd`.

* **Ubicación del Archivo de Unidad:** `/etc/systemd/system/simple-service.service`
* **Tipo de Servicio:** `Type=simple`, ya que el proceso principal es el único que proporciona la funcionalidad.
* **Ejecución:** Se configuró para ejecutarse bajo el usuario **Felipe** y reiniciarse automáticamente (`Restart=always`) cada 10 segundos en caso de fallo.

## 3. Análisis de Logs y Troubleshooting

Se simuló una falla en el servicio Apache2 renombrando su archivo de configuración principal.

* **Diagnóstico:** Se utilizó el comando `journalctl -u apache2 --since "5 minutes ago"` para capturar los logs detallados del fallo.
* **Hallazgo:** Los logs indicaron un error de "file not found" debido a la ausencia del archivo de configuración.
* **Resolución:** Se restauró el archivo de configuración y se reinició el servicio con éxito.
* *(La evidencia del diagnóstico se encuentra en `logs/troubleshooting-steps.txt`)*
