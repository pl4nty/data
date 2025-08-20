#!/usr/bin/env python3

"""
Bump Electron, Chromium, and Node.js versions in `DEPS`.

Fetches Electron, Chromium, and Node.js version info from electron/electron.
Updates electron-build's DEPS file with this version info and commits it.

Example use:
$ microsoft/scripts/bump_deps.py v37.2.1
$ microsoft/scripts/bump_deps.py v37.2.1 --dry-run
$ microsoft/scripts/bump_deps.py v37.2.1 --no-commit
$ microsoft/scripts/bump_deps.py v37.2.1 --quiet
"""

import argparse
import enum
import json
import logging
import os
import re
import subprocess
import urllib.error
import urllib.request
from http.client import HTTPResponse
from pathlib import Path
from typing import Dict, Optional

from lib.deps import get_vars_from_contents as get_deps_vars_from_contents
from lib.gclient import gclient


# Semver pattern (with optional v prefix and pre-release/build metadata)
# v? - Optional 'v' prefix
# \d+\.\d+\.\d+ - Major.minor.patch (basic semver core)
# (?:[-+][0-9a-zA-Z.-]+)* - Optional pre-release and/or build metadata
# Examples: 1.2.3, v1.2.3, 1.2.3-alpha.1, 1.2.3+build.123, v1.2.3-beta.2+456
SEMVER_REGEX = r'v?\d+\.\d+\.\d+(?:[-+][0-9a-zA-Z.-]+)*'


class OperationMode(enum.Enum):
    """Enumeration for script operation modes."""
    DRY_RUN = 'dry_run'
    UPDATE = 'update'
    COMMIT = 'commit'


def get_default_electron_build_repo_dir() -> Optional[str]:
    """Find the electron-build repository directory automatically."""
    cwd = os.getcwd()

    def is_electron_build_repo_dir(dir_path: str) -> bool:
        path = Path(dir_path)
        return (
            path.is_dir()
            and (path / 'DEPS').is_file()
            and (path / 'owners.txt').is_file()
        )

    cwd_path = Path(cwd)
    candidates = [
        cwd_path,  # current directory
        cwd_path / 'microsoft',  # microsoft/ subdirectory
        cwd_path / 'src' / 'microsoft',  # src/microsoft/ subdirectory
        cwd_path.parent,  # parent directory
    ]

    for dir_path in candidates:
        if is_electron_build_repo_dir(str(dir_path)):
            return str(dir_path.resolve())

    return None


def parse_args() -> argparse.Namespace:
    """Parse and validate command line arguments."""
    parser = argparse.ArgumentParser(
        description='Bump Electron, Chromium, and Node.js versions in DEPS'
    )
    parser.add_argument(
        'tag', help='Electron version tag (e.g., "1.2.3" or "v1.2.3")'
    )

    default_build_dir = get_default_electron_build_repo_dir()
    parser.add_argument(
        '--electron-build-repo-dir',
        default=default_build_dir,
        required=default_build_dir is None,
        help=(
            'Top-level directory of the electron-build repo '
            '(default: %(default)s)'
        ),
    )
    parser.add_argument(
        '--no-commit',
        action='store_true',
        help='Do not commit changes to the DEPS file',
    )
    parser.add_argument(
        '--quiet', '-q',
        action='store_true',
        help='Suppress informational output',
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show what changes would be made without applying them',
    )

    args = parser.parse_args()

    if not is_semver_tag(args.tag):
        parser.error('Tag must be valid semver')

    return args


def get_mode(args: argparse.Namespace) -> OperationMode:
    """Determine operation mode based on command line flags."""
    if args.dry_run:
        return OperationMode.DRY_RUN
    if args.no_commit:
        return OperationMode.UPDATE
    return OperationMode.COMMIT


def is_semver_tag(tag: str) -> bool:
    """Check if a tag has a valid semver format."""
    return re.fullmatch(SEMVER_REGEX, tag) is not None


def _urlopen(url: str) -> HTTPResponse:
    """Small urllib opener with local defaults for UA and timeout.

    Returns an HTTPResponse; use in a `with` block.
    """
    TIMEOUT = 30
    USER_AGENT = 'electron-build-bump-deps'
    req = urllib.request.Request(url, headers={'User-Agent': USER_AGENT})
    return urllib.request.urlopen(req, timeout=TIMEOUT)


def get_commit_sha_for_tag(tag: str) -> str:
    """Get the git commit SHA for an Electron tag from GitHub API."""
    url = f'https://api.github.com/repos/electron/electron/git/ref/tags/{tag}'
    try:
        with _urlopen(url) as resp:
            data = json.load(resp)

        if data['object']['type'] == 'tag':
            tag_url = data['object']['url']
            with _urlopen(tag_url) as resp2:
                data = json.load(resp2)

        return data['object']['sha']

    except urllib.error.HTTPError as e:
        if e.code == 404:
            raise RuntimeError(f'Tag {tag} not found in {url}') from e
        raise RuntimeError(f'Got HTTP {e.code}') from e
    except urllib.error.URLError as e:
        raise RuntimeError(f'Network error fetching tag {tag}: {e}') from e


def validate_deps(deps_content: str) -> None:
    """Confirm that a DEPS file is well-formed."""
    try:
        get_deps_vars_from_contents(deps_content)
    except SyntaxError as e:
        raise RuntimeError(
            f'Error on line {getattr(e, "lineno", "?")}: {e.msg}'
        ) from e
    except Exception as e:
        raise RuntimeError(f'Error validating DEPS content: {e}') from e


def validate_deps_file(filename: Path) -> None:
    """Confirm that a DEPS file is well-formed."""
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            content = f.read()
        validate_deps(content)
    except FileNotFoundError as e:
        raise RuntimeError(f'DEPS file not found: {filename}') from e
    except Exception as e:
        raise RuntimeError(f'Error validating {filename}: {e}') from e


def extract_deps_variables(deps_content: str) -> Dict[str, str]:
    """Extract chromium_version and node_version from DEPS contents."""
    validate_deps(deps_content)
    vars_map = get_deps_vars_from_contents(deps_content)
    return {
        'microsoft_chromium_version': str(vars_map['chromium_version']),
        'microsoft_node_version': str(vars_map['node_version']),
    }


def update_electron_build_deps(
    electron_build_repo_dir: str,
    deps_vars: Dict[str, str],
    mode: OperationMode
) -> None:
    """Update variables in a DEPS file. Optionally commit changes."""
    deps_file = Path(electron_build_repo_dir) / 'DEPS'

    logging.info('Updating %s', deps_file)

    # Update each variable using gclient setdep
    git_args = ['git', 'commit', 'DEPS']
    prev_cwd = os.getcwd()
    cwd = electron_build_repo_dir
    os.chdir(cwd)
    changed = False
    for key, val in deps_vars.items():
        logging.info('Setting %s = %s', key, val)
        if mode != OperationMode.DRY_RUN:
            try:
                gclient('setdep', f'--var={key}={val}')
                if has_unstaged_changes(cwd):
                    subprocess.run(['git', 'add', 'DEPS'], cwd=cwd, check=True)
                    git_args.extend(['-m', f'deps: set {key} to {val}'])
                    changed = True
            except subprocess.CalledProcessError as e:
                msg = e.stderr.strip() if e.stderr else 'Unknown error'
                raise RuntimeError(f'Failed to set {key}={val}: {msg}') from e
    os.chdir(prev_cwd)

    validate_deps_file(deps_file)

    if not changed:
        logging.info('Nothing to do; no changes made to DEPS file')
    elif mode == OperationMode.COMMIT:
        logging.info('Committing changes to %s', deps_file)
        try:
            subprocess.run(
                git_args,
                cwd=electron_build_repo_dir,
                check=True
            )
        except subprocess.CalledProcessError as e:
            error_msg = e.stderr.strip() if e.stderr else 'Unknown error'
            raise RuntimeError(f'Git commit failed: {error_msg}') from e
    elif mode == OperationMode.DRY_RUN:
        logging.info('Committing changes to %s', deps_file)
        logging.info('Calling %s', " ".join(repr(arg) for arg in git_args))
    # For OperationMode.UPDATE, we don't commit (just update)


def fetch_deps_for_tag(tag: str) -> str:
    """Fetch DEPS file content for a given Electron tag from GitHub."""
    url = (
        f'https://raw.githubusercontent.com/electron/electron/'
        f'refs/tags/{tag}/DEPS'
    )
    logging.info('Fetching DEPS from: %s', url)

    try:
        with _urlopen(url) as resp:
            return resp.read().decode('utf-8')
    except urllib.error.HTTPError as e:
        if e.code == 404:
            raise RuntimeError(f'DEPS file not found for tag {tag}') from e
        raise RuntimeError(f'Failed to get {url}: HTTP {e.code}') from e
    except urllib.error.URLError as e:
        raise RuntimeError(f'Network error fetching {url}: {e}') from e


def has_unstaged_changes(repo_dir: str) -> bool:
    """Check if there are any unstaged changes to the DEPS file."""
    try:
        result = subprocess.run(
            ['git', 'status', '--porcelain', 'DEPS'],
            cwd=repo_dir,
            check=False,
            stdout=subprocess.PIPE,
            text=True,
        )
        # Format: XY filename, where Y indicates working tree status
        # ' M' = modified in working tree,
        # 'MM' = modified in both index and working tree
        for line in result.stdout.split('\n'):
            if line and len(line) >= 2 and line[1] == 'M':
                return True
        return False
    except (subprocess.CalledProcessError, OSError):
        return False


def main() -> None:
    """Update the Electron, Chromium, and Node.js versions in DEPS"""
    args = parse_args()
    mode = get_mode(args)

    logging.basicConfig(
        level=logging.WARNING if args.quiet else logging.INFO,
        format='%(message)s'
    )

    if args.dry_run:
        logging.info('This is a dry run. No changes will actually be made.')

    tag = args.tag if args.tag.startswith('v') else f'v{args.tag}'
    tag_deps_contents = fetch_deps_for_tag(tag)

    deps_vars = {
        'microsoft_electron_version': tag,
        'microsoft_electron_revision': get_commit_sha_for_tag(tag=tag),
        **extract_deps_variables(tag_deps_contents),
    }

    update_electron_build_deps(
        electron_build_repo_dir=args.electron_build_repo_dir,
        deps_vars=deps_vars,
        mode=mode,
    )


if __name__ == '__main__':
    main()
