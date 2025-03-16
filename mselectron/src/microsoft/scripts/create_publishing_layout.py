#!/usr/bin/env python3

import argparse
import itertools
import json
import os
import string

import lib.filesystem as fs
from lib.shasum import FileListHasher
from lib.supported_platforms import get as get_supported_platforms


def parse_args():
    parser = argparse.ArgumentParser(
        description='Create a files layout for publishing a distribution')

    parser.add_argument('-c', '--config', dest='config_file',
                        type=argparse.FileType('r'), required=True,
                        help="publishing layout config file")
    parser.add_argument('--data', nargs='+',
                        help="additional data for templates, "
                             "key=value[,another_value[,<...>]] format")
    parser.add_argument('-i', '--input-dir',
                        type=os.path.abspath, required=True,
                        help="a directory to copy files from")
    parser.add_argument('-o', '--output-dir',
                        type=os.path.abspath, required=True,
                        help="a directory to copy files to")
    parser.add_argument('--dry-run', action='store_true',
                        help='only print what is supposed to do')
    parser.add_argument('--shasums-dir', type=os.path.abspath)

    return parser.parse_args()


def get_substitutions_combinations(additional_data):
    """Generate a list of substitution dicts
    with all possible values' combinations.
    """
    substitutions = get_supported_platforms()

    if additional_data is not None:
        for name, values in additional_data.items():
            # E.g. ('version', ['1.0', '2.0']) ->
            # [{'version': '1.0'}, {'version': '2.0'}]
            data_items = get_list_of_dicts(name, values)

            # All possible combinations of the existing substitutions
            # and the additional data values.
            substitutions = get_all_combinations(substitutions, data_items)

    return substitutions


def get_list_of_dicts(name, values):
    """Converts a list of arbitrary values to a list of dictionaries
    where every dictionary has a single property named `name` with a value
    from the values list.
    E.g. ('number', [1, 2]) -> [{'number': 1}, {'number': 2}].
    """
    return [{name: value} for value in values]


def get_all_combinations(list_one, list_two):
    """Creates a list of all combinations of dicts from two lists,
    then merges every combination into a single dict.
    """
    combinations = list(itertools.product(list_one, list_two))
    flattened_combinations = list(map(lambda c: merge_dicts(*c), combinations))
    return flattened_combinations


def merge_dicts(list_one, list_two):
    new_list = list_one.copy()
    new_list.update(list_two)
    return new_list


def get_mapped_substitutions(substitutions, mapping_config):
    if mapping_config is None:
        return substitutions

    mapped_substitutions = {}
    for key, value in substitutions.items():
        mapped_value = value
        if key in mapping_config and value in mapping_config[key]:
            mapped_value = mapping_config[key][value]
        mapped_substitutions[key] = mapped_value

    return mapped_substitutions


def parse_additional_data(key_value_strings):
    """Convert a list of 'key=value1[,value2[,<...>]]' strings
    to a {key: [value1, value2, ...], ...} dict.
    """

    if key_value_strings is None:
        return None

    data = dict([parse_additional_data_item(s) for s in key_value_strings])
    return data


def parse_additional_data_item(key_value_string):
    key, value = key_value_string.split('=')
    values = value.split(',')
    return key, values


def get_files_mapping(layout, substitutions, substitutions_mapping):
    files_mapping = {}

    for element in layout:
        # One-to-one mapping.
        if isinstance(element, str):
            files_mapping[element] = element

        # A files group template.
        if isinstance(element, dict):
            expansion_result = expand_template(element, substitutions,
                                               substitutions_mapping)
            files_mapping.update(expansion_result)

    input_files = list(files_mapping.values())
    output_files = list(files_mapping.keys())
    return input_files, output_files


def expand_template(template_element, substitutions, substitutions_mapping):
    # Keys which names start with two underscores (e.g. "__name") are magical.
    regular_keys = list(filter(
        lambda k: not k.startswith('__'), template_element.keys()))
    template_key = regular_keys[0]  # There must be exactly one regular key.

    # Filter the substitutions if a filter it defined.
    if '__filter__' in template_element:
        pattern = template_element['__filter__']
        substitutions = list(filter(
            lambda s: dict_matches(s, pattern), substitutions))

    # The left part (the key) is the output template,
    # the right one - the input template.
    output_template = template_key
    input_template = template_element[template_key]

    files_group = create_files_group_by_template(input_template,
                                                 output_template,
                                                 substitutions,
                                                 substitutions_mapping)
    return files_group


def create_files_group_by_template(input_template,
                                   output_template,
                                   input_substitutions,
                                   output_substitutions_mapping):
    files_group = {}

    for input_dictionary in input_substitutions:
        # Apply optional mapping for an output template substitutions.
        output_dictionary = get_mapped_substitutions(
            input_dictionary,
            output_substitutions_mapping)

        input_file = apply_substitutions(input_template, input_dictionary)
        output_file = apply_substitutions(output_template, output_dictionary)

        files_group[output_file] = input_file

    return files_group


def apply_substitutions(template_string, substitutions):
    try:
        return string.Template(template_string).substitute(substitutions)
    except KeyError as key:
        message = "Key {} used in the template '{}' " \
              "is not found in the substitutions list:"
        print(message.format(key, template_string))
        print(substitutions)
        raise


def create_checksum_files(configs, directory_path, shasums_dir):
    if configs is None:
        return

    # Create checksum files in a temporary folder first
    # and then move all of them to the directory_path.
    with fs.get_temp_folder() as temp_folder:
        # A list of relative paths.
        files = [create_checksum_file(directory_path, config['algorithm'],
                                      config.get('as_binary', False),
                                      config.get('format_marker', None),
                                      temp_folder, config['output'],
                                      config.get('include_file_paths', True))
                 for config in configs]
        if shasums_dir is not None:
            sha_destination = shasums_dir
        else:
            sha_destination = directory_path
        fs.mirror_files(source_dir=temp_folder,
                        source_files=files,
                        destination_dir=sha_destination)


def create_checksum_file(directory_path, algorithm, as_binary, format_marker,
                         output_directory, output_file, include_file_paths):
    hasher = FileListHasher.from_directory(directory_path, recursive=True)
    text = hasher.get_formatted_hashes(algorithm, as_binary, format_marker, 
                                       include_file_paths)

    output_file_path = os.path.join(output_directory, output_file)
    fs.write_to_file(text=text, file_path=output_file_path)

    # Return a path relative to the output_folder.
    return output_file


def dict_matches(dictionary, pattern):
    """The |dictionary| should have all keys of the |pattern| dict
    with the same values.
    """
    for pattern_key, pattern_value in pattern.items():
        if not pattern_key in dictionary:
            return False
        if dictionary[pattern_key] != pattern_value:
            return False
    return True


def main():
    script_args = parse_args()

    config = json.load(script_args.config_file)
    layout = config['layout']
    mapping = config.get('mapping', None)
    checksums = config.get('checksums', None)

    additional_data = parse_additional_data(script_args.data)
    substitutions = get_substitutions_combinations(additional_data)

    input_files, output_files = get_files_mapping(
        layout, substitutions, mapping)

    if script_args.dry_run:
        for input_file, output_file in zip(input_files, output_files):
            print(f"{input_file} -> {output_file}")
    else:
        fs.mirror_files(source_dir=script_args.input_dir,
                        source_files=input_files,
                        destination_dir=script_args.output_dir,
                        destination_files=output_files,
                        use_hardlinks=True)
        create_checksum_files(checksums, script_args.output_dir,
                              script_args.shasums_dir)


if __name__ == '__main__':
    main()
