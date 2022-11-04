alias_value() {
	alias "$1" | sed "s/^$1='\(.*\)'$/\1/"
	test $(alias "$1")
}

# Creates temporary directory and cd's into it
mktcd() {
	builtin cd "$(mktemp -d)"
	builtin pwd
}

# List all occurrences of programm in current PATH
plap() {
	emulate -L zsh
	if [[ $# = 0 ]] ; then
		echo "Usage:    $0 program"
		echo "Example:  $0 zsh"
		echo "Lists all occurrences of program in the current PATH."
	else
		ls -l ${^path}/*$1*(*N)
	fi
}

# Find out which libs define a symbol
lcheck() {
	if [[ -n "$1" ]] ; then
		nm -go /usr/lib/lib*.a 2>/dev/null | grep ":[[:xdigit:]]\{8\} . .*$1"
	else
		echo "Usage: lcheck <function>" >&2
	fi
}

# print hex value of a number
hex() {
	emulate -L zsh
	if [[ -n "$1" ]]; then
		printf "%x\n" $1
	else
		print 'Usage: hex <number-to-convert>'
		return 1
	fi
}

# grep for running process, like: 'any vim'
any() {
	emulate -L zsh
	unsetopt KSH_ARRAYS
	if [[ -z "$1" ]] ; then
		echo "any - grep for process(es) by keyword" >&2
		echo "Usage: any <keyword>" >&2 ; return 1
	else
		ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
	fi
}

# This is a general-purpose function to ask Yes/No questions in Bash, either
# with or without a default answer. It keeps repeating the question until it
# gets a valid answer.
ask() {
	# http://djm.me/ask
	while true; do
		if [ "${2:-}" = "Y" ]; then
			prompt="Y/n"
			default=Y
		elif [ "${2:-}" = "N" ]; then
			prompt="y/N"
			default=N
		else
			prompt="y/n"
			default=
		fi
		# Ask the question (not using "read -p" as it uses stderr not stdout)
		echo -n "$1 [$prompt] "
		# Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
		read REPLY </dev/tty
		# Default?
		if [ -z "$REPLY" ]; then
			REPLY=$default
		fi
		# Check if the reply is valid
		case "$REPLY" in
			Y*|y*) return 0 ;;
			N*|n*) return 1 ;;
		esac
	done
}

function wr () {
	exec "$*" >/dev/null 2>&1 &
}

function envup() {
  local file=$([ -z "$1" ] && echo ".env" || echo ".env.$1")

  if [ -f $file ]; then
    set -a
    source $file
    set +a
  else
    echo "No $file file found" 1>&2
    return 1
  fi
}

function envsup() {
    envup
    for t in "$@"; do
        envup $t
    done
}
