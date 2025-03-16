#!/usr/bin/env python3

"""
Download packaged Visual Studio installation.
"""

import argparse
import os
import subprocess
import sys

from lib.args import boolean_string
from lib.project_paths import SRC_DIR
from lib.vs_toolchain import download as download_toolchain, \
    override_toolchain_hash_in_environment


def _parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--install', '-i',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="install the downloaded toolchain")
    return parser.parse_args()


def _install_toolchain():
    env = os.environ.copy()
    override_toolchain_hash_in_environment(env)
    script_path = os.path.join(SRC_DIR, 'build', 'vs_toolchain.py')
    call_args = [sys.executable, script_path, 'update', '--force']
    subprocess.check_call(call_args, env=env)


def _getenv_or_raise(key):
    value = os.getenv(key)
    if value is None:
        raise Exception(f"'{key}' must be set, see 'docs/windows_toolchain.md'")
    return value


def main():
    script_args = _parse_args()

    use_toolchain_var = 'DEPOT_TOOLS_WIN_TOOLCHAIN'
    if os.getenv(use_toolchain_var) != '1':
        print(
            f"Set '{use_toolchain_var}=1' to download packaged toolchain."
            " Skipping for now.")
        return

    download_dir = _getenv_or_raise('DEPOT_TOOLS_WIN_TOOLCHAIN_BASE_URL')
    download_toolchain(download_dir)

    if script_args.install:
        _install_toolchain()


if __name__ == '__main__':
    main()
