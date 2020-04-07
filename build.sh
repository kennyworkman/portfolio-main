hugo
rm -rf ../kennyworkman.github.io/*
cp public/* ../kennyworkman.github.io/
cd ../kennyworkman.github.io/
echo "kennethworkman.com" > CNAME
git add .
git commit -m "Changes for $(printf -v date '%(%Y-%m-%d)T\n' -1)"
git push

