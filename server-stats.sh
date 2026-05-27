echo "Basic Server Performance Stats"

# Total CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "Total CPU Usage: $cpu_usage%"
echo

# Total memory usage (Free vs Used including percentage)
mem_usage_percent=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
mem_usage=$(free -m | awk 'NR==2{print $3}')
mem_free_percent=$(free -m | awk 'NR==2{printf "%.2f", $4*100/$2 }')
mem_free=$(free -m | awk 'NR==2{print $4}')
echo "Memory Usage: $mem_usage_percent%"
echo "Used Memory: $mem_usage MB"
echo "Free Memory: $mem_free_percent%"
echo "Free Memory: $mem_free MB"
echo 

# Total disk usage (Free vs Used including percentage)
disk=$(df -h | awk '{printf "%-15s %-8s %-8s %-8s %-6s\n", $1, $2, $3, $4, $5}')
echo "Disk Usage:"
$disk
echo

# Top 5 processes by CPU usage
echo "Top 5 processes by CPU usage:"
ps -Ao user,uid,comm,pid,%cpu --sort=-pcpu | head -n 6
echo

# Top 5 processes by memory usage
echo "Top 5 processes by memory usage: "
ps -Ao user,uid,comm,pid,%mem --sort=-%mem | head -n 6
echo