#!/bin/sh

if [ -z "$1" ]
then
    echo "Missing branch name argument"
    exit 1
fi

if [ -z "$2" ]
then
    echo "Missing soak time argument (in seconds)"
    exit 1
fi

branch=$1
soak_period=$2

last_date=$(curl -s "https://api.github.com/repos/$GITHUB_REPOSITORY/actions/runs?status=success&branch=$branch" \
    | jq .workflow_runs[].updated_at \
    | sort -r \
    | head -n 1 \
    | sed 's/T/ /g; s/Z//g; s/"//g;')

now=$(date +%s)
last=$(date --date="$last_date" +%s)

diff=`expr $now - $last`

if [ "$diff" -ge "$soak_period" ]
then
    echo "Soaked and good to go!"
    exit 0
else
    echo "Not ready, soak time has not been met"
    exit 1
fi
