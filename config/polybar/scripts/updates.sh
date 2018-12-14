#!/bin/sh

# Check for updates
# Official - AUR

if ! official_updates=$(checkupdates | wc -l); then
  official_updates=0
fi

if ! aur_updates=$(trizen -Su --aur --quiet | wc -l); then
  aur_updates=0
fi

updates=$(("$official_updates" + "$aur_updates"))

if [ "$updates" -gt 0 ]; then
  echo "U $updates"
else 
  echo ""
fi
