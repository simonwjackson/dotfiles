cd ~ 

# Start a new git repository
git init

# Add the remote dotfiles repo
git remote add origin https://github.com/simonwjackson/dotfiles.git

# Pull and merge with local git
git pull origin master

# Install Apps
pacman -S --noconfirm - < ~/PACKAGES
