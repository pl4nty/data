#!/usr/bin/env python3

"""
Export patches from git repos to disk.
"""

import argparse
import os
from pathlib import Path

import lib.electron_git_patches as gp
from lib.project_paths import ELECTRON_DIR, PROJECT_ROOT_DIR


def parse_args():
    """Parse the command-line arguments"""
    electron_patch_config = str(Path(ELECTRON_DIR, 'patches', 'config.json'))

    parser = argparse.ArgumentParser(description='Export Electron patches')
    parser.add_argument('source', nargs='+', type=gp.is_config_json,
                        help='config.json file(s)',
                        default=electron_patch_config)
    parser.add_argument("-d", "--dry-run",
                        help="Checks whether the patches need to be updated.",
                        default=False, action='store_true')
    return parser.parse_args()


def main():
    """Export all the patches to disk"""
    args = parse_args()
    repo_patch_dirs = gp.get_repo_patch_dirs(PROJECT_ROOT_DIR, args.source)
    for repo in repo_patch_dirs:
        gp.export_patches(repo=os.path.join(PROJECT_ROOT_DIR, repo),
                          dry_run=args.dry_run)


if __name__ == '__main__':
    main()
