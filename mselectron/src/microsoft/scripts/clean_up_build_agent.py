#!/usr/bin/env python3

"""
Clean up an Azure DevOps build agent
"""


import argparse
import os
import re
import shutil
import sys


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument('-b', '--build-dir', required=True,
                        help="a full path to the current "
                             "build directory")

    return parser.parse_args()


def is_build_dir_name(dir_name):
    return re.match(r'^[0-9]+$', dir_name) is not None


def remove_other_build_dirs(current_build_dir):
    agent_work_dir = os.path.dirname(current_build_dir)
    current_build_dir_name = os.path.basename(current_build_dir)

    for child_name in os.listdir(agent_work_dir):
        if child_name == current_build_dir_name:
            continue

        if not is_build_dir_name(child_name):
            continue

        build_dir_path = os.path.join(agent_work_dir, child_name)
        if not os.path.isdir(build_dir_path):
            continue

        print(f'Deleting "{build_dir_path}"...')
        shutil.rmtree(build_dir_path, ignore_errors=True)


def main():
    script_args = parse_args()
    remove_other_build_dirs(script_args.build_dir)
    return 0


if __name__ == '__main__':
    sys.exit(main())
