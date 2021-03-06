#!/bin/sh

RUBY_VERSION=2.6.3
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

set -e

if [ ! -d "$HOME/.bin" ]; then
  mkdir "$HOME/.bin"
fi

# Copy over my config files, even though some won't work until other stuff is installed

if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir "$HOME/.config/nvim"
fi

if [ ! -d "$HOME/.zsh" ]; then
  mkdir "$HOME/.zsh"
fi

if [ ! -d "$HOME/.emacs.d" ]; then
  mkdir "$HOME/.emacs.d"
fi

ln -nsf $SCRIPTPATH/emacs/init.el $HOME/.emacs.d/init.el
ln -nsf $SCRIPTPATH/emacs/readme.org $HOME/.emacs.d/readme.org
ln -nsf $SCRIPTPATH/emacs/snippets $HOME/.emacs.d/snippets

ln -nsf $SCRIPTPATH/nvim/init.vim $HOME/.config/nvim/init.vim
ln -nsf $SCRIPTPATH/nvim/init.vim $HOME/.config/nvim/init.vim
ln -nsf $SCRIPTPATH/nvim/rcfiles $HOME/.config/nvim/rcfiles
ln -nsf $SCRIPTPATH/nvim/rcplugins $HOME/.config/nvim/rcplugins

ln -nsf $SCRIPTPATH/git/gitignore $HOME/.gitignore
ln -nsf $SCRIPTPATH/git/gitconfig $HOME/.gitconfig

ln -nsf $SCRIPTPATH/tmux/tmux.conf $HOME/.tmux.conf
ln -nsf $SCRIPTPATH/tmux/tat $HOME/.bin/

ln -nsf $SCRIPTPATH/zsh/zshrc $HOME/.zshrc
ln -nsf $SCRIPTPATH/zsh/fast-syntax-highlighting $HOME/.zsh/fast-syntax-highlighting

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

  # Heroku
  brew "heroku/brew/heroku"

  # Programming lang prerequisites
  brew "libyaml"
  brew "libjpeg"
  brew "libpng"
  brew "imagemagick@6"
  brew "coreutils"
  brew "yarn"
  # JDK is a requirement for ElasticSearch
  cask "homebrew/cask-versions/adoptopenjdk8"

  # Ruby
  brew "rbenv"

  # Python (for Neovim)
  brew "python@2"
  brew "python@3"

  # NodeJS
  brew "node"

  # GitHub
  brew "hub"

  # Database/Caching
  # Version locked for projects
  brew "postgresql@10"
  brew "redis"
  brew "memcached"
  brew "elasticsearch@5.6"

  # Setup a few Cocoa apps here, note 1Pass and Chrome are not "casked" due to restrictions on
  # security. 1Pass via Cask can't sync on iCloud, but 1Pass from MAS won't work with browsers 
  # from Cask - they have to be done manually

  # Replacement for Spotlight
  cask "alfred"
  # I nearly always use terminal Vim, but like Emacs for a GUI text editor when I need one
  cask "emacs"
  # Awesome calendar replacement
  cask "fantastical"
  # Terminal
  cask "iterm2"
  # Automation, keyboard macros, and text expasion
  cask "keyboard-maestro"
  # Postgresql GUI
  cask "postico"
  # Graphic design
  cask "sketch"
  # Work IM
  cask "slack"
  # Amazing math tool
  cask "soulver"
  # Music
  cask "spotify"
  # File transfers
  cask "transmit"
  # Video conferencing
  cask "zoomus"
EOF

if [ ! -d "$HOME/.config/" ]; then
  mkdir "$HOME/.config"
fi

if [ ! -d "$HOME/.rbenv/plugins" ]; then
  mkdir "$HOME/.rbenv/plugins"
fi

# Install ctags for Ruby itself
if [ ! -d "$HOME/.rbenv/plugins/rbenv-tags" ]; then
  git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
fi

# Setup Ruby
rbenv install --skip-existing $RUBY_VERSION
rbenv global $RUBY_VERSION

# Some global gems
gem install gem-ctags # install this first so all other gems are tagged
gem install bundler
gem install seeing_is_believing

# Setup NeoVim

# ruby support
gem install neovim
# python support (needed for Deoplete)
pip2 install --user neovim
pip3 install --user neovim
# add node support to neovim without cluttering up the repo
yarn --cwd $HOME/.config/nvim add global neovim

# package manager
if [ ! -d "$HOME/.config/nvim/pack/minpac/opt/minpac" ]; then
  git clone https://github.com/k-takata/minpac.git \
      $HOME/.config/nvim/pack/minpac/opt/minpac
fi
nvim +PackUpdate +qall

# Make Zshell the default & activate it in current terminal
chsh -s $(which zsh)
$(which zsh)

