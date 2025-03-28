#!/usr/bin/env python3

"""
Create a gclient config.
https://www.chromium.org/developers/how-tos/depottools
"""

from __future__ import print_function

import argparse
import os
import sys

from lib.args import KeyValuePairs
from lib.canonical_platform import CanonicalPlatform
from lib.chromium_version import ChromiumVersion, ChromiumVersionWithSuffix
from lib.gclient import config as gclient_config
from lib.project_paths import MICROSOFT_DIR, PROJECT_ROOT_DIR, REPO_ROOT_DIR
from lib.versions import get_chromium_version_from_microsoft_deps


ELECTRON_SOLUTION_NAME = 'src/microsoft'
ELECTRON_REPO_URL = 'https://devdiv.visualstudio.com/DevDiv/_git/'\
                    'electron-build'


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('-u', '--url',
                        required=False, default=ELECTRON_REPO_URL,
                        help="repository URL")
    parser.add_argument('--cache-dir', required=False,
                        help="cache all git repos into this dir "
                        "and do shared clones from the cache, "
                        "instead of cloning directly from the remote. "
                        "Pass 'None' to explicitly disable the cache.")
    parser.add_argument('-v', '--custom-var', required=False, nargs='*',
                        action=KeyValuePairs,
                        help="custom var for the config, 'key=value' format")
    parser.add_argument('--for', dest='flavour',
                        help="a Microsoft build flavour (unused)")
    parser.add_argument('-t', '--target-os', required=False,
                        help="target OS if different from the host "
                        "(use 'host' as noop)")
    parser.add_argument('-p', '--print',
                        dest='print_the_config',  # Can't use `args.print`.
                        action='store_true', default=False,
                        help="print the config created")

    args = parser.parse_args()

    # Additional rules.

    # TODO(alkuzmin): Warn about the "--for" argument passed to the script
    # after none of alive branches use it.

    return args


def get_chromium_snapshot_revision(target_os):
    version = get_chromium_version_from_microsoft_deps()
    if not ChromiumVersion.is_version_string_valid(version):
        # It is probably a commit hash. Give up.
        return None

    if target_os is not None and target_os != 'host':
        current_platform = target_os
    else:        
        current_platform = CanonicalPlatform.from_system()
    return str(ChromiumVersionWithSuffix(version_string=version,
                                         suffix=current_platform))


def running_inside_proper_checkout():
    return REPO_ROOT_DIR == MICROSOFT_DIR


def get_custom_vars(more_custom_vars, target_os):
    custom_vars = {}

    # We store platform-specific Chromium snapshots separately
    # so an exact revision depends on the current platform.
    custom_vars['microsoft_chromium_version'] = \
        get_chromium_snapshot_revision(target_os)

    # Let's always checkout all dependencies on Linux.
    if CanonicalPlatform.is_host_linux():
        custom_vars['checkout_arm'] = True
        custom_vars['checkout_arm64'] = True
        custom_vars['checkout_x86'] = True

    if more_custom_vars is not None:
        custom_vars.update(more_custom_vars)

    return custom_vars


def main():
    script_args = parse_args()

    if not running_inside_proper_checkout():
        error_message = "the project checkout structure is incorrect, " \
                        "please follow the checkout instructions precisely"
        print(error_message, file=sys.stderr)
        return 1

    custom_vars = get_custom_vars(more_custom_vars=script_args.custom_var, target_os=script_args.target_os)

    os.chdir(PROJECT_ROOT_DIR)
    gclient_config(script_args.url,
                   name=ELECTRON_SOLUTION_NAME,
                   custom_vars=custom_vars,
                   cache_dir=script_args.cache_dir,
                   target_os=script_args.target_os,
                   print_the_config=script_args.print_the_config)

    return 0


if __name__ == '__main__':
    sys.exit(main())
