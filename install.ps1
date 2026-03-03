$soundPath = Join-Path -Path $PSScriptRoot -ChildPath "assets\Sound.wav"

$triggerCode = @"

# --- START-ERROR-SOUND ---
`$ExecutionContext.InvokeCommand.CommandNotFoundAction = {
    param(`$commandName, `$commandLookupEventArgs)
    try {
        `$player = New-Object System.Media.SoundPlayer("$soundPath")
        `$player.Play()
    } catch {}
    Write-Error "The term '`$commandName' is not recognized."
    `$commandLookupEventArgs.StopSearch = `$true
}
# --- END-ERROR-SOUND ---
"@

if (!(Test-Path $PROFILE)) { New-Item -Path $PROFILE -Type File -Force }
Add-Content -Path $PROFILE -Value $triggerCode
Write-Host "Installed successfully! Restart Terminal to test." -ForegroundColor Green