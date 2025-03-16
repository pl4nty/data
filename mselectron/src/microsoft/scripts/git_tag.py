#!/usr/bin/env python3

import argparse
import os

from lib.args import boolean_string
from lib.git import Repository
from lib.project_paths import REPO_ROOT_DIR


def parse_args():
    parser = argparse.ArgumentParser(description="Tag a git commit")

    parser.add_argument('-R', '--repo',
                        type=os.path.abspath, default=REPO_ROOT_DIR,
                        help="a repository path")
    parser.add_argument('-p', '--push',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="push the tag")
    parser.add_argument('-r', '--revision',
                        required=True,
                        help="a git ref to tag")
    parser.add_argument('-t', '--tag',
                        required=True,
                        help="a tag name")

    return parser.parse_args()


def main():
    script_args = parse_args()

    repo = Repository(script_args.repo)
    tag = script_args.tag

    repo.git('tag', tag, script_args.revision)
    if script_args.push:
        repo.git('push', 'origin', tag)


if __name__ == '__main__':
    main()
