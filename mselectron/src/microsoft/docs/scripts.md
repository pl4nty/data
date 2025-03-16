## Overview

We write scripts in Python 3, and ECMAScript 2015.
Check the [Code Style](docs/codestyle.md) doc for code style requirements.

### `//scripts/*.py`

Scripts in the root folder are intended to be run by a human or in a CI environment.
All of them should be executable and have well-documented interface.
Run `python script_name.py --help` to view documentation for each script.

### `//scripts/lib/*.py`

Library scripts with no user interface.
Use [snake_case](https://en.wikipedia.org/wiki/Snake_case) for file names and always add `.py` extension.
