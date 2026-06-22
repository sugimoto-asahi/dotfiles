import shutil
from .. import config

def configure():
    config.ZELLIJ_CONFIG_DIR.mkdir(parents=True, exist_ok=True)
    shutil.copy(config.DOTFILES_DIR / config.ZELLIJ_CONFIG_SRC, config.ZELLIJ_CONFIG_DIR)
