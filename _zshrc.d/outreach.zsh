alias or="cd $OUTREACH_PROJECT_ROOT"

SOURCE_ROOT="$HOME/source"

function clone() {
    local ghRoot="$SOURCE_ROOT/github"
    local repo="$1"

    local targetDir="$ghRoot/$repo"
    if [ -d "$targetDir" ]; then
        echo "$targetDir already exists"
    else
        gh repo clone $repo $targetDir
    fi
}
