#!/usr/bin/env python3

"""
Writes text or contents of an environemnt variable to a file.
"""

import argparse
import os

from lib.filesystem import write_to_file


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    source = parser.add_mutually_exclusive_group(required=True)
    source.add_argument('--text', help="text to write")
    source.add_argument('--env-var', help="environment variable to read")
    parser.add_argument('--file-path',
                        type=os.path.abspath, required=True,
                        help="path to a file")
    return parser.parse_args()


def main():
    script_args = parse_args()
    text = (script_args.text or os.getenv(script_args.env_var))
    write_to_file(text=text,
                  file_path=script_args.file_path)


if __name__ == '__main__':
    main()
