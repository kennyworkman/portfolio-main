# Build
hugo

# Copy build files.
cd ../kennyworkman.github.io/
git pull
rm -rf ../kennyworkman.github.io/*
cp -r ../portfolio/public/* ../kennyworkman.github.io/
echo "kennethworkman.com" > CNAME

# Commit
git add .
git commit -m "Changes for $(date)"
git push

