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
