#!/bin/env zsh

nmcli d wifi | \
	grep "^\*" | \
	grep -v "\*.*SSID" | \
	awk '{ print $8 }' | \
	sed 's/$/%/'
