# https://gist.github.com/Cadair/78da7930c6dafeb1003a
# Anaconda
function conda_prompt () {
    if [ -n "${CONDA_DEFAULT_ENV+1}" ]; then
        REPLY=${CONDA_DEFAULT_ENV+(${CONDA_DEFAULT_ENV:t}) }
    elif [ -n "${CONDA_ON+1}" ]; then
        REPLY="(miniconda) "
    fi
}
grml_theme_add_token conda -f conda_prompt '%B%F{white}' '%f%b'
zstyle ':prompt:grml:left:setup' items rc conda virtual-env change-root \
                                               user at host path vcs percent
