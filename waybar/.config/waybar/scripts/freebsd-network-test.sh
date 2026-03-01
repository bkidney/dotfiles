#!/bin/sh +x

# Enumerate active network interfaces on FreeBSD
interfaces=$(ifconfig -l)

output=""
tooltip=""

# Determine default route interface
default_if=$(route -n get default 2>/dev/null | awk '/interface:/{print $2}')

for iface in $interfaces; do
    printf "%s\n" "$iface"
    # # Skip loopback
    # [ "$iface" = "lo0" ] && continue
    #
    # info=$(ifconfig "$iface")
    #
    # # Check if interface is UP
    # echo "$info" | grep -q "status: active"
    # is_up=$?
    #
    # # Detect WiFi interface
    # echo "$info" | grep -q "ssid "
    # is_wifi=$?
    #
    # if [ $is_up -eq 0 ]; then
    #     if [ $is_wifi -eq 0 ]; then
    #         # Extract SSID
    #         ssid=$(echo "$info" | awk -F'ssid ' '/ssid /{print $2}' | awk '{print $1}')
    #
    #         # Extract RSSI (signal strength)
    #         rssi=$(echo "$info" | awk -F'signal: ' '/signal:/{print $2}' | awk '{print $1}')
    #
    #         # Convert RSSI to percentage (rough estimation)
    #         if [ -n "$rssi" ]; then
    #             percent=$(( (rssi + 100) * 2 ))
    #             [ $percent -gt 100 ] && percent=100
    #             [ $percent -lt 0 ] && percent=0
    #         else
    #             percent=0
    #         fi
    #
    #         icon=""
    #
    #         output="$output $icon ${percent}%"
    #         tooltip="$tooltip\n$iface (WiFi)\nSSID: $ssid\nSignal: ${percent}%"
    #     else
    #         icon="󰈀"
    #
    #         if [ "$iface" = "$default_if" ]; then
    #             output="$output $icon"
    #             tooltip="$tooltip\n$iface (Ethernet - Default Route)"
    #         else
    #             output="$output 󰈂"
    #             tooltip="$tooltip\n$iface (Ethernet)"
    #         fi
    #     fi
    # else
    #     tooltip="$tooltip\n$iface (down)"
    # fi
done

# Trim leading whitespace
output=$(echo "$output" | sed 's/^ *//')

# Output JSON for Waybar
printf '{"text":"%s","tooltip":"%s"}\n' "$output" "$tooltip"

