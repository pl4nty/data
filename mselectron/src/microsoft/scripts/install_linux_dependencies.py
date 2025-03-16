#!/usr/bin/env python3

import argparse

from lib.apt_get import apt_get_install
from lib.args import boolean_string
from lib.project_paths import PROJECT_ROOT_DIR
from checkout_chromium import install_linux_build_deps


def parse_args():
    parser = argparse.ArgumentParser(
        description="Install Linux dependencies")

    parser.add_argument('--chromium', nargs='?',
                        type=boolean_string,
                        default=True, const=True,
                        help="install Chromium dependencies")

    return parser.parse_args()


def main():
    script_args = parse_args()

    if script_args.chromium:
        install_chromium_deps()

    install_electron_test_deps()


def install_chromium_deps():
    install_linux_build_deps(checkout_dir=PROJECT_ROOT_DIR)


def install_electron_test_deps():
    packages_to_install = [
      'libasound2-dev',
      'libnotify-bin',
      'libnss3-dev',
      'libx11-dev',
      'libxss1',
      'libxtst-dev',
      'python-dbusmock',
      'unzip',
      'xvfb',
    ]

    apt_get_install(packages_to_install, sudo=True)


if __name__ == '__main__':
    main()
