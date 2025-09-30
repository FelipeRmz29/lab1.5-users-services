#!/bin/bash

# Este script verifica y registra el estado actual de los servicios clave.

LOG_FILE="/tmp/service_monitoring_$(date +%Y%m%d_%H%M%S).log"

echo "--- Service Monitoring Report - $(date) ---" > $LOG_FILE

echo "" >> $LOG_FILE
echo "--- 1. Apache2 Status ---" >> $LOG_FILE
systemctl status apache2 | grep -E "Loaded|Active|Main PID|CGroup" >> $LOG_FILE

echo "" >> $LOG_FILE
echo "--- 2. SSH Status ---" >> $LOG_FILE
systemctl status ssh | grep -E "Loaded|Active|Main PID|CGroup" >> $LOG_FILE

echo "" >> $LOG_FILE
echo "--- 3. Custom Service (simple-service) Status ---" >> $LOG_FILE
systemctl status simple-service | grep -E "Loaded|Active|Main PID|CGroup|code=exited" >> $LOG_FILE

echo "" >> $LOG_FILE
echo "--- End of Report ---" >> $LOG_FILE

echo "Reporte de monitoreo de servicios generado en: $LOG_FILE"

# Opcional: Documentar una copia del log en tu carpeta de logs
# cp $LOG_FILE lab1.5-users-services/logs/current-service-monitor.log

