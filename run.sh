version="$(cat /Users/458537/Desktop/file)"
echo "$version"
filename="test"
git checkout "$version" -- "$filename"
git add .
git commit -m "updating test"
git push