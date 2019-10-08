task ls \
	limit:999999 \
	rc.verbose=nothing \
	rc.defaultwidth=100 \
	rc.report.ls.sort=id- \
	rc.report.ls.columns=id,description \
	rc.report.ls.labels=ID,Desc	\
	+UNBLOCKED | \
	fzf \
		--prompt "Done > " \
		--layout=reverse \
		--no-sort | \
	sed -E 's/\s+?([0-9]+?)\s.*/\1/' | \
		xargs -I '{}' \
			task '{}' stop \; task '{}' done 
