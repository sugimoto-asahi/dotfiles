import shutil
from .. import config


def configure():
    config.ALACRITTY_CONFIG_DIR.mkdir(parents=True, exist_ok=True)
    shutil.copy(config.DOTFILES_DIR / "config/alacritty/alacritty.toml", config.ALACRITTY_CONFIG_DIR)
