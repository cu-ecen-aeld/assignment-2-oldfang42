#!/bin/bash

# Check whether the number of arguments is correct
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

# Arguments variables
writefile="$1"	#full path to a file, $1 means script receive the first paramete
writestr="$2"	#text string that will be written within the file

# Check whether writefile argument is specified, if it's null than echo error
if [ -z "$writefile" ]; then
    echo "Error: File path is not specified." >&2
    exit 1
fi

# Check whether writestr argument is specified, if it's null than echo error
if [ -z "$writestr" ]; then
    echo "Error: Text string is not specified." >&2
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the text within the file
echo "$writestr" > "$writefile"

# Check whether the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the file."
    exit 1
fi
