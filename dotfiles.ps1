$env:FORCE_COLOR = "1"
# Install uv if not present
if (Get-Command "uv" -ErrorAction SilentlyContinue) {
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
}

uv run python "$PSScriptRoot/dotfiles.py" @args
