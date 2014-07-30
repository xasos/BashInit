#!/bin/bash

#gets our user values and working directory
directory=${PWD##*/}
gitUser=$(git config github.user)

read "repo?New git repo name (enter for ${PWD##*/}):"
read "user?GitHub username (enter for ${gitUser}):"
read "descript?Repo Description:"

curl -u ${user:-${gitUser}} https://api.github.com/user/repos -d "{\"name\": \"${repo:-${directory}}\", \"description\": \"${descript}\", \"private\": false, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"
