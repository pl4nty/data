#!/usr/bin/env python3

'''
Find versions of Chromium and Electron that we have not mirrored yet
'''

from urllib.request import urlopen

import argparse
import json
import os
import re
import sys

from lib.git import git
from lib.project_paths import MICROSOFT_DIR


def parse_args():
    '''Parse command-line arguments'''
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('--chromium', action='store_true',
                       help='show unmirrored Chromium versions')
    group.add_argument('--electron', action='store_true',
                       help='show unmirrored Electron versions')
    return parser.parse_args()


def get_supported_electron_version_regexes() -> list[re.Pattern]:
    '''get a list of regexes to test for supported electron versions'''
    supported_versions_file = os.path.join(
        MICROSOFT_DIR,
        'configs',
        'mirror_repos',
        'electron_electron',
        'config.json'
    )

    tag_regexes: list[re.Pattern] = []
    with open(supported_versions_file, mode='r', encoding='utf-8') as fp:
        # example: 'v99.*'
        for pattern in json.load(fp)['tags']['include']:
            tag_regexes.append(re.compile(str(pattern)))
    return tag_regexes


def get_all_electron_releases():
    '''get a list of objects of electron releases'''
    releases_url = 'https://releases.electronjs.org/releases.json'
    return json.loads(urlopen(releases_url).read())


def is_stable_electron_version(version) -> bool:
    '''return true iff |version| is a stable release'''
    return version and '-' not in version


def get_stable_supported_electron_releases():
    '''get a list of objects of stable, supported releases'''
    releases = []
    regexes = get_supported_electron_version_regexes()
    for release in get_all_electron_releases():
        try:
            version = 'v' + release['version']
            if not is_stable_electron_version(version):
                continue
            if not any(regex.match(version) for regex in regexes):
                continue
            releases.append(release)
        except KeyError:
            print(f'skipping {release}', file=sys.stderr)
    return releases


def get_mirrored_electron_versions() -> list[str]:
    '''get a list of versions we have already mirrored'''

    # example: refs/tags/v99.0.0
    repo = 'https://devdiv.visualstudio.com/DevDiv/_git/electron-electron'
    prefix = 'refs/tags/v'
    tag_regex = re.compile(
        '^' + prefix +
        '(\\d+)\\.(\\d+)\\.(\\d+)$')

    versions = []
    for line in git('ls-remote', '--tags', repo).splitlines():
        for word in line.split():
            if tag_regex.match(word):
                versions.append(word.removeprefix(prefix))
    versions.sort()
    return versions


def get_mirrored_chromium_versions() -> list[str]:
    '''get a list of versions we have already mirrored'''

    # example: refs/tags/v999.0.0.0-linux
    repo = 'https://devdiv.visualstudio.com/DevDiv/_git/electron-chromium'
    prefix = 'refs/tags/'
    tag_regex = re.compile(
        '^' + prefix +
        '(\\d+)\\.(\\d+)\\.(\\d+)\\.(\\d+)-(linux|mac|windows)$')

    versions = []
    for line in git('ls-remote', '--tags', repo).splitlines():
        for word in line.split():
            if tag_regex.match(word):
                versions.append(word.removeprefix(prefix))
    versions.sort()
    return versions


def get_releases_needing_chromium_mirror(chrome_versions, releases_in):
    '''get the subset of releases with chrome versions we haven't mirrored'''
    releases_out = []
    for release in releases_in:
        version = release['chrome']
        if f'{version}-linux' not in chrome_versions:
            releases_out.append(release)
    return releases_out


def get_releases_needing_electron_mirror(electron_versions, releases_in):
    '''get the subset of releases with electron versions we haven't mirrored'''
    releases_out = []
    for release in releases_in:
        if release['version'] not in electron_versions:
            releases_out.append(release)
    return releases_out


def print_values(releases, key):
    '''print a sorted list of each release's |key|'''
    strings = set(rel[key] for rel in releases)
    for val in sorted(strings):
        print(val)


args = parse_args()

if args.chromium:
    ChromiumVersions = get_mirrored_chromium_versions()
    Releases = get_stable_supported_electron_releases()
    print_values(
        get_releases_needing_chromium_mirror(ChromiumVersions, Releases),
        'chrome'
    )

if args.electron:
    ElectronVersions = get_mirrored_electron_versions()
    Releases = get_stable_supported_electron_releases()
    print_values(
        get_releases_needing_electron_mirror(ElectronVersions, Releases),
        'version'
    )
