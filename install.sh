#!/bin/bash

ScriptPath=$(cd `dirname $0`; pwd)
cd "$(dirname "${BASH_SOURCE[0]}")"
echo "source $ScriptPath/bashrc" >> ~/.bashrc

rm -rf ~/.inputrc 
cp .inputrc ~
rm -rf ~/.tmux.conf 
cp .tmux.conf ~
rm -rf ~/.z.lua 
mkdir ~/.z.lua 
cp z.lua ~/.z.lua/z.lua


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

source ~/.bashrc

nvm install --lts
npm install -g bash-language-server
npm install -g vim-language-server
npm install -g vscode-json-languageservice
npm install -g vscode-langservers-extracted

pip install cmake-language-server

mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

curl -LsSf https://astral.sh/uv/install.sh | sh
curl -LsSf https://astral.sh/ty/install.sh | sh

# https://github.com/junegunn/fzf/releases/download/v0.70.0/fzf-0.70.0-linux_amd64.tar.gz
# https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/sharkdp/fd/releases/download/v10.4.2/fd-v10.4.2-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/dandavison/delta/releases/download/0.18.2/delta-0.18.2-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz

