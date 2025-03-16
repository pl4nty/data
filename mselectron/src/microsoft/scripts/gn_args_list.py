#!/usr/bin/env python3

"""
List GN arguments
https://gn.googlesource.com/gn/+/master/docs/reference.md#cmd_args
"""

from __future__ import print_function

import argparse
import os

from lib.gn import gn


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('out_dir', type=os.path.abspath,
                        help="output dir path, e.g. 'out/testing'")
    parser.add_argument('--overrides-only', action='store_true', default=False,
                        help="print only arguments that have been overridden")
    parser.add_argument('--short', action='store_true', default=False,
                        help="print only the names and current values")
    parser.add_argument('-o', '--output', type=os.path.abspath, required=False,
                        help="save output to a file")

    return parser.parse_args()


def gn_args_list(out_dir, short=False, overrides_only=False):
    call_args = ['args', out_dir, '--list']
    if short:
        call_args.append('--short')
    if overrides_only:
        call_args.append('--overrides-only')

    return gn(call_args, capture_output=True).stdout


def main():
    script_args = parse_args()

    args_list = gn_args_list(script_args.out_dir, script_args.short,
                             script_args.overrides_only)
    if script_args.output is None:
        print(args_list)
    else:
        with open(script_args.output, mode='w', encoding='utf-8') as f:
            print(args_list, file=f)


if __name__ == '__main__':
    main()
