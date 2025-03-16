#!/usr/bin/env python3

import argparse
import sys

from lib.args import boolean_string


def parse_args():
    parser = argparse.ArgumentParser(
        description="Set a job variable on Azure Pipelines")

    parser.add_argument('--name',
                        help="variable name")
    parser.add_argument('--is-output',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="make the variable available to further jobs")
    parser.add_argument('--is-secret',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="make it a secret variable")

    value = parser.add_mutually_exclusive_group()
    value.add_argument('--value',
                       help="variable value")
    value.add_argument('--value-from', type=argparse.FileType('r'),
                       default=sys.stdin,
                       help="read value from a file")

    return parser.parse_args()


def format_boolean(value):
    return 'true' if value else 'false'


def set_variable(name, value, is_output, is_secret):
    template = "##vso[task.setvariable variable={name};" \
               "isOutput={is_output};issecret={is_secret};]{value}"
    string_to_print = template.format(**{
        'name': name,
        'value': value,
        'is_output': format_boolean(is_output),
        'is_secret': format_boolean(is_secret),
    })
    print(string_to_print)


def main():
    script_args = parse_args()

    value = (script_args.value
             if script_args.value is not None
             else script_args.value_from.read())

    # Strip all whitespace including new lines.
    # Sometimes it's difficult to pipe properly formatted value to stdin.
    value = value.strip()

    set_variable(name=script_args.name,
                 value=value,
                 is_output=script_args.is_output,
                 is_secret=script_args.is_secret)


if __name__ == '__main__':
    main()
