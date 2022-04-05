{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

    programs.bat = {
      enable = true;
      config = {
        theme = "GitHub";
        italic-text = "always";
      };
    };

    programs.git = {
      enable = true;
      userName  = "Simon W. Jackson";
      userEmail = "hello@simonwjackson.io";
      aliases = {
        d = "difftool";
        mt = "mergetool";

        c = "! git commit --message";
        u = "! git add --update";

        # Commit all with message
        commit-all-with-message = "!git add -A && git c --message";
        # Commit all now and sync
        commit-with-sync = "! git uma && git sync";
      
        # Update the previous commit with new changes
        amend-staged = "commit --amend --no-edit";
        # Update the previous commit with new changes and change the message.
        amend-staged-with-message = "c --amend";
        # Commit all now: Add changed files and commit with the same message.
        amend-all-now = "commit --amend --no-edit -a";
      
        fzf = "!f() { git-fzf $@ }; f";
        edit-modified = "! git status --porcelain  | awk '{print $2}' | xargs -I '%' echo \"$(git rev-parse --show-toplevel)/%\" | xargs nvim -p";
        em = "edit-modified";
        
        # Graph log: gives you history of current branch
        l = "log --graph --decorate --oneline";
        # Graph log all: all commits in repo
        la = "log --graph --decorate --oneline --all";
        # Graph log all as shortlist: tag/branch/labelled commits.
        las = "log --graph --decorate --oneline --all --simplify-by-decoration";
        # Graph who and when.
        lw = "log --color --graph --pretty=format:'%C(214)%h%C(reset)%C(196)%d%C(reset) %s %C(35)(%cr)%C(27) <%an>%C(reset)'";
        # Escape < and > for github markdown, (useful for generating changelogs).
        changelog  = "! git log --pretty=format:'* %h - %s %n%w(76,4,4)%b%n' --abbrev-commit \"$@\" | perl -0 -p -e 's/(^|[^\\\\])([<>])/\\1\\\\\\2/g ; s/(\\s*\\n)+\\*/\\n\\n*/g' #";
        sync = "! git fetch --tags && git rebase --autostash && git push";
      
        # Squash all unpushed commits with a new message
        squash = "! git reset --soft HEAD~$(git log origin/main..main | grep commit | wc -l | awk '{$1=$1};1') && git commit";
        s = "squash" ;
      };

      extraConfig = {
        difftool = {
          prompt = false;
	};
        core = {
          editor = "nvim";
	  pager = "delta";
	  excludesfile = "~/.gitignore";
        };

	interactive = {
	  diffFilter = "delta --color-only";
        };

	delta = {
	  features = "side-by-side line-numbers decorations";
	  whitespace-error-style = "22 reverse";
	  side-by-side = false;
	};
        diff = {
          tool = "vimdiff";         # Use nvim vimdiff to view diffs (`git difftool`).
        };
        push = {
          default = "simple";
        };
        pull = {
          ff = "only";
        };
        init = {
          defaultBranch = "main";
        };
      };
      ignores = [
        ".DS_Store"
        "*.pyc"
      ];
    };

    xsession.windowManager.bspwm = {
      enable = true;
      startupPrograms = [
        "polybar heads-up"
        "kitty tmux"
      ];
      extraConfig = ''
hsetroot -solid "#000000"
      '';
    };

    services.sxhkd = {
      enable = true;
      #keybindings = {
      #  "super + Return" = "kitty";
      #};
      extraConfig = ''
        # TODO: UNBOUND KEYS
        # kitty-popup wifi-menu
  
	# new term
	super + {_, ctrl +, alt +} Return
	  {kitty tmux, kitty, kitty-popup $SHELL}
	  # {alacritty --command tmux, alacritty, kitty-popup $SHELL}}
	  # {kitty, bspc rule -a \* -o state=floating sticky=on layer=above rectangle=720x360+600+26 && kitty}
	  # {kitty tmux, kitty-popup $SHELL}

	# kill focused window
	super + x
	  kill-or-close

	super + {_, alt +} t
	  flameshot {gui,full --clipboard}

	super + alt + ctrl + j
	  kitty-popup xrandr-scale

	super + y; {_, super +}y
	  kitty-popup youtube-search

	super + y; {_, super +}s
	  kitty-popup youtube-subscriptions

	# Reload polybar
	super + shift + r; p
	  polybar-msg cmd restart

	# Reload sxhkdrc
	super + shift + r; s
	  pkill -usr1 -x sxhkd

	# Reload bspwmrc
	#super + shift + r; b
	#  HOME/.config/bspwm/bspwmrc

	super + period
	  kitty-popup sxhkd-cheat

	super + comma
	  resize-window 16 9

	super + w; {_, super +}w
	  kitty-popup vimwiki-index

	super + w; {_, super +}i
	  kitty-popup vimwiki-inbox

	# Music menu
	super + p; {_, super +}s
	  kitty-popup media-control search

	super + p; {_, super +}l
	  kitty-popup media-control library

	super + apostrophe
	  kitty-popup interview-snippets
	  
	# Pianobar
	# super + p; {_, super +}p
	#   term-float control-pianobar station

	# Dark Mode
	# super + r ; c ; d
	#   source set-colors plastic

	# Light Mode
	# super + r ; c ; n
	#   source set-colors neg

	# Generate password
	super + r ; g ; p
	  bw generate | xclip -selection clipboard

	super + r ; j
	  kitty-popup node

	# super + d; {_,super +} {d,a,n,t,j,r}
	#   term-float tasker {_,_} {_,add,now,toggle,journal,summary}
	 
	#################
	# Audio
	#################

	XF86Audio{Play,Next,Prev}
	  media-control {toggle,next,prev}
	  
	super + XF86AudioPlay
	  media-control explain

	# Toggle mute
	XF86AudioMute
	  pulseaudio-ctl mute

	# Change volume
	#XF86Audio{Raise,Lower}Volume
	#  pulseaudio-ctl {up,down} 2

	# # Pianobar
	# super + XF86Audio{Rewind,LowerVolume,RaiseVolume,Forward}
	#   media-control {ban,tired,like,bookmark}

	XF86MonBrightnessUp
	  backlight_control +5

	XF86MonBrightnessDown
	  backlight_control -5

	#####################
	# Movement
	#####################

	# swap the current node and the biggest window
	super + g
	  bspc node -s biggest.window.local

	# toggle floating
	super + space
	  bspc node -t "~floating"

	# focus the node in the given direction
	super + {h,j,k,l}
	  [[ $(bspc query -T -d | jq -er '.layout == "tiled"') == "true" ]] \
	    && bspc node -f {west,south,north,east}.local \
	    || bspc node {prev.!hidden.window.local,next.!hidden.window.local,prev.!hidden.window.local,next.!hidden.window.local} --focus
	  #movement {west,south,north,east}

	# move the node in the given direction
	super + ctrl + {h,j,k,l}
	  bspc node -s {west,south,north,east}

	super + shift + {h,j,k,l}
	  bspc node -p {west,south,north,east}

	# Go to monitor
	super + {Left,Right} 
	  bspc monitor {west,east} --focus

	# focus the older or newer node in the focus history
	super + {o,i}
	  bspc wm -h off; \
	  bspc node {older,newer} -f; \
	  bspc wm -h on

	# focus or send to the given desktop
	# super + {_,alt + }{1-3,7-9}
	#   bspc {desktop -f,node -d} {I,II,III,VII,VIII,IX}
	#
	# super + {_,alt + }{4-6}
	#   bspc {monitor --focus,node --to-monitor} {DP1-8,VIRTUAL1,HDMI2} {_,--follow}

	# move window to another desktop
	#super + apostrophe
	# bspc node -m next --follow

	# move workspace to another monitor 
	# super + alt + apostrophe
	#   desk=`bspc query -D -d focused`; \
	#   bspc desktop -m {prev,next}; \
	#   bspc desktop -f $desk

	super + alt + ctrl + {h,l} 
	  bspc node --to-monitor {west,east} --follow
		
	#####################
	# Resize
	##################### 

	# Resizing (natural)
	super + shift {_,+ ctrl} + {Left,Down,Up,Right}
	  STEP={100,20}; SELECTION={1,2,3,4}; \
	  bspc node -z $(echo "left -$STEP 0,bottom 0 $STEP,top 0 -$STEP,right $STEP 0" | cut -d',' -f$SELECTION) || \
	  bspc node -z $(echo "right -$STEP 0,top 0 $STEP,bottom 0 -$STEP,left $STEP 0" | cut -d',' -f$SELECTION)

	super + alt + {Left,Right}
	  bspc node @/ -C {backward,forward}


	#####################
	# Layout
	#####################

	# toggle fullscreen mode for the focused container
	super + m
	  bspc desktop -l next


	#####################
	# Applications
	#####################

	# start qutebrowser
	super + b; {_, super +}b
	  qutebrowser

	# start firefox
	super + b; {_, super +}f
	  firefox

	# File explorer
	super + f
	  kitty-popup lf ~

	#####################
	# Misc
	#####################

	# Bluetooth Devices
	super + r; b
	  kitty-popup bluetooth-devices
      '';
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      defaultKeymap = "vicmd";
      enableSyntaxHighlighting = true;
      enableAutosuggestions = true;
      enableCompletion = true;

      dirHashes = {
        docs  = "$HOME/Documents";
        dl    = "$HOME/Downloads";
      };

      shellAliases = {
        cat = "bat";
        sl = "exa";
        ls = "exa";
        l = "exa -l";
        la = "exa -la";
        ip = "ip --color=auto";
      };
    };

    home.packages = with pkgs; [ 
      firefox

      # X11
      polybar
      picom
      kitty

      # Terminal Utils
      exa
      btop
      dialog
    ];
}
