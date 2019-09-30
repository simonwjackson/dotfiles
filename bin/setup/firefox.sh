#!/usr/bin/zsh

profile="default"

mozilla="${HOME}/.mozilla"
xdg_mozilla="${HOME}/.config/mozilla"

firefox="${HOME}/.mozilla/firefox"
xdg_firefox="${HOME}/.config/mozilla/firefox"

profile_path="${firefox}/${profile}"
xdg_profile_path="${xdg_firefox}/${profile}"

rm -rdf "${mozilla}" 

mkdir -p "${profile_path}" 
ln -s ${xdg_firefox}/profiles.ini ${firefox}/profiles.ini
ln -s ${xdg_profile_path}/chrome ${profile_path}/
ln -s ${xdg_profile_path}/user.js ${profile_path}/user.js
ln -s ${xdg_mozilla}/native-messaging-hosts ${mozilla}/native-messaging-hosts

## Disable userChrome.css (temporarily)
tee -a ${profile_path}/user.js > /dev/null <<EOT
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", false); 
EOT 
echo $(cat ${HOME}/.config/packages/firefox) | xargs firefox

## Renable userChrome.css
sed -i '$ d' ${profile_path}/user.js 
