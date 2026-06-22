from .. import util
from .. import config
import zipfile
from pathlib import Path
import os

def install():
    util.clear_directory(config.TEMP_DIR)

    util.download_file(config.ZELLIJ_WIN_DOWNLOAD, config.TEMP_DIR, "zellij.zip")

    ZIP_PATH = config.TEMP_DIR / "zellij.zip"
    ISOLATED_BIN_PATH  = config.BIN_DIR / "zellij.exe"

    with zipfile.ZipFile(ZIP_PATH, "r") as zip_ref:
         for file in zip_ref.namelist():
            if file.endswith("zellij.exe"):
                data = zip_ref.read(file)
                ISOLATED_BIN_PATH.write_bytes(data)
                break
