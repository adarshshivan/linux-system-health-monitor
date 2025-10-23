#!/bin/bash
# ==========================================
# 🩺 Linux System Health Monitor
# Author: Adarsh Shivan
# Description: Monitors CPU, memory, disk usage, uptime, and top processes.
# ==========================================

# Timestamp for log naming
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Output log file
log_file="system_health_report_$timestamp.log"

echo "===========================================" | tee -a "$log_file"
echo "🩺 SYSTEM HEALTH REPORT - $(date)" | tee -a "$log_file"
echo "===========================================" | tee -a "$log_file"

echo -e "\n🕒 SYSTEM UPTIME:" | tee -a "$log_file"
uptime -p | tee -a "$log_file"

echo -e "\n💾 DISK USAGE:" | tee -a "$log_file"
df -h | tee -a "$log_file"

echo -e "\n🧠 MEMORY USAGE:" | tee -a "$log_file"
free -h | tee -a "$log_file"

echo -e "\n🔥 CPU LOAD AVERAGE:" | tee -a "$log_file"
uptime | awk -F'load average:' '{ print $2 }' | tee -a "$log_file"

echo -e "\n🔍 TOP 5 PROCESSES BY CPU USAGE:" | tee -a "$log_file"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6 | tee -a "$log_file"

echo -e "\n✅ REPORT SAVED TO: $log_file" | tee -a "$log_file"
echo "===========================================" | tee -a "$log_file"

