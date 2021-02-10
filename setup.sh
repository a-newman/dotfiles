echo "Downloading Vundle"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing tools for YCM"

sudo apt install build-essential cmake python3-dev
cd ~/.vim/bundle/youcompleteme
python3 install.py --ts-completer
