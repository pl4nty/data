#!/usr/bin/env python3

import argparse
import os
import string
import sys

import lib.filesystem as fs
from lib.project_paths import SRC_DIR

LICENSES_DIR = os.path.join(SRC_DIR, 'tools', 'licenses')
sys.path.append(LICENSES_DIR)

import licenses  # pylint: disable=wrong-import-position


def parse_args():
    parser = argparse.ArgumentParser(
        description="Process a template text file")

    parser.add_argument('--template', '-t',
                        type=argparse.FileType('r'), required=True,
                        help="template to process")
    parser.add_argument('--data', nargs='+',
                        default=[],
                        help="key=value format")
    parser.add_argument('--output-dir', '-o',
                        required=True,
                        help="directory to write a resulting file to")
    parser.add_argument('--safe', action='store_true',
                        help="use the 'safe' substitute strategy")
    parser.add_argument('--licenses', '-l', action='store_true',
                        help="use the 'license texts' substitute strategy")

    return parser.parse_args()


def process_template(template_string, substitutions, safe=False):
    template_object = string.Template(template_string)
    if safe:
        result = template_object.safe_substitute(substitutions)
    else:
        result = template_object.substitute(substitutions)
    return result


class DirDict(dict):
    def __missing__(self, key):
        path = os.path.join('third_party', key)
        if key == "electron_node":
            name = "Node.js"
            license_paths = [licenses.AbsolutePath(
                path, 'LICENSE', licenses._REPOSITORY_ROOT)]
        else:
            metadata_list = licenses.ParseDir(path, licenses._REPOSITORY_ROOT)
            if len(metadata_list) == 0:
                raise RuntimeError(f"Couldn't find metadata for '{path}'")

            metadata = metadata_list[0][0]
            name = metadata['Name']
            license_paths = metadata['License File']

        licenses_text = [fs.read_file(p, encoding='utf-8')
            for p in license_paths]
        return '\n\n'.join([name] + licenses_text)


def parse_substitutions(data, insert_licenses=False):
    pairs = [pair.split('=') for pair in data]
    if insert_licenses:
        return DirDict(pairs)
    return dict(pairs)


def get_output_file_path(input_file, output_dir):
    base_name = os.path.basename(input_file)
    file_path = os.path.join(output_dir, base_name)
    return file_path


def main():
    script_args = parse_args()

    substitutions = parse_substitutions(script_args.data, script_args.licenses)
    template_contents = script_args.template.read()
    processed_template = process_template(template_contents,
                                          substitutions,
                                          script_args.safe)

    file_path = get_output_file_path(script_args.template.name,
                                     script_args.output_dir)
    fs.write_to_file(text=processed_template, file_path=file_path,
                     newline='\n')


if __name__ == '__main__':
    main()
