#!/usr/bin/zsh

kitty \
	--class "GTD" \
	--title "Routine" \
		tmux -L gtd \
			new-session \
				-t gtd \; \
				select-window -t 0 \; &

kitty \
	--class "GTD" \
	--title "Inbox" \
		tmux -L gtd \
			new-session \
				-t gtd \; \
				select-window -t 1 \; &

kitty \
	--class "GTD" \
	--title "Bottomline" \
		tmux -L gtd \
			new-session \
				-t gtd \; \
				select-window -t 2 \; &

kitty \
	--class "GTD" \
	--title "Xmas" \
		tmux -L gtd \
			new-session \
				-t gtd \; \
				select-window -t 3 \; &

kitty \
	--class "GTD" \
	--title "Workflow" \
		tmux -L gtd \
			new-session \
				-t gtd \; \
				select-window -t 4 \; &


kitty \
	--class "GTD" \
	--title "Accomplished" \
		tmux -L gtd \
			new-session \
				-t gtd \; \
				select-window -t 5 \; &
