#!/usr/bin/env python3

"""
Get or check Electron version.
"""

from __future__ import print_function

import argparse
import sys

from lib.versions import get_electron_version_from_microsoft_deps, \
                         get_electron_revision_from_microsoft_deps, \
                         get_electron_revision


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument('--from-microsoft-deps', action='store_true',
                        help="get Electron version "
                             "from the Microsoft DEPS file")
    parser.add_argument('-r', '--get-revision', action='store_true',
                        help="get Electron revision "
                             "from the Microsoft DEPS file")
    parser.add_argument('--strip-leading-v', action='store_true',
                        help="strip leading \"v\" from the Electron version")
    parser.add_argument('-v', '--validate', action='store_true',
                        help="check that the Electron version "
                             "matches the Electron revision")

    return parser.parse_args()


def main():
    script_args = parse_args()

    if script_args.from_microsoft_deps:
        version = get_electron_version_from_microsoft_deps(
            script_args.strip_leading_v)
        print(version, end='')
        return 0

    if script_args.get_revision:
        revision = get_electron_revision_from_microsoft_deps()
        print(revision, end='')
        return 0

    if script_args.validate:
        expected_revision = get_electron_revision_from_microsoft_deps()
        actual_revision = get_electron_revision()

        if expected_revision != actual_revision:
            error_message = (
                f"expected Electron revision {expected_revision}, "
                f"got {actual_revision}"
            )
            print(error_message, file=sys.stderr)
            return 1

        return 0

    return 0


if __name__ == '__main__':
    sys.exit(main())
