#!/bin/bash
# Check the correctness of #arguments
if [ $# -ne 2 ]; then
    echo "Error: Please provide two arguments - filesdir and searchstr" >&2
    exit 1
fi

# Arguments variables
filesdir="$1"   #path to a directory, $1 means script receive the first parameter
searchstr="$2"  #text string that will be searched within the file

# Check whether filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory" >&2
    exit 1

else 
    # Find files matching searchstr recursively in filesdir
    matching_files=$(grep -r "$searchstr" "$filesdir")

    # Count the number of files and matching lines
    file_count=$(echo "$matching_files" | wc -l)
    line_count=$(echo "$matching_files" | grep -c "$searchstr")
fi

# Print the results
echo "The number of files are $file_count and the number of matching lines are $line_count"
