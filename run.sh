readVersion="$(grep -i "version:" /Users/458537/Desktop/file.sh)"
readComment="$(grep -i "comment:" /Users/458537/Desktop/file.sh)"
readFilename="$(grep -i "filename:" /Users/458537/Desktop/file.sh)"

version=$(echo $readVersion | egrep -o '[0-9a-z]{40}')
comment="$(echo $readComment | egrep -o "'.*'")"
updatedComment="$(echo "$comment" | sed -e "s/^'//" -e "s/'$//")"
filename="$(echo $readFilename | egrep -o "'.*'")"
updatedFilename="$(echo "$filename" | sed -e "s/^'//" -e "s/'$//")"
git checkout "$version" -- "updatedFilename"
git add .
git commit -m "$updatedComment"
git push

# EXTRA CODE:
#IN="$(grep -i -E "version:[0..9a..z]\{5,44}" /Users/458537/Desktop/file.sh)"
#version=$(echo "$IN" | cut -d ":" -f 2)