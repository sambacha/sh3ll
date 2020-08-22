#!/bin/bash


if type "osascript" >/dev/null 2>&1 ; then
	function alert() {
		osascript -e "display notification \"$2\" with title \"$1\"";
	}
elif type "notify-send" >/dev/null 2>&1 ; then
	alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

