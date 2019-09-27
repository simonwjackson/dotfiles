#!/bin/bash

get_battery_combined_percent() { 
    # get charge of all batteries, combine them 
    total_charge=$(expr $(acpi -b | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc)); 

    # get amount of batteries in the device 
    battery_number=$(acpi -b | wc -l); 
    percent=$(expr $total_charge / $battery_number); 

    echo $percent; 
}
