# Copyright (C) Microsoft Corporation. All rights reserved.

import argparse
import shutil
import subprocess
import sys


def main(args):
    input_archs = subprocess.check_output(
        ['xcrun', 'lipo', '-archs', args.input], text=True
    ).split()
    if set(input_archs) == set(args.archs):
        shutil.copy(args.input, args.output)
    else:
        subprocess.check_call(
            ['xcrun', 'lipo', args.input, '-output', args.output]
            + [arg for arch in args.archs for arg in ['-extract', arch]]
        )
    # Grant the write permission to output binary to avoid the permission denied
    # error during codesign.
    subprocess.check_call(['chmod', 'u+w', args.output])
    if args.strip_symbols:
        subprocess.check_call(['xcrun', 'strip', '-S', '-x', args.output])


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True, help='Path to input binary')
    parser.add_argument('--output', required=True, help='Path to output binary')
    parser.add_argument(
        '--archs', required=True, nargs='+', help='Archs to keep'
    )
    parser.add_argument(
        '--strip-symbols',
        action='store_true',
        help='Remove debug and local symbols from the output binary',
    )
    main(parser.parse_args(sys.argv[1:]))
