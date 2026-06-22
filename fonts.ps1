$zipUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
$zipPath = "$env:TEMP\JetBrainsMono.zip"
$extractTemp = "$env:TEMP\JetBrainsMono"
$fontsDir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"

Write-Host "Downloading JetBrains Mono Nerd Font..."
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

Write-Host "Extracting..."
Expand-Archive -Path $zipPath -DestinationPath $extractTemp -Force

New-Item -ItemType Directory -Force -Path $fontsDir | Out-Null

Write-Host "Installing fonts..."
Get-ChildItem "$extractTemp\*.ttf" | ForEach-Object {
    Copy-Item $_.FullName $fontsDir -Force
    New-ItemProperty -Path $registryPath -Name $_.Name -Value "$fontsDir\$($_.Name)" -Force | Out-Null
}

Remove-Item $zipPath
Remove-Item $extractTemp -Recurse
Write-Host "Fonts installed to $fontsDir"
