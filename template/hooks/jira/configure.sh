#!/bin/bash
. .git/hooks/hook_switcher.sh

main() {
    if hook_is_enabled jira
    then
	read -p "Regex to use for checking the message with. Default: \"^(DEV-[0-9]+|merge)\"? "
	if [ -z $REPLY ]; then
	    REPLY="^(DEV-[0-9]+|merge)"
	fi
	git config --add hooks.jira.commitregex "$REPLY"
    fi
}

main
