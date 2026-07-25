$env:FORCE_COLOR = "1"
if (-not (Test-Path -Path "$PSScriptRoot/venv")) {
    Write-Host "No venv detected, creating venv..." -NoNewLine
    python -m venv venv
    Write-Host "done"
}

. $PSScriptRoot/venv/Scripts/Activate.ps1

python -m pip install -r requirements.txt > $null
python dotfiles.py @args

deactivate
