#!/usr/bin/env python3

import argparse
import os

from lib.filesystem import touch


def parse_args():
    parser = argparse.ArgumentParser(
        description="Create a file if does not exist yet")
    parser.add_argument('path',
                        type=os.path.abspath,
                        help="path to a file")
    return parser.parse_args()


def main():
    touch(parse_args().path)


if __name__ == '__main__':
    main()
