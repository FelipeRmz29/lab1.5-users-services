#!/bin/bash
echo "--- System Performance Report ---"
echo "Date: $(date)"
echo "Uptime:"
uptime
echo "--- Memory Usage ---"
free -h
echo "--- Disk Usage ---"
df -h
echo "--- Top 5 Processes (CPU) ---"
ps aux --sort=-%cpu | head -n 6
