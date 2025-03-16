#!/usr/bin/env python3

"""
Given a list of space-separated key=value pairs and a key,
returns a value corresponding to the key.

Fails with an error if the key is not found among the pairs.
"""

from __future__ import print_function

import argparse

from lib.args import KeyValuePairs


def key_value_pairs(string):
    names_and_values = map(lambda s: s.split('='), string)
    result = dict(names_and_values)
    return result


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('-p', '--pairs',
                        nargs='+', required=True, action=KeyValuePairs,
                        help="a list of space-separated key=value pairs")
    parser.add_argument('-k', '--key',
                        required=True,
                        help="a key to get a value for")

    args = parser.parse_args()

    if args.key not in args.pairs:
        parser.error("the key must be among the pairs")

    return args


def main():
    script_args = parse_args()

    value = script_args.pairs[script_args.key]
    print(value, end='')


if __name__ == '__main__':
    main()
