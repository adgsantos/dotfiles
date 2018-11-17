#!/bin/bash

# Find this scripts path
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd -P`
popd > /dev/null

# Just to avoid repeating a lot of stuff
# $1 - target, is used as ${SCRIPTPATH}/target
# $2 - filename, is used as ${HOME}/filename
makelink() {
	target=${SCRIPTPATH}/$1
	linkname=${HOME}/$2
	mkdir -p `dirname $linkname`
	if [[ -d "$linkname" ]]; then
		rm -vrf "$linkname"
	fi
	ln -vfsn "$target" "$linkname"
}

mkdir -p ~/.config

if [[ `uname` =~ 'Darwin' ]]; then
	makelink Spectacle        Library/Application\ Support/Spectacle
	for f in `ls ${SCRIPTPATH}/osx/preferences`; do
		makelink osx/preferences/$f Library/Preferences/$f
	done

	makelink osx/DefaultKeyBinding.dict Library/KeyBindings/DefaultKeyBinding.dict

	makelink karabiner .config/karabiner

else

	makelink bspwm            .config/bspwm
	makelink sxhkd            .config/sxhkd

	makelink i3               .config/i3
	makelink i3blocks         .config/i3blocks
	makelink feh              .config/feh
	makelink zathura          .config/zathura
	makelink cmus             .config/cmus
	makelink panel            .config/panel
	makelink systemd          .config/systemd
	makelink acpi             .config/acpi
	makelink mpd              .config/mpd
	makelink ncmpcpp          .config/ncmpcpp
	makelink rofi             .config/rofi
	makelink dunst            .config/dunst
	makelink zenbu            .config/zenbu
	makelink polybar          .config/polybar

	makelink newsbeuter       .newsbeuter

	makelink mutt             .mutt
	makelink mutt/muttrc      .muttrc

	makelink msmtp            .msmtp
	makelink msmtp/msmtprc    .msmtprc

	makelink X/xinitrc        .xinitrc
	makelink X/xprofile       .xprofile
	makelink X/xsession       .xsession
	makelink X/Xmodmap        .Xmodmap

	makelink ctags/ctags.conf .ctags

	makelink X/Xresources.d             .Xresources.d
	makelink X/Xresources.d/Xresources  .Xresources

	makelink offlineimap                .offlineimap
	makelink offlineimap/offlineimaprc  .offlineimaprc
	makelink offlineimap/offlineimap.py .offlineimap.py

	makelink mpd-notification/mpdnrc    .config/mpd-notification.conf
fi

# Common
makelink git/gitconfig    .gitconfig
makelink git/gitignore    .gitignore

makelink hg/hgrc          .hgrc
makelink hg/hgignore      .hgignore

makelink idea             .idea
makelink idea/ideavimrc   .ideavimrc

makelink zsh              .zsh
makelink zsh/zshrc        .zshrc
makelink zsh/zprofile     .zprofile

makelink wallpapers       .wallpapers

makelink alacritty        .config/alacritty

makelink tmux             .tmux
makelink tmux/tmux.conf   .tmux.conf

makelink vim                       .config/nvim
makelink vim       				   .vim
makelink vim/vimrc 				   .vimrc
makelink vim/vimrc 				   .config/nvim/init.vim
makelink vim/.ycm_extra_conf.py    .ycm_extra_conf.py

makelink pentadactyl               .pentadactyl
makelink pentadactyl/pentadactylrc .pentadactylrc

makelink vimperator                .vimperator
makelink vimperator/vimperatorrc   .vimperatorrc

makelink jupyter/custom            .jupyter/custom

