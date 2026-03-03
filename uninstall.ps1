$profilePath = $PROFILE

if (Test-Path $profilePath) {
    $content = Get-Content $profilePath -Raw
    
    # Matches everything between the standardized markers
    $pattern = "(?s)# --- START-ERROR-SOUND ---.*?# --- END-ERROR-SOUND ---"
    
    if ($content -match $pattern) {
        $newContent = $content -replace $pattern, ""
        # Clean up extra whitespace and save
        $newContent.Trim() | Set-Content $profilePath
        Write-Host "Uninstalled successfully! Restart your terminal to apply changes." -ForegroundColor Cyan
    } else {
        Write-Host "Could not find the error sound code in your profile." -ForegroundColor Yellow
    }
} else {
    Write-Host "Profile file not found." -ForegroundColor Red
}