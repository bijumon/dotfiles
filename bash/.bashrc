#
# ~/.bashrc
#

[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR="emacsclient -t"

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

# complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# taskwarrior custom setup and aliases
TASKDATA=~/.local/share/taskwarrior
TASKRC=~/.config/taskwarrior/taskrc
alias t=task

export PROMPT_COMMAND TASKRC TASKDATA

DIRECTORY="\w"
DOUBLE_SPACE="  "
NEWLINE="\n"
NO_COLOUR="\e[00m"
PRINTING_OFF="\["
PRINTING_ON="\]"
PROMPT_COLOUR="\e[0;33m"
PS1_PROMPT=" >"
PS2_PROMPT=" >> "
RESTORE_CURSOR_POSITION="\e[u"
SAVE_CURSOR_POSITION="\e[s"
SINGLE_SPACE=" "
TIMESTAMP="\A"
TIMESTAMP_PLACEHOLDER="--:--"

move_cursor_to_start_of_ps1() {
    command_rows=$(history 1 | wc -l)
    if [ "$command_rows" -gt 1 ]; then
        let vertical_movement=$command_rows+1
    else
        command=$(history 1 | sed 's/^\s*[0-9]*\s*//')
        command_length=${#command}
        ps1_prompt_length=${#PS1_PROMPT}
        let total_length=$command_length+$ps1_prompt_length
        let lines=$total_length/${COLUMNS}+1
        let vertical_movement=$lines+1
    fi
    tput cuu $vertical_movement
}

PS0_ELEMENTS=(
    "$SAVE_CURSOR_POSITION" "\$(move_cursor_to_start_of_ps1)"
    "$PROMPT_COLOUR" "$TIMESTAMP" "$NO_COLOUR" "$RESTORE_CURSOR_POSITION"
)
PS0=$(IFS=; echo "${PS0_ELEMENTS[*]}")

PS1_ELEMENTS=(
    # Empty line after last command.
    "$NEWLINE"
    # First line of prompt.
    "$PRINTING_OFF" "$PROMPT_COLOUR" "$PRINTING_ON"
    "$TIMESTAMP_PLACEHOLDER" "$DOUBLE_SPACE" "$DIRECTORY" "$PRINTING_OFF"
    "$NO_COLOUR" "$PRINTING_ON" "$NEWLINE"
    # Second line of prompt.
    "$PRINTING_OFF" "$PROMPT_COLOUR" "$PRINTING_ON" "$PS1_PROMPT"
    "$SINGLE_SPACE" "$PRINTING_OFF" "$NO_COLOUR" "$PRINTING_ON"
)
PS1=$(IFS=; echo "${PS1_ELEMENTS[*]}")

PS2_ELEMENTS=(
    "$PRINTING_OFF" "$PROMPT_COLOUR" "$PRINTING_ON" "$PS2_PROMPT"
    "$SINGLE_SPACE" "$PRINTING_OFF" "$NO_COLOUR" "$PRINTING_ON"
)
PS2=$(IFS=; echo "${PS2_ELEMENTS[*]}")

shopt -s histverify
