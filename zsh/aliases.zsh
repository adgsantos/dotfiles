alias rmd='rm -d'
alias md='mkdir -p'

[[ -x `which ipython` ]] && alias ipy=ipython
[[ -x `which python` ]] && alias py=python

# Changing/making/removing directory
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

if [[ -x `which tree` ]]; then
  for (( i = 1; i<=6; i++)); do
    alias t$i="tree --dirsfirst -ChFaL $i"
    alias tl$i="tree --dirsfirst -ChFL $i"
    alias ta$i="tree --dirsfirst -ChFupDaL $i"
  done
  # Note, these alias are defined from the ones above.
  # Use with caution
  alias t='t1'
  alias tl='tl1'
  alias ta='ta1'
fi

# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'
alias d='dirs -v | head -10'

# alias for ctags
[[ -x `which ctags` ]] && alias myctags='ctags --fields=+l'

# Fast editing

# Check external ip
alias external_ip='wget -qO- http://ipecho.net/plain ; echo'

# Alias for less
alias less='less --ignore-case --LONG-PROMPT --underline-special --SILENT'

# Enhanced file renaming
autoload -U zmv
alias zmv='zmv -W'

# Faster
alias e=$EDITOR
alias vim=$EDITOR

# Virtual environments
alias so='source'

# Grep aliases

# ignore VCS folders (if the necessary grep flags are available)
VCS_FOLDERS="{.bzr,CVS,.git,.hg,.svn}"

grep-flag-available() {
grep $1 -q "a" <<< "a" >/dev/null 2>&1
}

grep-flag-available --exclude=$VCS_FOLDERS && grep_options+=( --exclude=$VCS_FOLDERS )
grep-flag-available --exclude-dir=$VCS_FOLDERS && grep_options+=( --exclude-dir=$VCS_FOLDERS )

if (( $#grep_options > 0 )); then
    o=${grep_options:+"${grep_options[*]}"}
	# Additional flags:
	# I - ignore binary files
	# n - line number
	o='-I -n '$o
    alias grep='grep '$o
    alias egrep='egrep '$o
    unset o
fi

if [[ `uname -s` == 'Darwin' ]]; then
	alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'


	function o() {
		if [ -z $1 ]; then
			open .
		else
			open $*
		fi
		return $?
	}
fi

# Clean up
unset VCS_FOLDERS
unfunction grep-flag-available

# Jumps to repo root
alias gr='git rev-parse --show-toplevel > /dev/null && cd $(git rev-parse --show-toplevel)'

alias pre="pipenv run $EDITOR"

alias tmux='TERM=screen-256color tmux -2'
alias ssh='TERM=linux ssh'

alias dc='docker-compose'

