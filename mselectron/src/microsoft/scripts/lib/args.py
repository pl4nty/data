"""
Various utils to work with Python script arguments.
"""

import argparse


def boolean_string(value):
    if isinstance(value, str):
        lowercased_value = value.lower()

        if lowercased_value == 'true':
            return True
        if lowercased_value == 'false':
            return False

    raise TypeError(f"got unexpected value {value}")


def parse_key_value_pairs(key_value_pairs):
    if key_value_pairs is None:
        return None

    names_and_values = map(lambda s: s.split('='), key_value_pairs)
    return dict(names_and_values)


class KeyValuePairs(argparse.Action):
    def __call__(self, parser, namespace, values, option_string=None):
        setattr(namespace, self.dest, parse_key_value_pairs(values))


def comma_separated_list(string):
    return list(filter(lambda v: v != '', string.split(',')))
