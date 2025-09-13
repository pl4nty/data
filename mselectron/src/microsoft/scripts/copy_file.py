#!/usr/bin/env python3

import argparse
import os
import shutil

from lib.filesystem import mkdir_p


def parse_args():
    parser = argparse.ArgumentParser(description="Copy a file")

    parser.add_argument('--from', dest='from_path',
                        type=os.path.abspath, required=True,
                        help="source path")
    parser.add_argument('--to',
                        type=os.path.abspath, required=True,
                        help="target path")

    return parser.parse_args()


def main():
    script_args = parse_args()

    # Make sure that the destination dir exists.
    to_path = script_args.to
    destination_path_dir = os.path.dirname(to_path)
    mkdir_p(destination_path_dir)

    if os.path.isdir(to_path):
        # If destination is a directory, copy file into it with same name
        shutil.copy2(src=script_args.from_path,
                     dst=to_path)
    else:
        # If destination is a file path, copy to that exact path
        shutil.copyfile(src=script_args.from_path,
                        dst=to_path)


if __name__ == '__main__':
    main()
