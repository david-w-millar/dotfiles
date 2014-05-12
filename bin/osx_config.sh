#!/usr/bin/env bash
#
# OS X Settings
#

# Get Creds
sudo -v

# Silent Boot
sudo nvram SystemAudioVolume=" "

# Expand save and print dialogs
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Close print app when done
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Do not confirm app open
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Show more info in login dialog
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Auto restart on freeze
systemsetup -setrestartfreeze on

# Check updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Screenshots: desktop, png, no shadow
#defaults write com.apple.screencapture location -string "${HOME}/Desktop"
#defaults write com.apple.screencapture type -string "png"
#defaults write com.apple.screencapture disable-shadow -bool true

# show drives and servers etc on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Finder: show extensions, path bar, ql selection, full path title, no extension change warnings
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# No .DS_Store files on net locations
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Trash: no prompt on empty, secure delete
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Spaces: no mru ordering
defaults write com.apple.dock mru-spaces -bool false

# Dock: Autohide
defaults write com.apple.dock autohide -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

