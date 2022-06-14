cd /Users/458537/GitHub/GitBash
#reads from our file of information the version number, what the
    #comment should be, and what filename we are looking for in the
    #repository
readVersion="$(grep -i "version:" /Users/458537/Desktop/file.sh)"
readComment="$(grep -i "comment:" /Users/458537/Desktop/file.sh)"
readFilename="$(grep -i "filename:" /Users/458537/Desktop/file.sh)"

#use regex to seperate the the 40 digit version number, the comment
    #in single quotes, and the filename in single quotes
version=$(echo $readVersion | egrep -o '[0-9a-z]{40}')
comment="$(echo $readComment | egrep -o "'.*'")"
filename="$(echo $readFilename | egrep -o "'.*'")"

#updates the comment and filename so they are in appropriate 
    #format with double quotes
updatedComment="$(echo "$comment" | sed -e "s/^'//" -e "s/'$//")"
updatedFilename="$(echo "$filename" | sed -e "s/^'//" -e "s/'$//")"

#makes all the git calls: finds the specified version from the file
    #and the file we want to update, then commits/pushes changes
git checkout "$version" -- "$updatedFilename"
git add .
git commit -m "$updatedComment"
git push


# EXTRA CODE:
#IN="$(grep -i -E "version:[0..9a..z]\{5,44}" /Users/458537/Desktop/file.sh)"
#version=$(echo "$IN" | cut -d ":" -f 2)