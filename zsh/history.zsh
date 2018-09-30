HISTSIZE=10000
SAVEHIST=8000
HISTFILE=${ZDOTDIR:-${HOME}}/.zsh_history
HIST_STAMPS="dd.mm.yyyy"

case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac


