mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
#setup xsel or xclip, required for tmux-yank
sudo zypeer install xclip
#sudo apt install xclip
cp tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
echo "If an error occurs open tmux and press 'Prefix + I' to install remaining plugins!"
