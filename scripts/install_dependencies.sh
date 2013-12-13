echo 'Install Vundle'
mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle/
mkdir -p ~/.vim/colors/
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/colors/solarized/
echo 'Creating symlink to solarized file'
ln -s ~/.vim/colors/solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
