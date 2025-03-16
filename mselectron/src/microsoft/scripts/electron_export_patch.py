#!/usr/bin/env python3

"""
Export individual patch(es) to disk.
"""

import argparse
import errno
import os

import lib.electron_git_patches as gp


def is_git_repo(string):
    """test that `string` is a directory holding a git repository"""
    if os.path.isdir(os.path.join(string, '.git')):
        return string
    raise OSError(errno.EINVAL, string)


def is_dir(string):
    """test that `string` is a directory"""
    if os.path.isdir(string):
        return string
    raise NotADirectoryError(string)


def parse_args():
    """parse the command-line arguments"""
    parser = argparse.ArgumentParser(description='Export Electron patches')
    parser.add_argument('--repo',
                        default=os.getcwd(),
                        help='path to git repository (default=cwd)',
                        type=is_git_repo)
    parser.add_argument('--patch-dir',
                        default=os.getcwd(),
                        help='path to patch directory (default=cwd)',
                        type=is_dir)
    parser.add_argument('commit', help='commit(s) to export', nargs='+')
    return parser.parse_args()


def main():
    """Save specified commits from a git repo as files"""
    args = parse_args()
    for commit in args.commit:
        patch = gp.Patch.from_commit(args.repo, commit)
        if patch.dirname:
            print(f"Updating patch '{patch.filename()}'")
        else:
            patch.dirname = args.patch_dir
            print(f"Adding new patch '{patch.filename()}'")
            patch.append_to_patches_file()
        patch.save_to_file()


if __name__ == '__main__':
    main()
