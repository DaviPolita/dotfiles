## Symlink

ln -s $HOME/.dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
ln -s -r $HOME/.dotfiles/nvim/lua $HOME/.config/nvim/lua
ln -s -r $HOME/.dotfiles/nvim/after $HOME/.config/nvim/after 


New-Item -ItemType SymbolicLink -Path "$HOME/.config/nvim/init.lua" -Target "$HOME/.dotfiles/nvim/init.lua"
New-Item -ItemType SymbolicLink -Path "$HOME/.config/nvim/vscode.lua" -Target "$HOME/.dotfiles/nvim/vscode.lua"
New-Item -ItemType SymbolicLink -Path "$HOME/.config/nvim/lua" -Target "$HOME/.dotfiles/nvim/lua"
New-Item -ItemType SymbolicLink -Path "$HOME/.config/nvim/after" -Target "$HOME/.dotfiles/nvim/after"