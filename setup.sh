#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

set -e

if [ ! -d "$HOME/.bin" ]; then
  mkdir "$HOME/.bin"
fi

if [ ! -d "$HOME/.config/" ]; then
  mkdir "$HOME/.config"
fi

# Copy over my config files, even though some won't work until other stuff is installed

ln -nsf $SCRIPTPATH/nvim $HOME/.config/nvim

ln -nsf $SCRIPTPATH/git/gitignore $HOME/.gitignore
ln -nsf $SCRIPTPATH/git/gitconfig $HOME/.gitconfig

ln -nsf $SCRIPTPATH/tmux/tmux.conf $HOME/.tmux.conf
ln -nsf $SCRIPTPATH/tmux/tat $HOME/.bin/

ln -nsf $SCRIPTPATH/zsh/zshrc $HOME/.zshrc
ln -nsf $SCRIPTPATH/fast-syntax-highlighting $HOME/.zsh/fast-syntax-highlighting

# Install Homebrew if we don't have it
if ! command -v brew > /dev/null; then
  echo "Installing Homebrew..."
  curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

# Don't have a separate Brewfile, just listing all the things here - brew bundle is auto installed
# on first use, then runs the HEREDOC as if it were a Brewfile.
brew bundle --file=- <<EOF
  # Set up some Homebrew repos
  tap "homebrew/services"
  tap "caskroom/cask"
  tap "universal-ctags/universal-ctags"
  tap "heroku/brew"

  # Tooling
  brew "universal-ctags", args: ["HEAD"]
  brew "git"
  brew "openssl"
  brew "reattach-to-user-namespace"
  brew "the_silver_searcher"
  brew "tmux"
  brew "neovim"
  brew "zsh"
  cask "ngrok"
  brew "wget"
  brew "tree"
  brew "fzf"
  brew "lazygit"
  brew "kitty"

  # Heroku
  brew "heroku/brew/heroku"

  # Programming lang prerequisites
  brew "libyaml"
  brew "libjpeg"
  brew "libpng"
  brew "coreutils"

  # Setup a few Cocoa apps here, note 1Pass and Browsers are not "casked" due to restrictions on
  # security. 1Pass via Cask can't sync on iCloud, but 1Pass from MAS won't work with browsers
  # from Cask - they have to be done manually

  cask "alfred"
  cask "fantastical"
  cask "slack"
  cask "soulver"
  cask "spotify"
  cask "transmit"
  cask "zoomus"
EOF

# Make Zshell the default & activate it in current terminal
chsh -s $(which zsh)
$(which zsh)
