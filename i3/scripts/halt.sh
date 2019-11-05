#!/bin/bash

sxlock --font '-bitstream-meslo lg s-medium-r-normal--0-0-0-0-m-0-iso8859-9' &
case $1 in
	hibernate)
		systemctl hibernate
		;;
	suspend)
		systemctl suspend
		;;
	lock)
		xset -display $DISPLAY dpms force off
		;;
	*)
		echo "$0 <hibernate|suspend|lock>"
		;;
esac




