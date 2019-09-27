source ${HOME}/.config/zsh/functions/battery/percent.sh
# source ${HOME}/.config/zsh/functions/wifi/strength-bars.sh
# TODO: Source wifi from this file

date=$(date +'%l:%M' | xargs)
wifi=$(nmcli d wifi | grep "^\*" | grep -v "\*.*SSID" | awk '{ print $8 }') 

echo "${wifi} | $(get_battery_combined_percent)% | ${date}"
