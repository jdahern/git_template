#!/bin/bash -u
# echo "  Commit Regex  :  $1"
# echo " Current Branch :  $2"
# echo "  Message File  :  $3"
# echo "........"

commit_regex=$1
current_branch=$2
message_file=$3

task_number=$(grep -ioE -m 1 "$commit_regex" "$message_file")
branch_number=$(grep -ioE -m 1 "$commit_regex" <<< $current_branch )
branch_number="${branch_number^^}"
if [ -z "$task_number" ]; then
    echo "Aborting commit. Your commit message is missing a JIRA Issue (regex:$commit_regex)" >&2
    exit 1
fi

# echo "JIRA task $task_number"
# echo "Branch task $branch_number"

if [ "$task_number" != "$branch_number" ]; then
    echo "Aborting commit. Your commit message is for task $task_number, but your the branch is $current_branch" >&2
    exit 1
fi







