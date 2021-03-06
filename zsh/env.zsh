PATH="${HOME}/bin:$PATH"

if isdarwin; then
	if [[ -n `which java` ]]; then
		export JAVA_HOME=`/usr/libexec/java_home -v 11`
	fi
fi

PATH=${HOME}/scripts:${PATH}
PATH=${HOME}/.cargo/bin:${PATH}

export PATH

export XDG_CONFIG_HOME="${HOME}/.config"

# Editor
function set_ed() {
	for ed in $*; do
		which $ed >/dev/null && EDITOR=$ed
	done
	export EDITOR
}

set_ed vi vim nvim

export LC_ALL=en_US.UTF-8

export PIPENV_DONT_LOAD_ENV=1
