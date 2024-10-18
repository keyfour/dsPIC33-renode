#!/bin/bash

# Script to install dependencies for PIC33-firmware-simulator project on an Arch Linux host

echo "Updating system and installing dependencies for Renode development..."

# Update system
sudo pacman -Syu

# Install Mono (needed for Renode development)
sudo pacman -S --needed mono

# Install GTK# for graphical interface support
sudo pacman -S --needed gtk-sharp-2

# Install cmake for building Renode
sudo pacman -S --needed cmake

# Install Python
sudo pacman -S --needed python

# Install dotnet-runtime for .NET 6.0 (if needed)
sudo pacman -S --needed dotnet-runtime

aur sync robotframework

sudo pacman -S --needed robotframework

echo "All other dependencies installed successfully!"
