if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/cask
brew cask install java

# Install packages

apps=(
  alfred
  dash2
  dropbox
  google-chrome
  google-drive
  kaleidoscope
  slack
  transmit
  vlc
)

brew cask install "${apps[@]}"

# Install files for devicons/nerdtree integration 
brew tap caskroom/fonts
brew cask install font-inconsolata-nerd-font

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Link Hammerspoon config
if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
