#!/bin/bash

# Function to ask for confirmation
ask_for_confirmation() {
    local prompt_message="$1"
    echo
    read -r -p "$prompt_message (y/N): " response
    case "$response" in
        [yY][eE][sS]|[yY])
            return 0 # Proceed
            ;;
        *)
            echo "Skipping command."
            return 1 # Skip
            ;;
    esac
}

# --- System Update ---
echo "## Step 1: System Update"
if ask_for_confirmation "Do you want to run 'sudo pacman -Syu' to update your system?"; then
    echo "Running sudo pacman -Syu"
    sudo pacman -Syu
fi

# --- Package Installation ---
packages=(
    # hyprland
    hyprland
    qt5-wayland
    qt6-wayland
    noto-fonts
    hyprpolkitagent # Authentication Agent
    dunst # notification daemon
    brightnessctl

    kitty
    dolphin
    zsh

    # gui
    rofi
    waybar
    otf-font-awesome #icons

    # sound
    pipewire
    wireplumber
    pulseaudio
    pavucontrol

    # bluetooth
    bluez
    bluez-utils
    bluetui

    # internet
    nm-connection-editor

    # application
    vim
    steam
    firefox
    discord
)

echo
echo "## Step 2: Package Installation"
echo "The following packages will be installed: ${packages[@]}"
if ask_for_confirmation "Do you want to run 'sudo pacman -S' to install these packages?"; then
    echo "Running sudo pacman -S ${packages[@]}"
    sudo pacman -S "${packages[@]}"
fi

# --- Oh My Zsh Installation ---
echo
echo "## Step 3: Oh My Zsh Installation"
if ask_for_confirmation "Do you want to install Oh My Zsh (runs a script from GitHub)?"; then
    echo "Running sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- Zsh Plugins ---
echo
echo "## Step 4: Zsh plugins Installation"
if ask_for_confirmation "Do you want to install the zsh-autosuggestions and zsh-syntax-highlighting"; then
    echo "git clone "https://github.com/zsh-users/zsh-autosuggestions.git" ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    git clone "https://github.com/zsh-users/zsh-autosuggestions.git" ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

    echo "git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    
fi  

# --- Custom Copy Script ---
echo
echo "## Step 5: Run Custom Copy Script"
if ask_for_confirmation "Do you want to copy the config files"; then
    echo "Running ./copy.sh"
    # Check if the script exists and is executable before running
    if [ -x "./copy.sh" ]; then
        ./copy.sh
    else
        echo "Error: './copy.sh' not found or not executable. Skipping."
    fi
fi



echo
echo "Script finished."
