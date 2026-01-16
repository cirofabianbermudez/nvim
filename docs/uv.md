# `uv` notes

The main idea behind these tools is to accelerate your Python workflow by
speeding up your project management actions. 

Key `uv` features for managing Python projects:

- **Fast dependency installation**
- **Virtual environment management**
- **Python version managment**
- **Project initialization**
- **Dependency managment**
- **Package build and publication management**
- **Developer tooling support**

## Installation

You can go directly to the [uv GitHub](https://github.com/astral-sh/uv)
repository for the complete guide.

For macOs and Linux:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

this command installs `uv` and `uvx` to `$HOME/.local/bin`

Check the version with:

```bash
uv --version
```

Display the help message:

```bash
uv help
```

Update `uv` to the latest version:

```bash
uv self update
```

Install an specific Python version:

```bash
uv python install 3.12
```

this command installs `python3.12` to `$HOME/.local/bin`

Use a specific Python version in the current directory:

```bash
uv python pin 3.12
```

this command updates the `.python-version` file. This file is used by `uv` for
creating the `.venv/` with the correct version of Python.

To view available and installed Python versions:

```bash
uv python list
```

To upgrade a Python version to the latest supported path release:

```bash
uv python upgrade 3.12
```

Create a Python project:

```bash
uv init rpcats
```

Run your project with:

```bash
uv run main.py
```

The first time you run this command. it'll display the Python version you're
currently using for the project. It'll also inform you that `uv` has created a
dedicated Python virtual environment for the project.

`uv.lock` is a universal or cross-platform lockfile that captures the packages
that would be installed across all possible Python markers such as operating
system, architecture, and Python version.

Unlike the `pyproject.toml`, which is used to specify the broad requirements of
your project, the lockfile contains the exact resolved versions that are
installed in the project environment. This file should be checked into version
control, allowing for consistent and reproducible installations across machines.

A lockfile ensures that developers working on the project are using a consistent
set of package versions. Additionally, it ensures when deploying the project as
an application that the exact set of used package versions is known.

The lockfile is automatically created and updated during uv invocations that use
the project environment, i.e., `uv sync` and `uv run`. The lockfile may also be
explicitly updated using `uv lock`.

`uv.lock` is a human-readable TOML file but is managed by uv and should not be
edited manually. The `uv.lock` format is specific to `uv` and not usable by other
tools.


Add packages:

```bash
uv add requests
```

Upgrading dependencies:

```bash
uv add --upgrade requests
```

Remove dependencies:

```bash
uv remove requests
```

Add non vital dependencies, like formatters and checkers:

```bash
uv add --dev pytest
uv add --dev ruff
```

`uv` uses the `uv.lock` file to lock a project’s dependencies. **Locking**
consists of capturing your project’s specific dependencies in the lockfile. This
process makes it possible to reproduce your working environment in all possible
configurations, including the Python version and distribution, the operating
system, and the architecture.

As a counterpart, **syncing** is the process of installing the required packages
from the lockfile into the project’s development environment.

See dependencies:

```bash
uv pip list
```

You can compare this list with the content of the `uv.lock` file. The packages
and versions will coincide, which ensures the exact reproduction of the original
development environment.

Manually create or update the `uv.lock` file:

```bash
uv lock
```

Manually sync the environment:

```bash
uv sync
```

Build a distribution:

```bash
uv build         # Both
uv build --sdist # Source distribution
uv build --wheel # Binary distribution
```

Publish a distribution:

First create a variable with your token, and then:

```bash
export TOKEN="..."
uv publish --index testpypi --token $TOKEN
```

Manually create virtual environment:

```bash
uv venv
```

Manually install packages:

```bash
uv pip install request
```

Test your package:

In another directory create a new virtual environment and then run the following
command:

```bash
uv pip install \
  --index-url https://pypi.org/simple \
  --extra-index-url https://test.pypi.org/simple \
  --index-strategy unsafe-best-match \
  rpcats-cirobermudez
```

This command installs your test package from TestPyPI while getting all its
dependencies from the real PyPI. It's the standard way to test packages before
publishing them to production PyPI.

Sets the primary index where pip will search for packages. This is the main PyPI
(the real one). Pip will look here first for all packages.

Adds an additional index to search. If pip can't find a package (or a specific
version) on the primary index, it'll also check TestPyPI. This is a
fallback/secondary source.

When you publish a package to TestPyPI, it likely depends on other packages
(like `numpy`, `requests`, etc.) that are only on the real PyPI. So:

`rpcats-cirobermudez` gets downloaded from TestPyPI (where you published it) Its
dependencies (like `requests`) get downloaded from the real PyPI

If you only used `--index-url https://test.pypi.org/simple`, pip wouldn't find
the dependencies and installation would fail.

```bash
uv pip install -i https://test.pypi.org/simple/ rpcats-cirobermudez
```

Another fix is to create a small project and test it:

```bash
uv init tmp
```

```toml
[project]
name = "tmp"
version = "0.0.0"
requires-python = ">=3.12"
dependencies = ["rpcats-cirobermudez"]

[[tool.uv.index]]
name = "testpypi"
url = "https://test.pypi.org/simple/"
explicit = true

[tool.uv.sources]
rpcats-cirobermudez = { index = "testpypi" }
```

Then just:

```bash
uv venv  # Optional
uv sync
uv run rpcats --help
uv run rpcats Siamese
```

Publish to PyPi:

```bash
uv publish --token $TOKEN
```

## References

- [uv GitHub](https://github.com/astral-sh/uv)
- [uv Documentation](https://docs.astral.sh/uv/)
- [Managing Python Projects With uv: An All-in-One Solution](https://realpython.com/python-uv/)

