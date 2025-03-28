#!/usr/bin/env python3

# The code below is taken from
# https://github.com/electron/electron/blob/3a94634ae559e5e9cc41e26b56af95a3f916a7f9/build/profile_toolchain.py
# Right before
# "ci: bake appveyor images automatically, run sync on depshash change"
# https://github.com/electron/electron/pull/35396

from __future__ import unicode_literals

import contextlib
import sys
import os
import optparse
import json
import re
import subprocess

sys.path.append(f"{os.path.dirname(os.path.realpath(__file__))}/../../build")

import find_depot_tools
from vs_toolchain import \
    SetEnvironmentAndGetRuntimeDllDirs, \
    SetEnvironmentAndGetSDKDir, \
    NormalizePath

sys.path.append(f"{find_depot_tools.add_depot_tools_to_path()}/win_toolchain")

from get_toolchain_if_necessary import CalculateHash


@contextlib.contextmanager
def cwd(directory):
    curdir = os.getcwd()
    try:
        os.chdir(directory)
        yield
    finally:
        os.chdir(curdir)


def calculate_hash(root):
    with cwd(root):
        return CalculateHash('.', None)

def windows_installed_software():
    powershell_cmd = [
        "Get-CimInstance",
        "-Namespace",
        "root\cimv2",
        "-Class",
        "Win32_product",
        "|",
        "Select",
        "vendor,",
        "description,",
        "@{l='install_location';e='InstallLocation'},",
        "@{l='install_date';e='InstallDate'},",
        "@{l='install_date_2';e='InstallDate2'},",
        "caption,",
        "version,",
        "name,",
        "@{l='sku_number';e='SKUNumber'}",
        "|",
        "ConvertTo-Json",
    ]

    with subprocess.Popen(["powershell.exe", "-Command", "-"],
                          stdin=subprocess.PIPE,
                          stdout=subprocess.PIPE) as proc:
        stdout, _ = proc.communicate(" ".join(powershell_cmd).encode("utf-8"))

        if proc.returncode != 0:
            raise RuntimeError("Failed to get list of installed software")

        # On AppVeyor there's other output related to PSReadline,
        # so grab only the JSON output and ignore everything else
        json_match = re.match(
            r".*(\[.*{.*}.*\]).*", stdout.decode("utf-8"), re.DOTALL
        )

        if not json_match:
            raise RuntimeError(
                "Couldn't find JSON output for list of installed software"
            )

        # Filter out missing keys
        return list(
            map(
                lambda info: {k: info[k] for k in info if info[k]},
                json.loads(json_match.group(1)),
            )
        )


def windows_profile():
    runtime_dll_dirs = SetEnvironmentAndGetRuntimeDllDirs()
    win_sdk_dir = SetEnvironmentAndGetSDKDir()
    path = NormalizePath(os.environ['GYP_MSVS_OVERRIDE_PATH'])

    # since current windows executable are symbols path dependant,
    # profile the current directory too
    return {
        'pwd': os.getcwd(),
        'installed_software': windows_installed_software(),
        'sdks': [
            {'name': 'vs', 'path': path, 'hash': calculate_hash(path)},
            {
                'name': 'wsdk',
                'path': win_sdk_dir,
                'hash': calculate_hash(win_sdk_dir),
            },
        ],
        'runtime_lib_dirs': runtime_dll_dirs,
    }


def main(options):
    if sys.platform == 'win32':
        with open(options.output_json, mode='w', encoding='utf-8') as f:
            json.dump(windows_profile(), f)
    else:
        raise OSError("Unsupported OS")


if __name__ == '__main__':
  parser = optparse.OptionParser()
  parser.add_option('--output-json', metavar='FILE', default='profile.json',
                    help='write information about toolchain to FILE')
  opts, args = parser.parse_args()
  sys.exit(main(opts))
