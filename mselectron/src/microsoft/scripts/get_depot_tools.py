#!/usr/bin/env python3

"""
Clone the depot tools repository.
"""

import argparse
import os
import shutil

from lib.canonical_platform import CanonicalPlatform
from lib.deps import get_vars as get_deps_vars
from lib.filesystem import exists
from lib.git import shallow_checkout
from lib.project_paths import REPO_ROOT_DIR


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--replace',
                        action='store_true',
                        help="replace the target directory")
    parser.add_argument('directory', nargs='?',
                        default='depot_tools',
                        type=os.path.abspath,
                        help="directory to clone to")
    return parser.parse_args()


def main():
    script_args = parse_args()
    target_directory = script_args.directory

    if script_args.replace and exists(target_directory):
        shutil.rmtree(target_directory)

    checkout_depot_tools(target_directory)
    bootstrap(target_directory)


def checkout_depot_tools(target_directory):
    deps_vars = get_deps_vars(REPO_ROOT_DIR)
    repo_url = deps_vars['microsoft_depot_tools_git']
    revision = deps_vars['microsoft_depot_tools_revision']

    shallow_checkout(repo_url, target_directory, revision)


def bootstrap(depot_tools_dir):
    if CanonicalPlatform.is_host_windows():
        # See the "Hacks and Workarounds" doc for the explanation.
        create_git_bat(depot_tools_dir)
        run_win_tools_bat(depot_tools_dir)


def create_git_bat(depot_tools_dir):
    file_path = os.path.join(REPO_ROOT_DIR, 'scripts', 'git.bat')
    shutil.copy(file_path, depot_tools_dir)


def run_win_tools_bat(depot_tools_dir):
    os.system(os.path.join(depot_tools_dir, 'bootstrap', 'win_tools.bat'))


if __name__ == '__main__':
    main()
