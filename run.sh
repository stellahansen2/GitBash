version='cat version'
filename="test"
git checkout "$version" -- "$filename"
git add .
git commit -m "updating test"
git push