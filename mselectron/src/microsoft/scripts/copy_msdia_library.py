#!/usr/bin/env python3

"""
Copies a msdia*.dll to a location where it can be found by a dump_syms.exe
binary when it's run to generate breakpad symbols on Windows.
See the "Hacks and Workarounds" doc for details.
"""

import argparse
import os
import shutil

from lib import vs_toolchain
from lib.project_paths import SRC_DIR


# True for VS 2019, can be changed in the future.
DIA_DLL_NAME = 'msdia140.dll'


def parse_args():
    parser = argparse.ArgumentParser(
        description=f"Copy {DIA_DLL_NAME} to a directory"
                    " where Electron build scripts expect it to be")
    return parser.parse_args()


def main():
    parse_args()

    src = get_source_file_path()
    dst = get_destination_dir()
    print(f"Copying '{src}' to '{dst}'")
    shutil.copy(src, dst)


def get_source_file_path():
    visual_studio_path = vs_toolchain.get_visual_studio_path()
    # dump_syms.exe is an x86_64 binary.
    dia_sdk_bin_path = os.path.join(
        visual_studio_path, 'DIA SDK', 'bin', 'amd64')
    return os.path.join(dia_sdk_bin_path, DIA_DLL_NAME)


def get_destination_dir():
    return os.path.join(
        SRC_DIR, 'third_party', 'llvm-build', 'Release+Asserts', 'bin')


if __name__ == '__main__':
    main()
