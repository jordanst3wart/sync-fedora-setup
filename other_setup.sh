#!/bin/bash


# Go
# details: https://golang.org/doc/install
# /etc/profile (for a system-wide installation) or $HOME/.profile: 
export PATH=$PATH:/usr/local/go/bin
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# local bin
/home/jstewart/.local/bin

# other data :|

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
