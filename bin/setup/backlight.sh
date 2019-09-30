#!/usr/bin/zsh

# Enable Backlight control
sudo tee /etc/udev/rules.d/backlight.rules > /dev/null <<EOT
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
EOT
