#!/bin/bash

echo "Executing commands ..."

runcommand ()
{

#Fixing broken ubuntu dependencies for some cases 
  sudo apt update
  sudo apt upgrade -y
  sudo apt --fix-broken install -y

  #Installing Gnome Desktop
  sudo apt install ubuntu-gnome-desktop -y
  echo "\e[32mInstalling Gnome - Complete\e[0m"

#Installing Chrome Remote Desktop (CRD)
  curl -o /tmp/chrome-remote-desktop_current_amd64.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb && \
  sudo apt install -y /tmp/chrome-remote-desktop_current_amd64.deb
  echo "\e[32mInstalling Chrome Remote Desktop - Complete\e[0m"

#Installing Chrome Browser (latest)
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
echo "\e[32mInstalling Chrome Browser - Complete\e[0m"

#Installing p7Zip Desktop
  sudo snap install p7zip-desktop
  echo "\e[32mInstalling 7Zip - Complete\e[0m"
  
#Updating Gnome and reinstalling CRD to fix the broken input issue
  sudo apt autoremove -y
  sudo apt update
  sudo apt-get install chrome-remote-desktop
  
}

runcommand
