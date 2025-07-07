#!/usr/bin/env python3

##=============================================================================
## [Filename]       add_line.py
## [Project]        -
## [Author]         Ciro Bermudez - cirofabian.bermudez@gmail.com
## [Language]       Python 3.12.3
## [Created]        2025-07-05
## [Modified]       -
## [Description]    Insert line in an specific part of the YAML header
## [Notes]          -
## [Status]         devel
## [Revisions]      -
##=============================================================================

import argparse
import logging
from pathlib import Path

def insert_line(
    dir_path: Path,
    inline_mode: bool
) -> None:

    logging.info(f"===== INPUTS =====")
    logging.info(f"dir_path:  {dir_path}")
    logging.info(f"test_mode: {inline_mode}\n")

    for file in dir_path.rglob("**/*.md"):
        if file.is_file():
            logging.info(f"{file.name}")

            with open(file, 'r', encoding='utf=8' ) as f:
                lines = f.readlines()

            # Check for an existing 'year' line
            if any(line.strip().startswith('year') for line in lines):
                logging.info(f"year line found!")
                logging.info(f"Skipping {file.name}\n")
                continue
            
            # Find where the first 'tags' line occurs
            insert_idx = None
            for idx, raw in enumerate(lines):
                if raw.strip().startswith('tags'):
                    insert_idx = idx
                    logging.info(f"idx: {idx}")

            # If no line occurs continue
            if insert_idx is None:
                logging.info(f"No 'tags' line found")
                continue

            # Insert new line in the list
            new_line = f"year: \n"
            lines.insert(insert_idx, new_line)

            if inline_mode:
                logging.info(f"Inline mode")
                # Write back
                with open(file, 'w', encoding='utf=8' ) as f:
                    f.writelines(lines)
            else:
                logging.info(f"Debug mode")
                for line in lines:
                    print(line.strip())

            logging.info(f"Insertion successfully\n")


def main() -> None:
    script_path = Path(__file__).resolve()
    script_dir = script_path.parent

    parser = argparse.ArgumentParser(description="Python Utility for Obsidian Notes")

    parser.add_argument(
        "-p",
        "--path",
        type=Path,
        required=False,
        default=script_dir,
        help="base directory to look for files to edit"
    )

    parser.add_argument(
        "-i",
        "--inline",
        required=False,
        action="store_true",
        help="enable inline mode"
    )

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.INFO,
        format="[%(levelname)s]: %(message)s"
    )

    insert_line(dir_path=args.path, inline_mode=args.inline)

if __name__ == "__main__":
    main()
