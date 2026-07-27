from .. import util
from .. import config
import zipfile
import shutil

def install():
    util.clear_directory(config.TEMP_DIR)

    util.download_file(config.NEOVIM_WIN_DOWNLOAD, config.TEMP_DIR, "neovim.zip")

    ZIP_PATH = config.TEMP_DIR / "neovim.zip"
    ISOLATED_BIN_DIR = config.BIN_DIR / "nvim"
    ISOLATED_BIN_DIR.mkdir(parents=True, exist_ok=True)

    with zipfile.ZipFile(ZIP_PATH, "r") as zip_ref:
        zip_ref.extractall(config.TEMP_DIR)

    shutil.copytree(config.TEMP_DIR / "nvim-win64", ISOLATED_BIN_DIR, dirs_exist_ok=True)

    # wrapper since nvim.exe wants to execute in its own directory
    ps1_content = f".\"{config.BIN_DIR}\\nvim\\bin\\nvim.exe\" @args"

    with open(f"{config.BIN_DIR}/nvim.ps1", "w") as file:
        file.write(ps1_content)

