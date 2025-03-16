#!/usr/bin/env python3

"""
Validate Node.js version
"""

from __future__ import print_function

import argparse
import sys

from lib.versions import get_node_version_from_electron_deps, \
    get_node_version_from_microsoft_deps


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument('-v', '--validate', action='store_true',
                        help="check that versions in the Electron DEPS "
                             "and Microsoft DEPS files match")

    return parser.parse_args()


def main():
    script_args = parse_args()

    if script_args.validate:
        from_electron_deps = get_node_version_from_electron_deps()
        from_microsoft_deps = get_node_version_from_microsoft_deps()
        versions_match = from_electron_deps == from_microsoft_deps

        if not versions_match:
            error_message = (
                f"expected Node.js {from_electron_deps}, "
                f"got {from_microsoft_deps}"
            )
            print(error_message, file=sys.stderr)
        exit_code = 0 if versions_match else 1
        return exit_code

    return 0


if __name__ == '__main__':
    sys.exit(main())
