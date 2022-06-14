#version="$(cat )"
first="$(grep -i "version:" /Users/458537/Desktop/file.sh)"
version=$(echo $first | egrep -o '[0-9a-z]{40}')
#IN="$(grep -i -E "version:[0..9a..z]\{5,44}" /Users/458537/Desktop/file.sh)"
#version=$(echo "$IN" | cut -d ":" -f 2)
filename="test"
git checkout "$version" -- "$filename"
git add .
git commit -m "updating test"
git push