## 0 - Install buil tools
`sudo apt install build-essential`

## 2 - Intall zsh
`sudo apt install zsh`
`chsh -s $(which zsh)`
restart the current shell

## 3 - Install powerlevel10k
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k`
`echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc`

## 4 - Install NeoVim
`wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb`
`sudo apt install ./nvim-linux64.deb`
 inside neovim
`PlugInstall`

## 5 - Install asdf
`git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2`

## 6 - Install tmux and tpm
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
inside tmux
`prefix + I`


## extra - Proxy setup
for WSL proxy setup, set the proxy variables inside /etc/profile.d/proxy.sh