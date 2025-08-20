#!/usr/bin/env python3

"""
Checkout Electron's reclient credential helper
"""

import argparse
import os
import shutil
import subprocess

from lib.canonical_platform import CanonicalPlatform
from lib.deps import get_vars as get_deps_vars
from lib.filesystem import exists
from lib.git import shallow_checkout
from lib.project_paths import RECLIENT_HELPER_DIR, REPO_ROOT_DIR


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--replace',
                        action='store_true',
                        help="replace the existing directory")
    return parser.parse_args()


def run(call_args, cwd=os.getcwd()):
    subprocess.check_call(call_args, cwd=cwd)


def checkout_reclient_helper():
    deps_vars = get_deps_vars(REPO_ROOT_DIR)
    repo_url = deps_vars['microsoft_reclient_helper_git']
    revision = deps_vars['microsoft_reclient_helper_revision']

    shallow_checkout(repo_url, RECLIENT_HELPER_DIR, revision)


def bootstrap():
    is_windows = CanonicalPlatform.is_host_windows()
    npm = 'npm.cmd' if is_windows else 'npm'
    run([npm, 'install'], cwd=RECLIENT_HELPER_DIR)
    run([npm, 'link'], cwd=RECLIENT_HELPER_DIR)

def main():
    script_args = parse_args()

    if script_args.replace and exists(RECLIENT_HELPER_DIR):
        shutil.rmtree(RECLIENT_HELPER_DIR)

    checkout_reclient_helper()
    bootstrap()


if __name__ == '__main__':
    main()
