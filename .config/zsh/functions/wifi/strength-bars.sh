#!/bin/sh

wifi_bars () {
	wifi=$(nmcli d wifi | grep "^\*" | grep -v "\*.*SSID" | awk '{ print $8 }')

	echo ${wifi} 
}
