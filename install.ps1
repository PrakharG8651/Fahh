$soundPath = Join-Path -Path $PSScriptRoot -ChildPath "assets\Sound.wav"

$triggerCode = @"

# --- START-ERROR-SOUND ---
function prompt {
    # Check if the last command failed
    if (`$global:? -eq `$false) {
        try {
            `$player = New-Object System.Media.SoundPlayer("$soundPath")
            `$player.Play()
            Write-Host "[Sound Triggered]" -ForegroundColor DarkGray
        } catch {
            Write-Warning "Could not play sound: `$($_.Exception.Message)"
        }
    }
    # Standard PowerShell prompt style
    "PS `$(`$executionContext.SessionState.Path.CurrentLocation)> "
}

`$ExecutionContext.InvokeCommand.CommandNotFoundAction = {
    param(`$commandName, `$commandLookupEventArgs)
    Write-Error "The term '`$commandName' is not recognized."
    `$commandLookupEventArgs.StopSearch = `$true
}
# --- END-ERROR-SOUND ---
"@

if (!(Test-Path $PROFILE)) { New-Item -Path $PROFILE -Type File -Force }
# Overwrite to avoid multiple copies
Set-Content -Path $PROFILE -Value $triggerCode 
Write-Host "Installation successful! Please RESTART your terminal." -ForegroundColor Green