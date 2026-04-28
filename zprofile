if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
  exec start-hyprland
fi

# Automatically start ssh-agent if not running
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval `ssh-agent -s` > /dev/null
   ssh-add ~/.ssh/id_rsa 2>/dev/null
fi