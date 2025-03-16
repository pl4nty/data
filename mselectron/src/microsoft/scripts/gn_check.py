#!/usr/bin/env python3

"""
GN Check
https://gn.googlesource.com/gn/+/master/docs/reference.md#cmd_check
"""

import argparse
import os

from lib.gn import gn


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('out_dir', type=os.path.abspath,
                        help="output dir path, e.g. 'out/testing'")
    parser.add_argument('label_pattern', nargs='?',
                        help="target(s) to check")

    return parser.parse_args()


def gn_check(out_dir, label_pattern):
    gn(['check', out_dir, label_pattern])


def gn_check_all(out_dir):
    # The list of targets to check is copied from the upstream.
    # https://github.com/electron/electron/blob/846b31b77d08f5d11ad2b4806c6d6f9b7a42f123/.github/workflows/pipeline-segment-electron-gn-check.yml#L142
    label_patterns = [
        "//electron:electron_app",
        "//electron:electron_lib",
        "//electron/shell/common:mojo",
        "//electron/shell/common:plugin",
    ]

    for label_pattern in label_patterns:
        gn_check(out_dir, label_pattern)


def main():
    script_args = parse_args()
    out_dir = script_args.out_dir
    label_pattern = script_args.label_pattern

    if label_pattern is None:
        gn_check_all(out_dir)
    else:
        gn_check(out_dir, label_pattern)


if __name__ == '__main__':
    main()
