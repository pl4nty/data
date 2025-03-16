#!/usr/bin/env python3

import argparse
import os
import subprocess
import zipfile

from lib.canonical_arch import CanonicalArch
import lib.filesystem as fs


def parse_args():
    parser = argparse.ArgumentParser(
        description="Pack files with debugging info into an archive")

    parser.add_argument('--file', nargs='+',
                        type=os.path.abspath, required=True,
                        help="absolute file path")
    parser.add_argument('--zip-path',
                        type=os.path.abspath, required=True,
                        help="a resulting archive path")

    return parser.parse_args()


def get_objcopy_name(arch):
    if arch == CanonicalArch.ARM:
        return 'arm-linux-gnueabihf-objcopy'

    if arch == CanonicalArch.ARM64:
        return 'aarch64-linux-gnu-objcopy'

    return 'objcopy'


def get_binary_arch(file_path):
    file_info = subprocess.check_output(['file', file_path], text=True)

    if '32-bit' in file_info and 'ARM' in file_info:
        return CanonicalArch.ARM

    if 'aarch64' in file_info:
        return CanonicalArch.ARM64

    if 'x86-64' in file_info:
        return CanonicalArch.X64

    return None


def run_objcopy(src, dst):
    if fs.exists(dst):
        raise Exception(f"{dst} already exists, aborting")

    binary_arch = get_binary_arch(src)
    objcopy = get_objcopy_name(binary_arch)
    subprocess.check_call([objcopy, '--only-keep-debug', src, dst])


def get_output_file_path(file_path, output_directory):
    """Generate a path string in the output_directory
    for the file_path provided.
    """
    basename = os.path.basename(file_path)
    dbg_file_name = f'{basename}.dbg'
    output_file_path = os.path.join(output_directory, dbg_file_name)
    return output_file_path


def create_dbg_files(files_paths, output_directory):
    """Create a file with debugging info in the output_directory
    for every file in the files_paths list.
    """
    for file_path in files_paths:
        output_file_path = get_output_file_path(file_path, output_directory)
        run_objcopy(file_path, output_file_path)


def pack_directory_files(directory_path, zip_path):
    """Pack immediate children files of a directory into a zip archive."""
    with zipfile.ZipFile(zip_path, mode='w', compression=zipfile.ZIP_DEFLATED,
                         allowZip64=True) as zip_file:
        for file_path in os.listdir(directory_path):
            absolute_path = os.path.join(directory_path, file_path)
            zip_file.write(absolute_path, file_path)


def create_archive(files_paths, zip_path):
    with fs.get_temp_folder() as temp_directory:
        create_dbg_files(files_paths, temp_directory)
        pack_directory_files(temp_directory, zip_path)


def main():
    script_args = parse_args()
    create_archive(script_args.file, script_args.zip_path)


if __name__ == '__main__':
    main()
