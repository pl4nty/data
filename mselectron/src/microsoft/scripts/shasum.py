#!/usr/bin/env python3

"""
Calculate checksum for a single file or a set of files.
"""

from __future__ import print_function

import argparse
import os

import lib.filesystem as fs
from lib.shasum import FileListHasher


class Algorithm:
    SHA1 = 'sha1'
    SHA256 = 'sha256'

    @staticmethod
    def get_all():
        return (
            Algorithm.SHA1,
            Algorithm.SHA256,
        )


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)

    target = parser.add_mutually_exclusive_group(required=True)
    target.add_argument('-f', '--file',
                        type=os.path.abspath, nargs='+',
                        help="file path(s)")
    target.add_argument('-d', '--directory',
                        type=os.path.abspath,
                        help="a directory path, "
                             "all its files will be processed recursively")

    as_binary = parser.add_mutually_exclusive_group(required=False)
    as_binary.add_argument('-b', '--binary',
                           action='store_true', dest='as_binary',
                           help="read in binary mode")
    as_binary.add_argument('-t', '--text',
                           action='store_false', dest='as_binary',
                           help="read in text mode")

    parser.add_argument('-o', '--output',
                        type=os.path.abspath, required=False,
                        help="an output file path")

    algorithm = parser.add_mutually_exclusive_group(required=True)
    algorithm.add_argument('-a', '--algorithm', choices=Algorithm.get_all(),
                           help="algorithm to use")
    algorithm.add_argument('--sha1', action='store_const',
                           dest='algorithm', const=Algorithm.SHA1,
                           help="use the SHA1 algorithm")
    algorithm.add_argument('--sha256', action='store_const',
                           dest='algorithm', const=Algorithm.SHA256,
                           help="use the SHA256 algorithm")

    return parser.parse_args()


def get_hasher(files, directory):
    """Only one of |files| or |directory| is not None."""

    if files is not None:
        return FileListHasher(files, os.getcwd())

    if directory is not None:
        return FileListHasher.from_directory(directory, recursive=True)

    raise ValueError("Either `files` or `directory` argument must not be None")


def main():
    script_args = parse_args()

    # Calculate list of file(s) hashes.
    file_list_hasher = get_hasher(script_args.file, script_args.directory)
    output_text = file_list_hasher.get_formatted_hashes(
        script_args.algorithm, script_args.as_binary)

    # Write the result either to stdout or to a file.
    if script_args.output is None:
        print(output_text, end='')
    else:
        fs.write_to_file(text=output_text,
                         file_path=script_args.output)


if __name__ == '__main__':
    main()
