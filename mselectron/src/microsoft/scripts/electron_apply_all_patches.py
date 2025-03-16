#!/usr/bin/env python3

"""
Apply patches to Chromium and friends.
"""

import argparse
import os
from pathlib import Path

import lib.electron_git_patches as gp
from lib.project_paths import ELECTRON_DIR, PROJECT_ROOT_DIR as ROOT


THREEWAY = "ELECTRON_USE_THREE_WAY_MERGE_FOR_PATCHES" in os.environ


def parse_args():
    """Parse the command-line arguments"""
    electron_patch_config = str(Path(ELECTRON_DIR, 'patches', 'config.json'))
    parser = argparse.ArgumentParser()
    parser.add_argument('source', nargs='+', type=gp.is_config_json,
                        help='config.json file(s)',
                        default=electron_patch_config)
    parser.add_argument('-3', '--3way',
                        action='store_true',
                        default=THREEWAY,
                        dest='threeway',
                        help='use 3-way merge to resolve conflicts')
    return parser.parse_args()


def main():
    """Run `git am` to apply all the patches"""
    args = parse_args()

    am_opts = gp.GitAmOpts()
    am_opts.threeway = args.threeway

    # for each repo, apply the patches from its patch_dirs
    repo_patch_dirs = gp.get_repo_patch_dirs(ROOT, args.source)
    for repo, patch_dirs in repo_patch_dirs.items():
        print(f"## Patching '{repo}'")
        gp.import_patches(repo=os.path.join(ROOT, repo),
                          patch_data=gp.get_patch_data(ROOT, patch_dirs),
                          opts=am_opts)


if __name__ == '__main__':
    main()
