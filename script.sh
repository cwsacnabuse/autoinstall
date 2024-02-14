#!/bin/bash

echo "Executing commands ..."

runcommand ()
{
#Fixing broken ubuntu dependencies for some cases 
  sudo apt update
  sudo apt upgrade
  sudo apt --fix-broken install
#Installing Ubuntu Gnome Desktop
  sudo apt install ubuntu-gnome-desktop -y
  echo "Installing Gnome - Complete"
#Installing Chrome Remote Desktop (CRD)
  curl -o /tmp/chrome-remote-desktop_current_amd64.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb && \
  sudo apt install -y /tmp/chrome-remote-desktop_current_amd64.deb
  echo "Installing Chrome Remote Desktop - Complete"
#Installing Chrome Browser (latest)
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
  echo "Installing Chrome - Complete"
#Installing p7Zip Desktop
  sudo snap install p7zip-desktop
  echo "Installing 7Zip - Complete"
#Installing Plank  
  sudo apt install plank -y
  echo "Installing Plank dock - Complete"
#Restarting pulseaudio to fix audio
  pulseaudio --start
#Updating Gnome and reinstalling CRD to fix the broken input issue
  sudo apt autoremove -y
  sudo apt update
  sudo apt-get install chrome-remote-desktop
}

runcommand
