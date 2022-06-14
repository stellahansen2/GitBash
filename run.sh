#version="$(cat )"
first="$(grep -i "version:" /Users/458537/Desktop/file.sh)"
second="$(grep -i "comment:" /Users/458537/Desktop/file.sh)"
third="$(grep -i "filename:" /Users/458537/Desktop/file.sh)"
version=$(echo $first | egrep -o '[0-9a-z]{40}')
#IN="$(grep -i -E "version:[0..9a..z]\{5,44}" /Users/458537/Desktop/file.sh)"
#version=$(echo "$IN" | cut -d ":" -f 2)
comment="$(echo $second | egrep -o "'.*'")"
updateComment="$(echo "$comment" | sed -e "s/^'//" -e "s/'$//")"
filename1="$(echo $third | egrep -o "'.*'")"
filename="$(echo "$filename1" | sed -e "s/^'//" -e "s/'$//")"
echo $filename
#filename="test"
git checkout "$version" -- "$filename"
git add .
git commit -m "$updateComment"
git push