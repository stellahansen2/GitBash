#version="$(cat )"
first="$(grep -i "version:" /Users/458537/Desktop/file.sh)"
second="$(grep -i "comment:" /Users/458537/Desktop/file.sh)"
third="$(grep -i "filename:" /Users/458537/Desktop/file.sh)"
version=$(echo $first | egrep -o '[0-9a-z]{40}')
#IN="$(grep -i -E "version:[0..9a..z]\{5,44}" /Users/458537/Desktop/file.sh)"
#version=$(echo "$IN" | cut -d ":" -f 2)
#comment=
filename=$(echo "$filename" | sed -e "s/^'//" -e "s/'$//")
git checkout "$version" -- "$filename"
git add .
git commit -m "$(echo $second | egrep -o "'.*'")"
git push