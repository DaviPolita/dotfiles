## 1 - Intall zsh
`sudo apt install zsh`
`chsh -s $(which zsh)`
restart the current shell

## 2 - Install powerlevel10k
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k`

## 3 - Setup gitstatus intall
`download the repo to the ~/.cache/gistatus folder` 
`edit the install script with following line`
`local url1="file:///home/davi/.cache/gitstatus/gitstatusd-linux-x86_64.tar.gz"`
