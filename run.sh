#version="$(cat /Users/458537/Desktop/file.sh)"
IN="$(grep -i "version" /Users/458537/Desktop/file.sh)"
version=$(echo "$IN" | cut -d ":" -f 2)
filename="test"
git checkout "$version" -- "$filename"
git add .
git commit -m "updating test"
git push