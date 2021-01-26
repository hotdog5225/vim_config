#! /bin/bash
cp ~/.config/nvim/init.vim ./nvim/
cp ~/.ideavimrc ./
sed -i '' '39,$d' .vimrc
sed -i '' '$r ./nvim/init.vim' .vimrc

cp .vimrc ~/
