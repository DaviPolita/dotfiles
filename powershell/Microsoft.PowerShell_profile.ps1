oh-my-posh init pwsh --config "C:\Users\davipolita\Documents\PowerShell\.oh-my-posh.omp.json" | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

# set aliases 
Set-Alias -Name "vim" -Value "nvim"

Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
