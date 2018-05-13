# Function to create a file with x permission for the owner
function svim {
    if [ -f $1 ]; then
        echo "File already exists, aborting ..."
    else
        touch $1 && chmod u+x $1
        vim $1
    fi
}
