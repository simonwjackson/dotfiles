MAC="CC:98:8B:93:2A:1F"
AUTOREMOTE_KEY=$(cat $HOME/bin/ar-key.txt)

if [[ $(pacmd list-sinks | grep $MAC) ]]; then
	echo -e "disconnect $MAC" | bluetoothctl
	curl "https://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_KEY&message=headphones:connect"
else 
	curl "https://autoremotejoaomgcd.appspot.com/sendmessage?key=$AUTOREMOTE_KEY&message=headphones:disconnect"
	sleep 5
	echo -e "connect $MAC" | bluetoothctl
fi
