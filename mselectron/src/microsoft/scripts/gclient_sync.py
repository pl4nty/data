#!/usr/bin/env python3

import argparse
import json
import os

from lib.gclient import gclient
from lib.project_paths import REPO_ROOT_DIR, ELECTRON_DIR


MICROSOFT_SYSROOT_URL = \
    'https://msftelectronbuild.z5.web.core.windows.net/sysroots/toolchain'


def check_sysroots_json():
    # Check if the sysroots.json file has been changed.
    el_sysroots_path = os.path.join(ELECTRON_DIR, 'script', 'sysroots.json')
    ms_sysroots_path = os.path.join(REPO_ROOT_DIR, 'build', 'sysroots.json')
    if not os.path.exists(el_sysroots_path):
        return
    with open(el_sysroots_path, mode='r', encoding='utf-8') as el_file:
        el_sysroots = json.load(el_file)
    with open(ms_sysroots_path, mode='r', encoding='utf-8') as ms_file:
        ms_sysroots = json.load(ms_file)
    if el_sysroots['bullseye_amd64']['Sha256Sum'] == \
       ms_sysroots['bullseye_amd64']['Sha256Sum']:
        return

    # Update the sysroots.json file.
    for key in el_sysroots:
        el_sysroots[key]['URL'] = MICROSOFT_SYSROOT_URL
    with open(ms_sysroots_path, mode='w', encoding='utf-8') as ms_file:
        json.dump(el_sysroots, ms_file, indent=4)
    print('The build/sysroots.json file has been updated, please commit it.')


def gclient_sync(revision=None, reset=False, run_hooks=True):
    gclient_args = [
      'sync',
      '--force',
      '--with_branch_heads',
      '--with_tags',
    ]
    if revision:
        gclient_args += ['--revision', revision]
    if reset:
        gclient_args.append('--reset')
    if not run_hooks:
        gclient_args.append('--nohooks')

    gclient(*gclient_args)


def main():
    parser = argparse.ArgumentParser(
        description="Sync project dependencies using gclient\n"
                    "https://www.chromium.org/developers/how-tos/depottools",
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('-r', '--revision', required=False,
                        help='enforces revision/hash for the solution')
    parser.add_argument('--reset', action='store_true',
                        help='reset the environment, then run the sync')
    parser.add_argument('--no-hooks', action='store_false', dest='run_hooks',
                        help="don't run hooks after the update is complete")
    parser.add_argument('--3', '--three-way', dest='three_way',
                        action='store_true',
                        help='Perform a three-way merge on patches')
    args = parser.parse_args()
    if args.three_way:
       print('Using three-way merge for gclient sync')
       os.environ["ELECTRON_USE_THREE_WAY_MERGE_FOR_PATCHES"] = "true"
    gclient_sync(args.revision, args.reset, run_hooks=args.run_hooks)


if __name__ == '__main__':
    main()
    check_sysroots_json()
