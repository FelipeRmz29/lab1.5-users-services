# 🛠️ Registro de Troubleshooting de Servicios (Apache2)

Este registro documenta el proceso de simular y resolver una falla en el servicio Apache2, utilizando `systemctl` y `journalctl` para el diagnóstico.

## 1. Simulación de Falla

Se simuló un fallo catastrófico en Apache2 moviendo (renombrando) el archivo de configuración principal, causando que el servicio no pudiera cargarse.

* **Comando para Romper:** `sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.backup`
* **Resultado de systemctl status:** El servicio pasó a estado `failed`, arrojando un `Exit-Code` que indicaba un problema de configuración o ruta no encontrada.

## 2. Diagnóstico del Error

Para identificar la causa exacta del fallo, se utilizó el journal del sistema.

* **Comando de Diagnóstico:** `journalctl -u apache2 --since "5 minutes ago"`
* **Hallazgo:** El log capturado (guardado en `logs/troubleshooting-steps.txt`) confirmó que el error era: `No such file or directory` (No existe el archivo o directorio), confirmando que el archivo de configuración era el problema.

## 3. Resolución

* **Comando de Restauración:** `sudo mv /etc/apache2/apache2.conf.backup /etc/apache2/apache2.conf`
* **Resultado Final:** Después de restaurar el archivo y ejecutar `sudo systemctl start apache2`, el servicio volvió al estado `active (running)`.
