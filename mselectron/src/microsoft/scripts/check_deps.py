#!/usr/bin/env python3

"""
Check DEPS
"""

from lib.deps import get_vars as get_deps_vars
from lib.project_paths import REPO_ROOT_DIR

EXPECTATIONS = {
    'microsoft_use_internal_chromium': True,
    'microsoft_use_internal_node': True,
}


def check_deps():
    deps_vars = get_deps_vars(REPO_ROOT_DIR)
    for var, expected_value in EXPECTATIONS.items():
        actual_value = deps_vars[var]
        if actual_value != expected_value:
            error_message = (f"'{var}' in DEPS was expected to be equal"
                + f" '{expected_value}' but it is '{actual_value}'")
            raise ValueError(error_message)


def main():
    check_deps()


if __name__ == '__main__':
    main()
