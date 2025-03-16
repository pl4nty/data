#!/usr/bin/env python3

"""
Like `apply_all_patches.py` but for the internal build's patch sets
"""

from pathlib import Path

from lib.project_paths import PROJECT_ROOT_DIR
from lib.patch_config import CONFIGS_LIST

# This next line will be needed when we upstream electron_git_patches
# sys.path.append(str(Path(ELECTRON_DIR, 'script', 'lib')))
import lib.electron_git_patches as gp


def main():
    """Export the internal build's patches to disk"""
    for repo in gp.get_repo_patch_dirs(PROJECT_ROOT_DIR, CONFIGS_LIST):
        gp.export_patches(repo=str(Path(PROJECT_ROOT_DIR, repo)))


if __name__ == '__main__':
    main()
