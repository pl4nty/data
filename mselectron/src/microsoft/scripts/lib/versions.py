"""
Get Chromium, Node.js, and Electron versions.
"""

import os

from .deps import get as get_deps
from .filesystem import read_file
from .git import Repository
from .project_paths import ELECTRON_DIR, REPO_ROOT_DIR, SRC_DIR


def _get_electron_deps():
    return get_deps(ELECTRON_DIR)


def _get_microsoft_deps():
    return get_deps(REPO_ROOT_DIR)


# Chromium
def get_chromium_version_from_electron_deps():
    deps = _get_electron_deps()
    return deps['vars']['chromium_version']


def get_chromium_version_from_microsoft_deps():
    deps = _get_microsoft_deps()
    return deps['vars']['microsoft_chromium_version']


def get_chromium_version_from_version_file(src_directory=SRC_DIR):
    version_file_path = os.path.join(src_directory, 'chrome', 'VERSION')
    file_lines = read_file(version_file_path, as_lines=True)
    version_string = _parse_chromium_version(file_lines)
    return version_string


def _parse_chromium_version(version_file_lines):
    # Extract the right part of a string like "MAJOR=69".
    version_parts = map(lambda line: line.strip().split('=')[1],
                        version_file_lines)
    version = '.'.join(version_parts)
    return version


# Node.js
def get_node_version_from_electron_deps():
    deps = _get_electron_deps()
    return deps['vars']['node_version']


def get_node_version_from_microsoft_deps():
    deps = _get_microsoft_deps()
    return deps['vars']['microsoft_node_version']


# Electron
def get_electron_version_from_microsoft_deps(strip_leading_v=False):
    deps = _get_microsoft_deps()
    version_with_leading_v = deps['vars']['microsoft_electron_version']

    version = version_with_leading_v[1:] if strip_leading_v \
        else version_with_leading_v

    return version

def get_electron_revision_from_microsoft_deps():
    deps = _get_microsoft_deps()
    return deps['vars']['microsoft_electron_revision']


def get_electron_revision():
    repo = Repository(ELECTRON_DIR)
    return repo.git('rev-parse', 'HEAD').strip()
