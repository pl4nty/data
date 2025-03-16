#!/usr/bin/env python3

"""
Get or validate Chromium version
"""

from __future__ import print_function

import argparse
import sys

from lib.versions import get_chromium_version_from_electron_deps, \
    get_chromium_version_from_microsoft_deps, \
    get_chromium_version_from_version_file


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)

    action = parser.add_mutually_exclusive_group(required=True)
    action.add_argument('-v', '--validate', action='store_true',
                        help="check that versions in the Electron DEPS "
                             "and in the VERSION file match")
    action.add_argument('--from-electron-deps', action='store_true',
                        help="get version from the Electron DEPS file")
    action.add_argument('--from-microsoft-deps', action='store_true',
                        help="get Electron version "
                             "from the Microsoft DEPS file")
    action.add_argument('--from-sources', action='store_true',
                        help="get version from the VERSION file")

    return parser.parse_args()


def print_version(version_string):
    print(version_string, end='')


def main():
    script_args = parse_args()

    if script_args.validate:
        version_from_deps = get_chromium_version_from_electron_deps()
        version_from_sources = get_chromium_version_from_version_file()
        versions_match = (version_from_deps == version_from_sources)

        if not versions_match:
            error_message = (
                f"expected Chromium {version_from_sources}, "
                f"got {version_from_deps}"
            )
            print(error_message, file=sys.stderr)

        exit_code = 0 if versions_match else 1
        return exit_code

    if script_args.from_electron_deps:
        version = get_chromium_version_from_electron_deps()
        print_version(version)
        return 0

    if script_args.from_microsoft_deps:
        version = get_chromium_version_from_microsoft_deps()
        print_version(version)
        return 0

    if script_args.from_sources:
        version = get_chromium_version_from_version_file()
        print_version(version)
        return 0

    return 0


if __name__ == '__main__':
    sys.exit(main())
