echo "===== Server Statistics ====="

# CPU Usage
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "User: " $2 "%, System: " $4 "%, Idle: " $8 "%"}'

# Memory Usage
echo "Total Memory Usage:"
free -m | awk 'NR==2{printf "Used: %s MB, Free: %s MB (%.2f%% used)\n", $3, $4, $3*100/$2}'

# Disk Usage
echo "Total Disk Usage:"
df -h / | awk 'NR==2 {printf "Used: %s, Free: %s (%.2f%% used)\n", $3, $4, $3*100/($3+$4)}'

# Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
