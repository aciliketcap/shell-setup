mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vimrc
vim +PluginInstall +qall
echo "Open vim and type :PluginInstall if installation failes for some reason"
#YCM scripts usually mess up or has to be restarted due to some absent dependency
#this is really problematic everytime
#I have never seen using system libclang work btw
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
#get dependencies
sudo zypper install python-devel
./install.sh --clang-completer
