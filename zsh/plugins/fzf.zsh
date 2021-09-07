bindkey "^O" fzf-cd-widget

export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude tmp'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

export FZF_DEFAULT_OPTS="
--height 20%
--reverse
--color dark
--color bg+:#1f1f1f
--color hl:#7b8748
--color hl+:#7b8748
--color prompt:240
--color pointer:#775759
--bind tab:down,shift-tab:up,ctrl-j:toggle+down,ctrl-k:toggle+up,ctrl-z:toggle-up
--history=$HOME/.cache/fzf_history
"
