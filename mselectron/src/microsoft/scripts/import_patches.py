#!/usr/bin/env python3

"""
Applies the internal build's patch sets
"""

import os
import sys
from pathlib import Path

from lib.git import fake_user, is_git_repo
from lib.project_paths import PROJECT_ROOT_DIR, SRC_DIR
from lib.patch_config import CONFIGS_LIST

# This next line will be needed when we upstream electron_git_patches
# sys.path.append(str(Path(ELECTRON_DIR, 'script', 'lib')))
import lib.electron_git_patches as gp


THREEWAY = "ELECTRON_USE_THREE_WAY_MERGE_FOR_PATCHES" in os.environ


def detect_chromium_snapshot() -> bool:
    """Return true iff we're building from a snapshot"""
    v8_path = Path(SRC_DIR, 'v8')
    return v8_path.is_dir() and not is_git_repo(v8_path)


def get_excluded_paths(repo_path):
    """Return a list of paths to exclude when applying patches"""
    # A Chromium snapshot misses some non-essential parts of the tree.
    excluded_paths = [
      '.gitignore',
      '**/.gitignore',
    ]

    # Keys of the dict are real repos paths,
    # e.g. 'src/v8', 'src/third_party/ffmpeg', etc.
    excluded_paths_for_repos = {
      'src': [
        'android_webview/*',
        'chrome/test/data/xr/webvr_info/*',
        'ios/*',
        'third_party/blink/perf_tests/*',
        'third_party/blink/web_tests/*',
      ],
      'third_party/angle': [
        'third_party/VK-GL-CTS/src/android/*',
      ],
      'third_party/boringssl': [
        'src/third_party/wycheproof_testvectors/*',
      ],
      'third_party/dawn': [
        'test/*',
      ],
      'third_party/harfbuzz-ng': [
        'src/test/*',
      ],
      'third_party/skia': [
        'tests/*',
      ],
      'third_party/swiftshader': [
        'third_party/llvm-16.0',
      ],
    }
    excluded_for_repo = excluded_paths_for_repos.get(repo_path, None)
    if excluded_for_repo:
        excluded_paths += excluded_for_repo

    return excluded_paths


def is_snapshot_part(repo: str) -> bool:
    """ Return true if we're using a snapshot for `repo`"""

    # The Squirrel.Mac repo and its nested repos are not a part of Chromium.
    if repo.startswith('src/third_party/squirrel.mac'):
        return False

    return repo not in [
        'src/electron',
        'src/third_party/electron_node',
        'src/third_party/engflow-reclient-configs',
        'src/third_party/nan',
    ]


def get_target_repo_and_directory(repo_path: str, is_snapshot: bool):
    """ Get the target repo and its subdirectory """
    if not is_snapshot or not is_snapshot_part(repo_path):
        return repo_path, ''

    # In a Chromium snapshot all dependencies are stored
    # in the top-level repo not in nested repos.
    src_repo = 'src'

    # Let's exclude "src/" from a path,
    # e.g. "src/third_party/ffmpeg" -> "third_party/ffmpeg".
    top_level_dir, directory = exclude_top_level_dir(repo_path)
    assert top_level_dir == src_repo
    return src_repo, directory


def exclude_top_level_dir(some_path):
    """ Helper to split the top dir off of `some_path` """
    path_separator = '/'  # Don't use a system path separator.
    path_parts = some_path.split(path_separator)
    top_level_dir = path_parts[0]
    path_parts = path_parts[1:]
    path_without_top_level_dir = path_separator.join(path_parts)
    return top_level_dir, path_without_top_level_dir


def main():
    """Apply the internal build's patch sets."""
    root = PROJECT_ROOT_DIR
    is_snapshot = detect_chromium_snapshot()

    # for each repo, apply the patches from its patch_dirs
    for repo, patch_dirs in gp.get_repo_patch_dirs(root, CONFIGS_LIST).items():
        excluded_paths = get_excluded_paths(repo) if is_snapshot else []
        repo, repo_subdir = get_target_repo_and_directory(repo, is_snapshot)

        repo_path = Path(root, repo)
        if not is_git_repo(repo_path):
            print(f"Skipping '{repo_path}'; not a git repo", file=sys.stderr)
            continue

        if repo_subdir:
            subdir_path = repo_path.joinpath(repo_subdir)
            if not subdir_path.exists():
                print(f"Skipping nonexistent '{subdir_path}'", file=sys.stderr)
                continue

        am_opts = gp.GitAmOpts()
        am_opts.committer_email = fake_user.email
        am_opts.committer_name = fake_user.name
        am_opts.directory = repo_subdir
        am_opts.exclude = excluded_paths
        am_opts.threeway = THREEWAY
        print(f"## Patching '{repo}'")

        gp.import_patches(repo=str(repo_path),
                          patch_data=gp.get_patch_data(root, patch_dirs),
                          opts=am_opts)


if __name__ == '__main__':
    main()
