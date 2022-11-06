# Requires pip install Pillow
# CAREFULL
# python convert.py **/*.bmp
from PIL import Image

from pathlib import Path
import sys
import os
import logging

logger = logging.getLogger("convert")


def convert(file, from_ext=".bmp", to_ext=".jpg"):
    path = Path(file)
    logger.debug(path)
    if path.suffix != from_ext:
        logger.warn(
            "Incorrect path for '%s', we are only converting {%s}",
            file,
            from_ext,
        )
        return
    with Image.open(path) as i:
        new_path = path.with_suffix(to_ext)
        i.save(new_path)
        logger.info(f"saved '{path}' to '{new_path}'")


def main():
    LOGLEVEL = os.environ.get("LOGLEVEL", "INFO").upper()
    logging.basicConfig(level=LOGLEVEL)
    program, *files = sys.argv
    if not files:
        logger.warn("Please call as conver.py (files)")
        exit(1)
    for img in files:
        convert(img, from_ext=".bmp", to_ext=".png")


if __name__ == "__main__":
    main()
