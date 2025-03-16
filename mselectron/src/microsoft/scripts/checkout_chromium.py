#!/usr/bin/env python3

"""
Check out Chromium from the Google repo.
"""

import argparse
import os
import subprocess

from lib.canonical_platform import CanonicalPlatform
from lib.deps import get as get_deps
from lib.filesystem import mkdir_p
from lib.gclient import gclient, config as gclient_config
from lib.project_paths import ELECTRON_DIR
from gclient_sync import gclient_sync

CHROMIUM_REPO_URL = 'https://chromium.googlesource.com/chromium/src.git'


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--platform',
                        required=False, choices=CanonicalPlatform.get_all(),
                        default=CanonicalPlatform.from_system())
    parser.add_argument('-r', '--revision',
                        required=True,
                        help="e.g. '69.0.3497.106'")
    parser.add_argument('-u', '--url',
                        required=False, default=CHROMIUM_REPO_URL,
                        help="the repository URL")
    parser.add_argument('-o', '--output-dir',
                        required=False, default=os.getcwd(),
                        help="defaults for the current directory")
    parser.add_argument('--git-cache',
                        required=False, default=None,
                        help="git cache directory")
    parser.add_argument('-d', '--install-build-deps',
                        required=False, default=False)

    return parser.parse_args()


def install_linux_build_deps(checkout_dir):
    script_to_run = os.path.join(checkout_dir,
                                 'src', 'build', 'install-build-deps.sh')
    script_args = [
        '--arm',
        '--lib32',
        '--no-chromeos-fonts',
        '--no-prompt',
        '--syms',
    ]

    call_args = [script_to_run] + script_args
    subprocess.check_call(call_args)


def checkout_chromium(revision, output_dir, repo_url=CHROMIUM_REPO_URL,
                      git_cache=None, install_build_deps=False,
                      platform=CanonicalPlatform.from_system()):
    mkdir_p(output_dir)
    os.chdir(output_dir)

    # Create a gclient config in the current dir
    # passing all "vars" from the Electron DEPS as custom vars.
    custom_vars = get_deps(ELECTRON_DIR)['vars']

    # Exclude some Electron's gclient flags.
    for var in [
        # Electron overrides Chromium's sysroots configs with its own.
        # Since we check out Chromium without Electron, we can't use
        # the Electron's config.
        'sysroots_json_path',
    ]:
        custom_vars.pop(var)

    if not CanonicalPlatform.is_host(platform):
        if platform == CanonicalPlatform.MAC:
            custom_vars["checkout_mac"] = True
            custom_vars["checkout_linux"] = False
            custom_vars["host_os"] = "mac"
        elif platform == CanonicalPlatform.WINDOWS:
            custom_vars["checkout_win"] = True
            custom_vars["checkout_linux"] = False
            custom_vars["host_os"] = "win"
    gclient_config(url=repo_url,
                   cache_dir=git_cache,
                   custom_vars=custom_vars,
                   print_the_config=True)

    # Get dependencies.
    gclient_sync(revision=revision, run_hooks=False)

    # See https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md  # pylint: disable=line-too-long
    is_linux = platform == CanonicalPlatform.LINUX
    if is_linux and install_build_deps:
        install_linux_build_deps(checkout_dir='.')

    gclient('runhooks')


def main():
    script_args = parse_args()

    checkout_chromium(revision=script_args.revision,
                      output_dir=script_args.output_dir,
                      repo_url=script_args.url,
                      git_cache=script_args.git_cache,
                      install_build_deps=script_args.install_build_deps,
                      platform=script_args.platform)


if __name__ == '__main__':
    main()
