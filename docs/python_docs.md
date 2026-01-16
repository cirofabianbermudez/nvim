# Python notes

## Installation

### Linux

```bash
sudo apt update
sudo apt install python3-pip
sudo apt install python3-venv
```


```bash
python3 -m venv .venv
python3 -m pip install --upgrade pip
python3 -m pip index versions Jinja2
python3 -m pip install -e .
python3 -m pip install .

```

When you finish you have to install:

```bash
python3 -m pip install wheel build 
python3 -m build
python3 -m pip install twine
python3 -m twine upload --repository testpypi dist/*
pip install --index-url https://pypi.org/simple --extra-index-url https://test.pypi.org/simple pyuvcgen==0.1.4
```

remember to always change the version.

When you are ready you can publish your code to:

```bash
python3 -m twine upload dist/*
```

## Modern projects in Python

```bash
/home/bermudez/Documents/vip/pyuvcgen
├── pyproject.toml
├── README.md
├── scripts/
└── src/
    └── pyuvcgen/
        ├── __init__.py
        └── pyuvcgen.py
```


## Jinja2


## pyenv


### Installation (Linux)

Use the automatic installer (Recommended)

```bash
curl -fsSL https://pyenv.run | bash
```

Copy and paste this into your `~/.bashrc`

```bash
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
```

Restart your shell

Install Python build dependencies

```bash
sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

### Usage

```bash
pyenv --version

# Check selected python version
pyenv version

# Check all the python versions installed
pyenv versions

# Check python version that can be install
pyenv install --list

# Check the location of python being used
pyenv prefix

# Per project switching
pyenv local 3.12.12

# Global switching
pyenv global 3.12.12
pyenv global system

# Uninstall a python version
pyenv uninstall 3.12.12
```

[GitHub pyenv](https://github.com/pyenv/pyenv)


## References

https://docs.python.org/3/howto/argparse.html
https://docs.python.org/3/library/argparse.html#default
https://packaging.python.org/en/latest/tutorials/packaging-projects/

