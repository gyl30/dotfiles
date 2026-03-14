#!/bin/bash

rm -rf ~/.inputrc 
cp .inputrc ~
rm -rf ~/.tmux.conf 
cp .tmux.conf ~
rm -rf ~/.z.lua 
mkdir ~/.z.lua 
cp z.lua ~/.z.lua/z.lua


# https://github.com/junegunn/fzf/releases/download/v0.70.0/fzf-0.70.0-linux_amd64.tar.gz
# https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/sharkdp/fd/releases/download/v10.4.2/fd-v10.4.2-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/dandavison/delta/releases/download/0.18.2/delta-0.18.2-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-aarch64-unknown-linux-gnu.tar.gz
# https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
