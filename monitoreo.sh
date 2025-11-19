
## Monitor CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_usage=${cpu_usage%.*} ## Convert to integer
echo "Current CPU usage: $cpu_usage%"

if ((cpu_usage >= CPU_THRESHOLD)); then
  send_alert "CPU" "$cpu_usage"
fi