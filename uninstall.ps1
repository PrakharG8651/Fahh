$profilePath = $PROFILE

if (Test-Path $profilePath) {
    $content = Get-Content $profilePath -Raw
    
    # Matches everything between the standardized markers
    $pattern = "(?s)# --- START-ERROR-SOUND ---.*?# --- END-ERROR-SOUND ---"
    
    if ($content -match $pattern) {
        $newContent = $content -replace $pattern, ""
        
        # This part is CRUCIAL: 
        # Since we modified the 'prompt' function, we need to tell 
        # PowerShell to go back to the default prompt if it's currently loaded.
        if (Test-Path function:\prompt) {
            Remove-Item function:\prompt -ErrorAction SilentlyContinue
        }

        # Clean up and save
        $newContent.Trim() | Set-Content $profilePath
        Write-Host "Uninstalled successfully! Restart your terminal to restore the default prompt." -ForegroundColor Cyan
    } else {
        Write-Host "Could not find the error sound code in your profile." -ForegroundColor Yellow
    }
} else {
    Write-Host "Profile file not found." -ForegroundColor Red
}