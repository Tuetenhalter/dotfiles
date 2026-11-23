# Automatically start ssh-agent if not running
# (must come before starting Hyprland: `exec` below replaces this shell)
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval `ssh-agent -s` > /dev/null
   ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi

if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
  clear
  exec start-hyprland > /dev/null
fi
