#!/usr/bin/zsh

grep -qxF 'load-module module-bluetooth-policy' /etc/pulse/system.pa || sudo -E echo '# Bluetooth\nload-module module-bluetooth-policy' >> /etc/pulse/system.pa
grep -qxF 'load-module module-bluetooth-discover' /etc/pulse/system.pa || sudo -E echo 'load-module module-bluetooth-discover' >> /etc/pulse/system.pa

sudo sed -i -E 's/#?AutoEnable=false/AutoEnable=true/' /etc/bluetooth/main.conf 
sudo sed -i -E 's/#DiscoverableTimeout.*/DiscoverableTimeout=0/' /etc/bluetooth/main.conf

if [[ $(grep -qxF '^Discoverable ?=.*' /etc/bluetooth/main.conf) ]]; then
	sudo sed -i -E 's/#?Discoverable ?=.*/Discoverable=true/' /etc/bluetooth/main.conf 
else
	sudo sed -i -E 's/\[General\]/[General\]\nDiscoverable=true/' /etc/bluetooth/main.conf
fi
