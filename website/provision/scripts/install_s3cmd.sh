#!/bin/bash

CURRENT_DIRECTORY=$(pwd)

# ---

which brew
if [ ! $? -eq 0 ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# ---

brew ls s3cmd
if [ ! $? -eq 0 ]; then
  brew install -y s3cmd
fi

# ---

if [ -e "$HOME/.s3cfg" ] | [ -L "$HOME/.s3cfg" ]
then
  mv "$HOME/.s3cfg" "$HOME/.s3cfg-old"
fi

ln -s "$CURRENT_DIRECTORY/.s3cfg" "$HOME/.s3cfg"
