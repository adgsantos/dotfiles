PATH="${HOME}/bin:$PATH"

if isdarwin; then
	PATH=/usr/local/miniconda3/bin:"$PATH"
	export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
 else
	PATH=${HOME}/bin/miniconda3/bin:${PATH}
fi

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

