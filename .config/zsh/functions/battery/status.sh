#!/bin/bash

get_battery_charging_status() { 
	if $(acpi -b | grep --quiet Discharging)

	then 
			echo "Discharging"; 
	else # acpi can give Unknown or Charging if charging, https://unix.stackexchange.com/questions/203741/lenovo-t440s-battery-status-unknown-but-charging 
			echo "Charging"; 
	fi 
}
