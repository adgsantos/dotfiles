#!/bin/bash

# Find this scripts path
pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

if [[ `uname -s` == 'Darwin' ]]; then

	# TODO:
	# Call install.sh
	# osx.sh
	# zsh, etc etc

	# Install brew
	if [[ -z `which brew` ]]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	brew tap homebrew/cask-fonts
	brew cask install `cat ${DIR}/casks.txt`

	brew install `cat ${DIR}/formulae.txt`

	npm install -g peerflix
	pip install `cat ${DIR}/pip.txt`
	pip install --upgrade pip

	$(brew --prefix)/opt/fzf/install --all --no-fish
else
	if [[ -z `which yay` ]]; then
		git clone https://aur.archlinux.org/yay.git /tmp/yay
		cur=`pwd`
		cd /tmp/yay
		makepkg -si
		cd $cur
	fi

	yay -S --noconfirm --needed - < ${DIR}/packages.txt
	yay -S --noconfirm nvidia-beta

	systemctl enable --now docker
	sudo usermod -aG docker $USER
	echo "All done, please restart your computer"
fi
