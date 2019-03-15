#sudo pacman -S --needed vim python2 #for Arch, TODO: change to python 3
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vimrc
vim +PluginInstall +qall
echo "Open vim and type :PluginInstall if installation failed for some reason"
#YCM scripts usually mess up or has to be restarted due to some absent dependency
#this is really problematic everytime
#I have never seen using system libclang work btw
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
#get dependencies
#you also need ncurses5
#if your distro uses ncurses6 you need compat lib
#it is ncurses-compat-libs in AUR for Arch
sudo pacman -S cmake
./install.py --clang-completer
