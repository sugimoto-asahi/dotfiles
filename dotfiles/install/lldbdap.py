from .. import util
from .. import config
import zipfile
import shutil

def install():
    util.clear_directory(config.TEMP_DIR)
    ZIP_PATH = config.PACKAGE_DIR / "lldb-dap.zip"
    with zipfile.ZipFile(ZIP_PATH, "r") as zip_ref:
        zip_ref.extractall(config.TEMP_DIR)

    shutil.copytree(config.TEMP_DIR, config.BIN_DIR, dirs_exist_ok=True)

