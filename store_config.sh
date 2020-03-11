#!/bin/bash
# install rpm-ostree packages

# Turn night light on
# https://unix.stackexchange.com/questions/400025/activate-night-light-option-from-terminal
# gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true


# Tweaks
# Generate list of extensions:

gnomeExt(){
  # something like:
  # https://askubuntu.com/questions/591757/how-to-activate-deactivate-a-gnome-shell-extension-from-command-line
  gnome-extensions list > extensions.txt
  input="extensions.txt"
  while IFS= read -r line
  do
    echo "plugin: $line"
    gnome-extensions info $line >> plugins.txt
  done < "$input"
  # /usr/share/gnome-shell/extensions/
}

rpmOst(){
  rpm-ostree status > rpm_ostress.txt
}
# cp extensions-folder :|

save_dconf(){
  dconf dump / > dconf-settings.ini
}

load_dconf(){
  cat dconf-settings.ini | dconf load /
}

# need to find config directory

dnf(){
  dnf list installed > dnf_packages.txt
}

# https://www.reddit.com/r/gnome/comments/20i743/syncing_gnome_settings_and_extensions_between/cg3phrf/

gnomeExt
save_dconf
dnf
rpmOst
