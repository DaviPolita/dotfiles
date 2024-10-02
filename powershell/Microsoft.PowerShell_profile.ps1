oh-my-posh init pwsh --config "C:\Users\davipolita\Documents\PowerShell\.oh-my-posh.omp.json" | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

# set aliases 
Set-Alias -Name "vim" -Value "nvim"

Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord


function Get-ExecutablePath {
    param (
        [string]$ExecutableName
    )

    # Get the PATH environment variable and split it into individual paths
    $paths = $env:PATH -split ";"

    # Loop through each path and check if the executable exists
    foreach ($path in $paths) {
        $fullPath = Join-Path -Path $path -ChildPath $ExecutableName

        # Check for the executable with common extensions in Windows
        if (Test-Path $fullPath) {
            return $fullPath
        }
        foreach ($ext in $env:PATHEXT -split ";") {
            $fullPathWithExt = "$fullPath$ext"
            if (Test-Path $fullPathWithExt) {
                return $fullPathWithExt
            }
        }
    }

    # If not found, return null
    return $null
}

# Create an alias for the function
Set-Alias which Get-ExecutablePath
