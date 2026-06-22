from .. import util
from .. import config
import shutil

def install():
    util.clear_directory(config.TEMP_DIR)

    util.download_file(config.ALACRITTY_WIN_DOWNLOAD, config.TEMP_DIR, "alacritty.exe")

    shutil.copy2(config.TEMP_DIR / "alacritty.exe", config.BIN_DIR)

