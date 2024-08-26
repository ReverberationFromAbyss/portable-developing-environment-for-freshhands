. lib\base.ps1

echo $profile
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}

.\PKGs\Store\Shells\PowerShell-7.4.4-win-x64\pwsh.exe -ExecutionPolicy Bypass -NoProfile -NoExit -Command "Invoke-Expression 'Import-Module "$env:HOME\.config\pwsh\profile.ps1"'"
