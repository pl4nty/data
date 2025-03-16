#!/usr/bin/env python3

import os
import sys

from lib.gclient import gclient

def main():
    gclient_args = sys.argv[1:]
    three_way = {'--3', '--three-way'}
    if any(arg in gclient_args for arg in three_way):
       print('Using three-way merge for patches')
       os.environ["ELECTRON_USE_THREE_WAY_MERGE_FOR_PATCHES"] = "true"

    gclient_args = [arg for arg in gclient_args if arg not in three_way]
    gclient(*gclient_args)

if __name__ == '__main__':
    main()
