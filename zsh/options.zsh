#
# This file is about setting/choosing the options that there are available in zsh
#

#########
#########   Changing Directories
#########
setopt auto_cd                  # if a command can't be executed as a normal command
                                # perform the cd command on that.

setopt auto_pushd               # every directory visited goes to the stack

setopt cdablevars               # tries to expand ~ when the last is followed by
                                # something other than a backslash

setopt pushd_ignore_dups        # ignore duplicates

setopt pushdminus               # Change the meaning of ~+ and ~- and makes the
                                # command followable by number, that is,
                                # ~N takes us to directory X, which is on the N
                                # the position on the stack

##########
##########   History
##########

# append history list to the history file; this is the default but we make sure
# because it's required for share_history.
setopt append_history

# import new commands from the history file also in other zsh-session
setopt share_history

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list
setopt histignorealldups

# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace


##########
##########   Completion
##########
setopt always_to_end           # move cursor to the end of the word on a successful
                               # completion

unsetopt menu_complete         # do not autoselect the first completion entry
                               # [required for the below to work -- mutex]

setopt auto_menu               # uses menu completion after the second consecutive
                               # request for completion

setopt auto_list               # automatically list choices on ambiguous completion

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# not just at the end
setopt completeinword

# Don't send SIGHUP to background processes when the shell exits.
setopt nohup

# No beep
setopt nobeep




##########
##########   Expansion and Globbing
##########
# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob           # treat #, ^ and ~ for filename generation

# * shouldn't match dotfiles. ever.
setopt noglobdots


##########
##########   Input/Output
##########
setopt correct                 # tries to correct spelling of commands

unsetopt multios               # perform cat and tees as necessary. I'll perform
                               # by myself how many redirections are necessary

setopt interactivecomments     # recognize comments even in interactive shells

##########
##########   Prompting
##########
setopt prompt_subst            # parameter expansion, command substitution and
                               # arithmetic expansion are performed on prompts

##########
##########   Scripts and Functions
##########
unsetopt shwordsplit           # split whenever I want to split

setopt no_beep                 # annoying beep on error in zle

##########
##########   Processes
##########
# display PID when suspending processes as well
setopt longlistjobs

# report the status of backgrounds jobs immediately
setopt notify

# alert me if something failed
setopt printexitvalue

# don't error out when unset parameters are used
setopt unset
