#!/bin/bash

# Find this scripts path
pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

if [[ `uname -s` == 'Darwin' ]]; then

	# Install brew
	if [[ -z `which brew` ]]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	brew cask install `cat ${DIR}/casks.txt`

	brew install `cat ${DIR}/formulae.txt`

	npm install -g peerflix
	pip install `cat ${DIR}/pip.txt`
	pip install --upgrade pip

	$(brew --prefix)/opt/fzf/install --all --no-fish
else
	yaourt -S --noconfirm --needed - < ${DIR}/package.txt
fi
