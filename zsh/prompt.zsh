function venv_token () {
	if [ -n "${PIPENV_ACTIVE}" ]; then
		REPLY="(`basename ${VIRTUAL_ENV%-*}`) "
    fi
}

function conda_prompt () {
    if [ -n "${CONDA_DEFAULT_ENV+1}" ]; then
        REPLY=${CONDA_DEFAULT_ENV+(${CONDA_DEFAULT_ENV:t}) }
    elif [ -n "${CONDA_ON+1}" ]; then
        REPLY="(miniconda) "
    fi
}

function poetry_env() {
	if [ -n "${POETRY_ACTIVE}" ]; then
		REPLY="(`basename ${VIRTUAL_ENV%-*}`) "
    fi
}

function custom_time () {
	REPLY="[`date +'%H:%M:%S'`] "
}

function newline() {
    REPLY="$prompt_newline"
}

grml_theme_add_token c_time -f custom_time '%B%F{white}' '%f%b'
grml_theme_add_token venv -f venv_token '%B%F{white}' '%f%b'
grml_theme_add_token conda -f conda_prompt '%B%F{white}' '%f%b'
grml_theme_add_token poetry -f poetry_env '%B%F{white}' '%f%b'
zstyle ':prompt:grml:left:setup' items c_time rc change-root user at \
								 host path vcs newline venv conda poetry percent
