# macOS High Sierra v. 10.13 Setup

This is a simple list of instructions to setup an Apple computer as fast and
efficient as possible for a development environment.

The Setup Assistant will launch once the computer turned on. Here select
language, time zone, Apple ID, and so on. Do not to use "Migration Assistant",
and set up the computer from scratch. First use the App Store software to update
macOS to get the latest security updates and patches.

## Xcode

Install [Xcode](https://developer.apple.com/xcode/) Apple’s development
bundle.

```shell
xcode-select --install
```

## Homebrew

Install the [Homebrew](https://brew.sh/) package manager.

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Mac App Store

Use the Mac App Store command line interface, or
[mas-cli](https://github.com/mas-cli/mas), to install apps from the App Store.

```shell
brew install mas
```

#### Sign In

Log into the App Store.

```shell
mas signin email@email.com
```

### Brewfile

Install Homebrew packages.

```
cp ~/dotfiles/Brewfile ~/Brewfile
brew bundle
```

## Node Version Manager (NVM)

Install the command-line tool [NVM](https://github.com/creationix/nvm/) to
manage multiple node environments.

```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
```

### Install latest Node version

```shell
nvm install node
```

```shell
nvm use node
node -v
```

## Ruby Version Manager (RVM)

Install the command-line tool [RVM](https://rvm.io/) to manage multiple ruby
environments.

```shell
curl -sSL https://get.rvm.io | bash -s stable
```

### Install latest Ruby version

```shell
rvm install ruby-head
```

```shell
rvm --default use 2.4
```

```shell
gem install bundler
```

## rustup.rs

Install [rustup](https://www.rustup.rs/) the Rust toolchain installer.

```shell
curl https://sh.rustup.rs -sSf | sh
```

### Install Rust Nightly

```shell
rustup default nightly
```

## Preferences

### Show Library folder

```shell
chflags nohidden ~/Library
```

### Show hidden files

This can also be done by pressing `command` + `shift` + `.`.

```shell
defaults write com.apple.finder AppleShowAllFiles YES
```

### Show path bar

```shell
defaults write com.apple.finder ShowPathbar -bool true
```

### Show status bar

```shell
defaults write com.apple.finder ShowStatusBar -bool true
```
