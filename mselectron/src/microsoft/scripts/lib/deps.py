import os
from typing import Any, Dict

from .filesystem import read_file


def _get_deps_execution_scope():
    def Var(unused_arg):  # pylint: disable=unused-argument
        return ''

    return {
        'Var': Var,
    }


def _get_from_contents(deps_contents: str) -> Dict[str, Any]:
    execution_scope = _get_deps_execution_scope()
    deps = {}
    exec(deps_contents, execution_scope, deps)
    return deps


def get_vars_from_contents(deps_contents: str) -> Dict[str, Any]:
    """Return the 'vars' dict from the deps contents."""
    return _get_from_contents(deps_contents)['vars']


def get_vars(dirname: str, basename: str = 'DEPS') -> Dict[str, Any]:
    """Return the 'vars' dict from the directory/filename DEPS file."""
    return get_vars_from_contents(read_file(os.path.join(dirname, basename)))
