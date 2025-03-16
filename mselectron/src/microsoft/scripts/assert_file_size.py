#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Asserts that a file is at least a certain number of megabytes big.
"""

from __future__ import print_function

import argparse
import os
import sys

from lib.filesystem import exists


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('-f', '--file',
                        type=os.path.abspath, required=True,
                        help="a file path")
    parser.add_argument('-l', '--at-least',
                        type=float, required=True,
                        help="the file size lower bound in MB")
    return parser.parse_args()


def get_file_size_in_mb(file_path):
    size_in_bytes = os.path.getsize(file_path)
    size_in_mb = float(size_in_bytes) / 2 ** 20
    return size_in_mb


def check_file_size_at_least(file_path, minimum_size_in_mb):
    actual_size_in_mb = get_file_size_in_mb(file_path)
    ok = (actual_size_in_mb >= minimum_size_in_mb)
    return ok, actual_size_in_mb


def truncate(n, decimals=0):
    multiplier = 10 ** decimals
    return int(n * multiplier) / float(multiplier)


def main():
    script_args = parse_args()
    file_path = script_args.file

    if not exists(file_path, 'file'):
        message = f"path '{file_path}' does not exist or is not a file"
        print(message, file=sys.stderr)
        return 1

    minimum_size_in_mb = script_args.at_least
    size_ok, actual_size_in_mb = check_file_size_at_least(
        file_path, minimum_size_in_mb)

    if size_ok:
        template = "file size of {} MB is larger than the expected {} MB"
        message = template.format(truncate(actual_size_in_mb, 2),
                                  minimum_size_in_mb)
        print(message)
    else:
        template = "file size of {} MB is lower than expected {} MB"
        message = template.format(truncate(actual_size_in_mb, 2),
                                  minimum_size_in_mb)
        print(message, file=sys.stderr)
        return 1

    return 0


if __name__ == '__main__':
    sys.exit(main())
