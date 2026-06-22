import shutil
from .. import config

def configure():
    config.NEOVIM_CONFIG_DIR.mkdir(parents=True, exist_ok=True)
    shutil.copytree(config.DOTFILES_DIR / config.NEOVIM_CONFIG_SRC, config.NEOVIM_CONFIG_DIR, dirs_exist_ok=True)
