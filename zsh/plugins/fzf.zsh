bindkey "^O" fzf-cd-widget

export FZF_DEFAULT_OPTS='
--reverse
--color dark
--color bg+:#1f1f1f
--color hl:#7b8748
--color hl+:#7b8748
--color prompt:240
--color pointer:#775759
--bind tab:down,shift-tab:up,ctrl-j:toggle+down,ctrl-k:toggle+up,ctrl-z:toggle-up
'
