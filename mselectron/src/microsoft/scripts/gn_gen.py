#!/usr/bin/env python3

"""
Generate Ninja.
"""

import argparse
import os
import re
import subprocess
import sys

from lib.args import boolean_string
from lib.build_flavour import ElectronFlavour, FFmpegFlavour
from lib.canonical_arch import CanonicalArch
from lib.canonical_platform import CanonicalPlatform
from lib.filesystem import print_file, read_file
from lib.gn import gn
from lib.project_paths import REPO_ROOT_DIR
from lib.versions import get_electron_version_from_microsoft_deps

from gn_check import gn_check_all


# "none" is a special value to indicate no additional
# FFmpeg build flags should be used.
# It's only here to simplify this script usage from YAML configs.
FFMPEG_FLAVOUR_NONE = 'none'


class BuildConfig:
    TESTING = 'testing'
    RELEASE = 'release'

    @staticmethod
    def get_all():
        return (
            BuildConfig.TESTING,
            BuildConfig.RELEASE,
        )

    @staticmethod
    def get_import_path(name):
        return f'//electron/build/args/{name}.gn'


def get_build_flavour_config_path(flavour):
    path = os.path.join(REPO_ROOT_DIR, 'build', 'config',
                        f'{flavour}.args.gni')
    return path


class GetFFmpegFlavourConfigPath(argparse.Action):
    def __call__(self, parser, namespace, values, option_string=None):
        config_path = None if values == FFMPEG_FLAVOUR_NONE \
            else FFmpegFlavour.get_config_path(flavour=values)
        setattr(namespace, self.dest, config_path)


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument('out_dir', type=os.path.relpath,
                        help="output dir path, e.g. 'out/testing'")
    parser.add_argument('--args', nargs='*',
                        help="build arguments in 'key=value' format "
                             "to override values in configs. "
                             "Escape double quotes for string values, "
                             "e.g. target_cpu=\\\"x64\\\"")
    parser.add_argument('--check', action='store_true',
                        help="run 'gn check' after 'gn gen'")
    ffmpeg_flavours = FFmpegFlavour.get_all() + (FFMPEG_FLAVOUR_NONE,)
    parser.add_argument('--ffmpeg', dest='ffmpeg_flavour_config',
                        required=False, choices=ffmpeg_flavours,
                        action=GetFFmpegFlavourConfigPath,
                        help="FFmpeg flavour")
    parser.add_argument('--for', dest='build_flavour_config', required=True,
                        choices=ElectronFlavour.get_all(),
                        help="Electron flavour")
    parser.add_argument('--print',
                        dest='print_the_config',  # Can't use `args.print`.
                        action='store_true', default=False,
                        help='print the config created')
    # https://chromium.googlesource.com/chromium/src/+/HEAD/docs/asan.md
    parser.add_argument('--asan',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="build with ASan")
    parser.add_argument('--mas',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="build for Mac App Store")
    parser.add_argument('--siso',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="use siso")
    parser.add_argument('--custom-pgo',
                        type=boolean_string, nargs='?',
                        default=False, const=True,
                        help="build with custom PGO profiles")

    config = parser.add_mutually_exclusive_group(required=True)
    config.add_argument('--build-config',
                        choices=BuildConfig.get_all(),
                        help="a build config type")
    for build_config in BuildConfig.get_all():
        config.add_argument(f'--{build_config}', dest='build_config',
                            action='store_const', const=build_config,
                            help=f'use the {build_config} build config')

    args = parser.parse_args()

    # Additional rules.
    if args.mas and not CanonicalPlatform.is_host_mac():
        parser.error("Build for Mac App Store is available only on macOS")

    if args.build_config is not None:
        args.build_config = BuildConfig.get_import_path(args.build_config)

    return args


def gn_gen(build_dir, build_args=None, print_the_config=False, check=False):
    gn_args = ['gen', build_dir]
    if build_args:
        build_args_string = '--args=' + ' '.join(build_args)
        gn_args.append(build_args_string)
    gn(gn_args)

    if print_the_config:
        config_path = os.path.join(build_dir, 'args.gn')
        print_file(config_path)

    if check:
        gn_check_all(build_dir)


def get_build_args(configs_to_import=None, configs_to_inline=None,
                   other_args=None):
    build_args = []

    # Import configs first.
    if configs_to_import:
        build_args += generate_gn_import_statements(configs_to_import)

    # Then inline values from other configs.
    if configs_to_inline:
        for config_path in configs_to_inline:
            build_args += list_values(config_path)

    # And the other args should go last to override configs' values.
    if other_args:
        build_args += other_args

    return build_args


def generate_gn_import_statements(paths):
    return [f'import("{p}")' for p in paths if p is not None]


def list_values(file_path=None):
    if file_path is None:
        return []

    lines = read_file(file_path, as_lines=True)
    values = [extract_key_value_pair(line) for line in lines]
    return values


def extract_key_value_pair(line):
    # Strip a comment.
    if '#' in line:
        index = line.index('#')
        line = line[:index]

    # Strip whitespace.
    line = line.strip()

    return line


def get_siso_args(use_siso=False):
    if not use_siso:
        return None

    return [        
        "use_remoteexec=true",
        "use_siso=true",
        "use_reclient=false"
    ]


def get_target_cpu(script_args):
    if script_args.args:
        pattern = r'target_cpu\s*=\s*"([^"]+)"'
        match = None
        for arg in script_args.args:
            if re.search(pattern, arg):
                match = re.search(pattern, arg)
        if match:
            return match.group(1)
    return CanonicalArch.get_host_arch()


def get_electron_version_arg():
    version = get_electron_version_from_microsoft_deps(
        strip_leading_v=True)
    return f'override_electron_version="{version}"'


def main():
    script_args = parse_args()

    other_build_args = [get_electron_version_arg()] + \
                       (get_siso_args(script_args.siso) or []) + \
                       (script_args.args or [])
    if CanonicalPlatform.is_host_mac():
        sdk_path = os.environ.get('XCODE_LINKS_PATH', '')
        sdk_arg = f'mac_sdk_path="//{script_args.out_dir}/{sdk_path}"'
        other_build_args += [ sdk_arg ]
    build_args = get_build_args(configs_to_import=[
        script_args.build_config,
    ], configs_to_inline=[
        get_build_flavour_config_path(script_args.build_flavour_config),
        script_args.ffmpeg_flavour_config,
        (get_build_flavour_config_path('asan') if script_args.asan else None),
        (get_build_flavour_config_path('mas') if script_args.mas else None),
    ], other_args=other_build_args)

    # Pass custom PGO profile.
    if script_args.custom_pgo and \
       script_args.build_flavour_config != 'electron':
        call_args = [
            sys.executable,
            os.path.join(REPO_ROOT_DIR, 'scripts', 'get_pgo_profile_path.py'),
            '--flavour', script_args.build_flavour_config,
            '--target-cpu', get_target_cpu(script_args),
        ]
        pgo_data_path = subprocess.check_output(call_args, text=True)
        build_args.append(f'pgo_data_path="{pgo_data_path}"')

    gn_gen(build_dir=os.path.abspath(script_args.out_dir),
           build_args=build_args,
           print_the_config=script_args.print_the_config,
           check=script_args.check)


if __name__ == '__main__':
    main()
