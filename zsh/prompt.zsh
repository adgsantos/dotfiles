# When using grml, this is needed to setup prompt statically.
prompt off

# dcat's prompt
_lprompt() {
	RET=$?
	case $RET in
		0|130)
			COL="$PROMPT_FG"
			;;
			127) # Command not found
			COL="$PROMPT_ERR_FG"
			;;
		*)
			COL="$PROMPT_FG"
			EXTRA="[${PROMPT_ERR_FG}${RET}${RESET_COLOR}] "
			;;
	esac

	P="${COL}──── ${RESET_COLOR} "

	echo -n "${EXTRA}${P}"
}

setopt PROMPT_SUBST
PROMPT="\$(_lprompt)"
RPROMPT='%~'
