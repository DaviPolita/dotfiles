## Symlink Windows
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$HOME/.dotfiles/PowerShell/Microsoft.PowerShell_profile.ps1"

New-Item -ItemType SymbolicLink -Path "$HOME\Documents\PowerShell\.oh-my-posh.omp.json" -Target "$HOME/.dotfiles/PowerShell/.oh-my-posh.omp.json"