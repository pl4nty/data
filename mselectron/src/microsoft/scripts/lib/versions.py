"""
Get Chromium, Node.js, and Electron versions.
"""

import os

from .deps import get_vars as get_deps_vars
from .filesystem import read_file
from .git import Repository
from .project_paths import ELECTRON_DIR, REPO_ROOT_DIR, SRC_DIR
from pathlib import Path


def _get_deps_var(dirname: Path, key: str) -> str:
    return str(get_deps_vars(dirname)[key])


def _get_electron_deps_var(key: str) -> str:
    return _get_deps_var(ELECTRON_DIR, key)


def _get_msft_deps_var(key: str) -> str:
    return _get_deps_var(REPO_ROOT_DIR, key)


# Chromium
def get_chromium_version_from_electron_deps() -> str:
    return _get_electron_deps_var('chromium_version')


def get_chromium_version_from_microsoft_deps() -> str:
    return _get_msft_deps_var('microsoft_chromium_version')


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
def get_node_version_from_electron_deps() -> str:
    return _get_electron_deps_var('node_version')


def get_node_version_from_microsoft_deps() -> str:
    return _get_msft_deps_var('microsoft_node_version')


# Electron
def get_electron_version_from_microsoft_deps(strip_leading_v=False) -> str:
    val = _get_msft_deps_var('microsoft_electron_version')
    return val[1:] if strip_leading_v else val


def get_electron_revision_from_microsoft_deps() -> str:
    return _get_msft_deps_var('microsoft_electron_revision')


def get_electron_revision():
    repo = Repository(ELECTRON_DIR)
    return repo.git('rev-parse', 'HEAD').strip()
