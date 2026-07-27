from pathlib import Path
import os

DOTFILES_DIR = None
TEMP_DIR = None
PACKAGE_DIR = None

APPDATA_DIR = Path(os.getenv("APPDATA"))
LOCALAPPDATA_DIR = Path(os.getenv("LOCALAPPDATA"))
HOME_DIR = Path.home()
BIN_DIR = Path.home() / ".local/bin"
def set_dotfiles_dir(path):
    global DOTFILES_DIR
    DOTFILES_DIR = path
    global TEMP_DIR
    TEMP_DIR = DOTFILES_DIR / "temp"
    global PACKAGE_DIR
    PACKAGE_DIR = DOTFILES_DIR / "packages"


# Programs
ZELLIJ_WIN_DOWNLOAD = "https://github.com/zellij-org/zellij/releases/download/v0.44.3/zellij-x86_64-pc-windows-msvc.zip"
ALACRITTY_WIN_DOWNLOAD = "https://github.com/alacritty/alacritty/releases/download/v0.17.0/Alacritty-v0.17.0-portable.exe"
NEOVIM_WIN_DOWNLOAD = "https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip"

# Config
ALACRITTY_CONFIG_SRC = "config/alacritty/alacritty.toml"
ALACRITTY_CONFIG_DIR = APPDATA_DIR / "alacritty"

ZELLIJ_CONFIG_SRC = "config/zellij/config.kdl"
ZELLIJ_CONFIG_DIR = HOME_DIR / ".config/zellij"

NEOVIM_CONFIG_SRC = "config/neovim"
NEOVIM_CONFIG_DIR = LOCALAPPDATA_DIR / "nvim"

