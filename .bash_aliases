####################
# Vim

# Function to create a file with x permission for the owner
function svim {
    if [ -f $1 ]; then
        echo "File already exists, change permissions manually"
        vim $1
    else
        touch $1 && chmod u+x $1
        vim $1
    fi
}

####################
# Git

# Function to checkout to branch and pull from remote
function gcp {
    if [ "$#" -ne 1 ]; then
        echo "Illegal number of parameters"
    else
        git checkout $1 && git pull origin $1
    fi
}

alias gpm='git checkout master && git pull'



####################
# Command prompt

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    local GIT_BRANCH=$(parse_git_branch)

    PS1=""

    local RCol='\[\e[0m\]'
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    PS1+="${Gre}\u${Gre}${Gre}@${Gre}\h${Red}:${BBlu}\w${Red}${GIT_BRANCH}\n${BBlu}${EXIT}${RCol} > "
}

# Alias
alias postman=/opt/Postman/app/Postman
alias ga="git add"
alias gaa="git add ."
alias gb="git branch"
alias gbd="git branch -d"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gl="git log"
alias gll="git log -1 HEAD"
alias gp="git pull"
alias gpm="git pull origin master"
alias gps="git push"
alias gs="git status"
alias gsh="git stash"

