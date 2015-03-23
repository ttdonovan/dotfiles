#!/usr/bin/env bash

set -e

GIT_URL="git@github.com:ttdonovan/dotfiles"
INSTALL_DIR="$HOME/.dotfiles"

function usage() {
  echo "$0 [options]"
  echo
  echo " -n       Do not run any git actions"
  echo " -h       This help message"
  exit 0
}

while getopts "nh" opt; do
  case $opt in
    n) RUN_GIT='no';;
    h) usage;;
  esac
done

# does ~/.dotfiles exist? If not, this must be a first install.
# skip all git actions if '-n' argument is specified
if [ "$RUN_GIT" != 'no' ]; then
  if [ ! -e "$HOME/.dotfiles" ]; then
    git clone $GIT_URL $INSTALL_DIR
    cd $INSTALL_DIR
  else
    cd $INSTALL_DIR
    if ! git diff-index --quiet HEAD --; then
      echo 'WARNING: There are uncommitted local changes'
    fi
      git fetch
      git pull
    fi
else
  echo "Skipping git actions"
fi

# symlink any files matching ~/.dotfiles/_<NAME> to ~/.<NAME>
for i in _*; do 
  source="${PWD}/$i"
  target="${HOME}/${i/_/.}"

  if [ -e "${target}" -a ! -h ${target} ]; then
    backup="${HOME}/.save.${i}"
    echo "${target} already exists. Moving to ${backup}"
    mv ${target} ${backup}
  fi

  echo "symlinking ${source} to ${target}"
  ln -snf ${source} ${target}
done
