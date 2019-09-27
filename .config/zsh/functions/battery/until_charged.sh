#!/bin/bash

get_time_until_charged() { 
    # parses acpitool's battery info for the remaining charge of all batteries and sums them up
    sum_remaining_charge=$(acpitool -B | grep -E 'Remaining capacity' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc);

    # finds the rate at which the batteries being drained at
    present_rate=$(acpitool -B | grep -E 'Present rate' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc); 

    # divides current charge by the rate at which it's falling, then converts it into seconds for `date` 
    seconds=$(bc <<< "scale = 10; ($sum_remaining_charge / $present_rate) * 3600"); 

    # prettifies the seconds into h:mm:ss format 
    pretty_time=$(date -u -d @${seconds} +%T); 

    echo $pretty_time; 
}
