if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  archey
  asciinema
  bash-completion2
  bats
  battery
  coreutils
  cmake
  ctags
  diff-so-fancy
  dockutil
  fasd
  ffmpeg
  fzf
  gh
  gifsicle
  git
  git-extras
  go
  gnu-sed --with-default-names
  grep --with-default-names
  hstr
  hub
  httpie
  imagemagick
  jq
  lynx
  mackup
  mysql
  mono
  nano
  node
  pandoc
  peco
  psgrep
  python
  r
  ranger
  reattach-to-user-namespace
  rust
  shellcheck
  ssh-copy-id
  tmux
  tpm
  tree
  vim
  wget
  wifi-password
  xmlstarlet
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
