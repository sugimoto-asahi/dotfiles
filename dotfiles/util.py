import os
import requests
from . import configure
import shutil
from pathlib import Path

def download_file(url: str, output_dir: str, filename: str):
    """
    Downloads a file from a URL and saves it to a specified location and name.
    :param url: The direct download URL (e.g., GitHub release asset link).
    :param output_dir: The folder directory where you want to save the file.
    :param filename: The desired name of the saved file (including extension).
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Combine the path and filename safely
    dest = os.path.join(output_dir, filename)

    try:
        with requests.get(url, stream=True) as response:
            response.raise_for_status()

            with open(dest, 'wb') as file:
                for chunk in response.iter_content(chunk_size=8192):
                    if chunk:
                        file.write(chunk)

        return True

    except requests.exceptions.RequestException as e:
        return False


def run(function, display=""):
    try:
        if (display):
            print(f"{display}...", end="")
        function()
        if (display):
            print("done")
    except Exception as e:
        if (display):
            print(f"failed: {e}")


def clear_directory(dir_path):
    directory = Path(dir_path)
    for item in directory.iterdir():
        if item.is_dir():
            shutil.rmtree(item)  # Delete subdirectory and its contents
        else:
            item.unlink()         # Delete individual file
