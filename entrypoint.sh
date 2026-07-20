#!/bin/bash
# entrypoint.sh: Automated forensic triage script

echo "--- Forensic Workbench Injection: $(date) ---"

# 1. Identify the target process
echo "[+] Target Process Tree:"
ps -ef | head -n 10

# 2. Check for active network connections
echo "[+] Active Network Connections:"
netstat -antp | grep ESTABLISHED

# 3. Check for open files/sockets related to the application
echo "[+] Open Files/Sockets (lsof):"
lsof -p 1 | head -n 10

echo "--- Automated Triage Complete. Dropping to shell. ---"

# Keep the container running
exec /bin/bash
