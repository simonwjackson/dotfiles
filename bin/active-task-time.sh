timew | \
	# Capture time row
	head -n 4 | \
	tail -n 1 | \
	# Capture time column
	awk '{print $2}' | \
	# Remove seconds
	sed -r 's/...$/m/' | \
	# Remove leading zero from hour
	sed -r 's/^0://' | \
	# Remove leading zeros
	sed -r 's/0?(\.*)/\1/' 
