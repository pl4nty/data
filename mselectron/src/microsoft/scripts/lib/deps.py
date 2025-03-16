import os

from .filesystem import read_file


def _get_deps_execution_scope():
    def Var(unused_arg):  # pylint: disable=unused-argument
        return ''

    return {
        'Var': Var,
    }


def get(directory, filename='DEPS'):
    deps_file_path = os.path.join(directory, filename)
    deps_contents = read_file(deps_file_path)

    execution_scope = _get_deps_execution_scope()
    deps = {}
    exec(deps_contents, execution_scope, deps)
    return deps
