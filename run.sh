#version="$(cat /Users/458537/Desktop/file.sh)"
first="$(grep -i "version:" file.sh)"
version=$(echo $first | egrep -o '[0-9a-z]{40}')
#IN="$(grep -i -E "version:[0..9a..z]\{5,44}" /Users/458537/Desktop/file.sh)"
filename="test"
git checkout "$version" -- "$filename"
git add .
git commit -m "updating test"
git push