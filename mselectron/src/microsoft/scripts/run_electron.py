#!/usr/bin/env python3

"""
Run an Electron binary on Linux, macOS, or Windows.
"""

import argparse
import os
import subprocess

from lib import electron


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('build_dir',
                        help="path to a build directory")
    parser.add_argument('electron_args', nargs=argparse.REMAINDER,
                        help="Electron args passed to a binary")
    return parser.parse_args()


def main():
    script_args = parse_args()

    build_dir = os.path.abspath(script_args.build_dir)
    electron_path = electron.get_binary_path(build_dir)

    electron_args = script_args.electron_args
    call_args = [electron_path] + electron_args

    # NOTE: stderr is lost here. But we don't need it for now.
    stdout = subprocess.check_output(call_args, text=True)
    print(stdout)


if __name__ == '__main__':
    main()
