function venv_token () {
	if [ -n "${PIPENV_ACTIVE}" ]; then
		REPLY="(`basename ${VIRTUAL_ENV%-*}`) "
    fi
}

function custom_time () {
	REPLY="[`date +'%H:%M:%S'`] "
}

grml_theme_add_token c_time -f custom_time '%B%F{white}' '%f%b'
grml_theme_add_token venv -f venv_token '%B%F{white}' '%f%b'
zstyle ':prompt:grml:left:setup' items c_time rc venv change-root user at \
								 host path vcs percent
