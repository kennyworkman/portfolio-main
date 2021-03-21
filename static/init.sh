# This shell script should turn a lonely box into a home

git clone https://github.com/kennyworkman/dotfiles $HOME/myconf-tmp
cp -r $HOME/myconf-tmp/. $HOME
rm -rf $HOME/myconf-tmp
