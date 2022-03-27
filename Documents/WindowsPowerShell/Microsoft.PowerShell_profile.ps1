Import-Module posh-git
Import-Module oh-my-posh

# PSReadLine
Set-PSREadLineOption -PredictionSource None

# Terminal-Icons
Import-Module Terminal-Icons

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordeverseHistory 'Ctrl+r'

# Set theme
Set-PoshPrompt -Theme amro
#Set-PoshPrompt -Theme $HOME/.config/powershell/.oh-my-posh.omp.json

# Load prompt configs
#oh-my-posh --init --shell pwsh --config 'C:\Users\Davi\.config\powershell\ompTheme.omp.json' | Invoke-Expression

# Alias (Optional)
Set-Alias vim nvim
Set-Alias cz chezmoi
Set-Alias g git
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Ultilities (Optional)
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function czcd {
    cd $(chezmoi source-path)
}
