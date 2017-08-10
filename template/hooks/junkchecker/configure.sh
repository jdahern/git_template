#!/bin/bash
. .git/hooks/hook_switcher.sh

main() {
    if hook_is_enabled junkchecker
    then
	read -p "Regex to use for checking the message with. Default: \"$GIT_DIR/hooks/junkchecker/junk-phrases.sample\"? "
	if [ -z $REPLY ]; then
	    REPLY="$GIT_DIR/hooks/junkchecker/junk-phrases.sample"
	fi
	git config hooks.junkchecker.phrasesfile "$REPLY"
    fi
}

main
