fzf \
	--inline-info \
	--layout reverse \
	--prompt "Add > " \
	--print-query \
	| head -n 1 \
	| xargs -I % \
		sh -c "task add %" 
