#!/bin/bash

#
## GENERAL UI
#

# Turn off horrible iOS rubber band effect
defaults write -g NSScrollViewRubberbanding -int 0

# Turn off modal window zoom effect
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Always show scroll bars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

#
## GENERAL SYSTEM
#

# Delete all apps from dock
defaults write com.apple.dock persistent-apps -array

# Disable system-wide resume
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable smart quotes and smart dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Prevent Time Machine from prompting to use new disks as backup volumes
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Avoid creation of .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Stop iTunes/crap from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Show ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

#
## TEXT, TRACKPAD, MOUSE AND KEYBOARD
#

# Turn off horrible keypress accent thing
defaults write -g ApplePressAndHoldEnabled -bool false

# Turn off all kinds of text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable peroid substitution.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes.
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct.
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false      # Disable text-completion.

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable """natural""" (iOS-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable two finger right click, three finger swipe
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -bool true

# Set really fast key repetition rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set really fast initial key repeat delay
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Map "Move Focus to Next Window" global shortcut to ⌘-<
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 27 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>60</integer>
        <integer>50</integer>
        <integer>1048576</integer>
      </array>
    </dict>
  </dict>
"

# Apply keyboard shortcut changes
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

#
## FINDER
#

# Set Home folder as new window target
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Users/mauritz/"

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use column view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle Clmv

# Turn off iCloud crap
defaults write com.apple.finder FXICloudDriveDesktop -bool false
defaults write com.apple.finder FXICloudDriveDocuments -bool false
defaults write com.apple.finder FXICloudDriveEnabled -bool false
defaults write com.apple.finder FXICloudDriveFirstSyncDownComplete -bool false
defaults write com.apple.finder FXICloudLoggedIn -bool false

# Finder Show/View options
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowPreviewPane -bool false
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarShowingSignedIntoiCloud -bool false
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false
defaults write com.apple.finder SidebarTagsSctionDisclosedState -bool true
defaults write com.apple.finder SidebarWidth -int 160

#
## TERMINAL
#

# Enable only UTF-8 in Terminal.app and set Pro theme to default
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# Modify Pro theme to use slight blur, Menlo font, 100x35 windows
defaults write com.apple.Terminal "Window Settings" -dict-add "Pro" "
		<dict>
			<key>BackgroundBlur</key>
			<real>0.29926842485549132</real>
			<key>BackgroundColor</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRy
			b290gAGjCwwTVSRudWxs0w0ODxAREldOU1doaXRlXE5TQ29sb3JT
			cGFjZVYkY2xhc3NNMCAwLjg1MDAwMDAyABADgALSFBUWF1okY2xh
			c3NuYW1lWCRjbGFzc2VzV05TQ29sb3KiFhhYTlNPYmplY3QIERok
			KTI3SUxRU1ddZGx5gI6Qkpeiq7O2AAAAAAAAAQEAAAAAAAAAGQAA
			AAAAAAAAAAAAAAAAAL8=
			</data>
			<key>CursorColor</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRy
			b290gAGjCwwTVSRudWxs0w0ODxAREldOU1doaXRlXE5TQ29sb3JT
			cGFjZVYkY2xhc3NLMC4zMDI0MTkzNgAQA4AC0hQVFhdaJGNsYXNz
			bmFtZVgkY2xhc3Nlc1dOU0NvbG9yohYYWE5TT2JqZWN0CBEaJCky
			N0lMUVNXXWRseYCMjpCVoKmxtAAAAAAAAAEBAAAAAAAAABkAAAAA
			AAAAAAAAAAAAAAC9
			</data>
			<key>Font</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRy
			b290gAGkCwwVFlUkbnVsbNQNDg8QERITFFZOU1NpemVYTlNmRmxh
			Z3NWTlNOYW1lViRjbGFzcyNAKAAAAAAAABAQgAKAA11NZW5sby1S
			ZWd1bGFy0hcYGRpaJGNsYXNzbmFtZVgkY2xhc3Nlc1ZOU0ZvbnSi
			GRtYTlNPYmplY3QIERokKTI3SUxRU1heZ253foWOkJKUoqeyu8LF
			AAAAAAAAAQEAAAAAAAAAHAAAAAAAAAAAAAAAAAAAAM4=
			</data>
			<key>FontAntialias</key>
			<true/>
			<key>FontWidthSpacing</key>
			<real>0.99596774193548387</real>
			<key>ProfileCurrentVersion</key>
			<real>2.0699999999999998</real>
			<key>SelectionColor</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRy
			b290gAGjCwwTVSRudWxs0w0ODxAREldOU1doaXRlXE5TQ29sb3JT
			cGFjZVYkY2xhc3NLMC4yNTQwMzIyNQAQA4AC0hQVFhdaJGNsYXNz
			bmFtZVgkY2xhc3Nlc1dOU0NvbG9yohYYWE5TT2JqZWN0CBEaJCky
			N0lMUVNXXWRseYCMjpCVoKmxtAAAAAAAAAEBAAAAAAAAABkAAAAA
			AAAAAAAAAAAAAAC9
			</data>
			<key>ShowWindowSettingsNameInTitle</key>
			<false/>
			<key>TextBoldColor</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRy
			b290gAGjCwwTVSRudWxs0w0ODxAREldOU1doaXRlXE5TQ29sb3JT
			cGFjZVYkY2xhc3NCMQAQA4AC0hQVFhdaJGNsYXNzbmFtZVgkY2xh
			c3Nlc1dOU0NvbG9yohYYWE5TT2JqZWN0CBEaJCkyN0lMUVNXXWRs
			eYCDhYeMl6CoqwAAAAAAAAEBAAAAAAAAABkAAAAAAAAAAAAAAAAA
			AAC0
			</data>
			<key>TextColor</key>
			<data>
			YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0
			b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRy
			b290gAGjCwwTVSRudWxs0w0ODxAREldOU1doaXRlXE5TQ29sb3JT
			cGFjZVYkY2xhc3NLMC45NDc1ODA2NAAQA4AC0hQVFhdaJGNsYXNz
			bmFtZVgkY2xhc3Nlc1dOU0NvbG9yohYYWE5TT2JqZWN0CBEaJCky
			N0lMUVNXXWRseYCMjpCVoKmxtAAAAAAAAAEBAAAAAAAAABkAAAAA
			AAAAAAAAAAAAAAC9
			</data>
			<key>columnCount</key>
			<integer>100</integer>
			<key>name</key>
			<string>Pro</string>
			<key>rowCount</key>
			<integer>35</integer>
			<key>shellExitAction</key>
			<integer>2</integer>
			<key>type</key>
			<string>Window Settings</string>
		</dict>
"
