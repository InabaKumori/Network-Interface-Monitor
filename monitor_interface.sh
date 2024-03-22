#!/bin/bash

# Specify the interface you want to monitor
MONITOR_IFACE="enp4s0"

# Routes to add when the interface is up
ROUTES=(
  "124.***.***.*** via 192.168.1.1 dev enp4s0"
  "124.***.***.*** via 192.168.1.1 dev enp4s0"
  "124.***.***.*** via 192.168.1.1 dev enp4s0"
)

# IP address or domain to check internet connectivity
TEST_IP=124.***.***.***
DEFAULT_GATEWAY=192.168.1.1

while true; do

ip route add $TEST_IP via $DEFAULT_GATEWAY dev $MONITOR_IFACE

# Check if the gateway IP is available (meaning the interface likely has connectivity)
if ping -c 1 -I $MONITOR_IFACE $TEST_IP > /dev/null 2>&1; then
    echo "$MONITOR_IFACE is up"
    # Check if specific routes exist
    # Add your route checking logic here, similar to the previous script
    
        # Check if all the routes are present
    for route in "${ROUTES[@]}"; do
      if ! ip route show | grep -q "$route"; then
        echo "$(date) - Route $route is missing. Adding it now."
        ip route add $route
      fi
    done

else
    echo "$MONITOR_IFACE is down"
    # Handle the interface being down, perhaps by re-adding routes or sending alerts
fi


  # Sleep for 1 second before the next check
  sleep 1
done
