#!/usr/bin/env python3

import argparse
import os
import sys

from lib.filesystem import exists


def parse_args():
    parser = argparse.ArgumentParser(
        description="Check a file or a directory existence")

    parser.add_argument('path',
                        type=os.path.abspath,
                        help="path to check")

    entity_type = parser.add_mutually_exclusive_group(required=False)
    entity_type.add_argument('--file', dest='type',
                             action='store_const', const='file',
                             help="should be a file")
    entity_type.add_argument('--directory', dest='type',
                             action='store_const', const='directory',
                             help="should be a directory")

    return parser.parse_args()


def main():
    script_args = parse_args()

    ok = exists(script_args.path, script_args.type)
    if not ok:
        sys.exit(1)


if __name__ == '__main__':
    main()
