#!/bin/bash

if [[ -z "$*" ]]; then
	bash -c 'compgen -c' | grep '[[:alpha:]]' | sort
else
	st -e $* >/dev/null &
fi
