import shutil
from .. import config

def configure():
    config.ZELLIJ_CONFIG_DIR.mkdir(parents=True, exist_ok=True)
    shutil.rmtree(config.ZELLIJ_CONFIG_DIR)
    shutil.copy(config.DOTFILES_DIR / config.ZELLIJ_CONFIG_SRC, config.ZELLIJ_CONFIG_DIR)
