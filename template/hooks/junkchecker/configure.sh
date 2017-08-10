#!/bin/bash
. .git/hooks/hook_switcher.sh

main() {
    if hook_is_enabled junkchecker
    then
	read -p "File name that contains one forbidden phrase per line. Default: \".git/hooks/junkchecker/junk-phrases.sample\"? "
	if [ -z $REPLY ]; then
	    REPLY=".git/hooks/junkchecker/junk-phrases.sample"
	fi
	git config hooks.junkchecker.phrasesfile "$REPLY"
    fi
}

main
