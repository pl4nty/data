#!/usr/bin/env python3

# Transform flavour and version into form usable on Skype IVY
# flavour can be: ['electron', 'vscode']
# version has the form of "X.Y.Z".

# Skype IVY needs a branch name in the following form:
# $(flavour)-$(X.Y)
# with exception for electron-X.Y which should be base-X.Y

# Print output to stdout

import argparse

from lib.build_flavour import ElectronFlavour


def parse_args():
    parser = argparse.ArgumentParser(
        description="Create a string to specify 'branch' "
                    "for Skype IVY publishing")

    parser.add_argument('--flavour',
                        required=True, choices=ElectronFlavour.get_all(),
                        help="build flavour, e.g. electron, vscode")
    parser.add_argument('--version',
                        required=True,
                        help="build version, e.g. 3.1.6, 4.0.8, 2.0.18")

    return parser.parse_args()


def get_branch_prefix(flavour):
    branch_prefix = flavour

    if flavour == ElectronFlavour.ELECTRON:
        branch_prefix = 'base'

    return branch_prefix


def main():
    script_args = parse_args()

    # Keep only a major and minor version, e.g. "3.1.2" -> "3.1".
    version_components = script_args.version.split('.')[0:2]
    version_for_branch = '.'.join(version_components)

    branch_prefix = get_branch_prefix(script_args.flavour)

    branch_name = '{branch_prefix}-{version}'.format(**{
        'branch_prefix': branch_prefix,
        'version': version_for_branch
    })

    print(branch_name)


if __name__ == '__main__':
    main()
