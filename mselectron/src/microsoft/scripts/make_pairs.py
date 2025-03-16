#!/usr/bin/env python3

"""
Make a "key1=value1 [key2=value2 [...]]" string from two comma-separated
lists "key1[,key2[,...]]" and "value1[,value2[,...]]".
Leading and trailing commas in input lists are ignored.
"""

from __future__ import print_function

import argparse

from lib.args import comma_separated_list


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('-k', '--keys',
                        type=comma_separated_list, required=True,
                        help="a comma-separated list of keys")
    parser.add_argument('-v', '--values',
                        type=comma_separated_list, required=True,
                        help="a comma-separated list of values")

    args = parser.parse_args()

    if len(args.keys) != len(args.values):
        parser.error("number of keys must match number of values")

    return args


def main():
    script_args = parse_args()

    pairs = zip(script_args.keys, script_args.values)
    pairs_string = ' '.join('='.join(pair) for pair in pairs)
    print(pairs_string, end='')


if __name__ == '__main__':
    main()
