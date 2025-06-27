#!/usr/bin/env python3

"""
Generate a wiki page for a Microsoft Electron release.
https://microsoft.sharepoint.com/teams/Electron/Electron%20Releases/Forms/AllItems.aspx

Uses Jinja2 template language, see http://jinja.pocoo.org/docs/2.10/.
"""

# Examples:
#
# python generate_release_wiki.py \
# -e electron=3168414 vscode=3168415 \
# -r 10e9dba21847926198193a4f46830f88712b72bd
#
# python generate_release_wiki.py -o output.html -v 4.2.7 \
# -e electron=3168414 vscode=3168415 \
# -r 10e9dba21847926198193a4f46830f88712b72bd
#
# python generate_release_wiki.py -v 13.1.8 \
# -e electron=9291435 vscode=9291438 \
# -r 42dd3e3e76109793b13f31d0c84d11953a25591d

import argparse
import os

from jinja2 import Environment, FileSystemLoader
from lib.args import KeyValuePairs
from lib.build_flavour import ElectronFlavour, FFmpegFlavour
from lib.filesystem import write_to_file
from lib.project_paths import REPO_ROOT_DIR
from lib.versions import get_electron_version_from_microsoft_deps


TEMPLATE_DIRECTORY = os.path.join(REPO_ROOT_DIR, 'configs', 'templates')
TEMPLATE_FILE_NAME = 'release_wiki_page.html'


def get_short_version(electron_version_string):
    version_components = electron_version_string.split('.')
    return f'{version_components[0]}.{version_components[1]}'


def get_builds_data(builds, get_description):
    # Preserve flavours order in the resulting list.
    flavours = sorted(builds.keys())

    return map(lambda flavour: {
        'description': get_description(flavour),
        'flavour': flavour,
        'id': builds[flavour],
    }, flavours)


def generate_wiki_page(electron_version, source_version,
    electron_builds, ffmpeg_builds):
    meta = {
        'base_url': 'https://msftelectronbuilds.z5.web.core.windows.net',
        'base_url_nonprod': 'https://msftelectronbuild.z5.web.core.windows.net',
        'revision': source_version,
        'short_version': get_short_version(electron_version),
        'version': electron_version,
    }
    electron = {
        'builds': get_builds_data(
            electron_builds,
            ElectronFlavour.get_description),
    }
    ffmpeg = {
        'builds': get_builds_data(
            ffmpeg_builds,
            FFmpegFlavour.get_description),
    }

    env = Environment(loader=FileSystemLoader(TEMPLATE_DIRECTORY))
    template = env.get_template(TEMPLATE_FILE_NAME)
    return template.render(meta=meta, electron=electron, ffmpeg=ffmpeg)


def parse_args():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)

    parser.add_argument(
        '-v', '--version', required=False,
        default=get_electron_version_from_microsoft_deps(strip_leading_v=True),
        help="Electron version")
    parser.add_argument(
        '-r', '--revision', required=True,
        help="source version")
    parser.add_argument(
        '-o', '--output-file', required=False, type=os.path.abspath,
        help="optional output file path")

    electron_flavours = ElectronFlavour.get_all()
    parser.add_argument(
        '-e', '--electron-builds', required=True,
        nargs=len(electron_flavours), action=KeyValuePairs,
        help="build flavours and ids in the 'flavour_name=build_id' format. "
             f"Current flavours are [{', '.join(electron_flavours)}[")

    ffmpeg_flavours = FFmpegFlavour.get_all()
    parser.add_argument(
        '-f', '--ffmpeg-builds', required=True,
        # Do not expect a build for the "slim" flavour of FFmpeg
        # to be provided.
        nargs=len(ffmpeg_flavours) - 1, action=KeyValuePairs,
        help="build flavours and ids in the 'flavour_name=build_id' format. "
             f"Current flavours are [{', '.join(ffmpeg_flavours)}]")

    return parser.parse_args()


def main():
    script_args = parse_args()

    wiki_page_data = generate_wiki_page(
        script_args.version, script_args.revision,
        script_args.electron_builds, script_args.ffmpeg_builds)

    if script_args.output_file is None:
        print(wiki_page_data)
    else:
        write_to_file(wiki_page_data, script_args.output_file)


if __name__ == '__main__':
    main()
