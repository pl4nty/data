#!/usr/bin/env python3

import argparse
import json
import logging
import os
from urllib.request import urlretrieve
from lib.filesystem import mkdir_p


def parse_args():
    parser = argparse.ArgumentParser(
        description="Download Linux sysroots used by Electron")
    parser.add_argument('--config', '-c',
                        type=argparse.FileType('r'), required=True,
                        help='sysroots\' config in the JSON format')
    parser.add_argument('--save-to', '-o',
                        type=os.path.abspath, required=True,
                        help="directory to save sysroots to")
    return parser.parse_args()


def download_sysroot(url_prefix, tarball_sha256sum, output_dir):
    # The pattern below is defined in the Chromium's file
    # "build/linux/sysroot_scripts/install-sysroot.py".
    url = f'{url_prefix}/{tarball_sha256sum}'

    output_path = os.path.join(output_dir, tarball_sha256sum)
    # Make sure the folder exists.
    mkdir_p(os.path.dirname(output_path))

    logging.info('Saving "%s" to "%s"', url, output_path)
    urlretrieve(url, output_path)


def download_sysroots(config, output_dir):
    for sysroot_data in config.values():
        tarball_sha256sum = sysroot_data['Sha256Sum']
        # The "URL" field contains an URL of our own container
        # that is used in builds.
        url_prefix = sysroot_data['URL']
        download_sysroot(url_prefix, tarball_sha256sum, output_dir)


def main():
    script_args = parse_args()

    config = json.load(script_args.config)
    download_sysroots(config=config,
                      output_dir=script_args.save_to)


if __name__ == '__main__':
    main()
