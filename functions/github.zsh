# Opens the github page for the current git repository in your browser
# git@github.com:jasonneylon/dotfiles.git
# https://github.com/jasonneylon/dotfiles/

function gh() {

git rev-parse 2>/dev/null

if [[ $? != 0 ]]
then
    echo "Not a git repository."
    exit 1
fi

remote="origin"
if [ ! -z "$1" ]
then
    remote="$1"
fi

remote_url="remote.${remote}.url"

giturl=$(git config --get $remote_url)
if [ -z "$giturl" ]
then
    echo "$remote_url not set."
    exit 1
fi

giturl=${giturl/git\@github\.com\:/https://github.com/}
giturl=${giturl%\.git}

if [ -z "$2" ]
then
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
else
    branch="$2"
fi

if [ ! -z "$branch" ]
then
    giturl="${giturl}/tree/${branch}"
fi

open $giturl


}
