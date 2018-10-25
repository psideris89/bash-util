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

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

####################
# Prompt command

# Prompt command
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\n\[\033[01;34m\][$?]\n\[\033[00m\]> '
