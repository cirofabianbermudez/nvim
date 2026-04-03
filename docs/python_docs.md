# Python notes

```python
print("")
print(f"{}")
```

## Comments

```python
# Basic comment

'''
    Docstring
    Multiline comment
'''

```

## Variables

The creator of Python language himslef, implore us use `snake_case` for
variables names.

| Name        | Description                                             | Code          | Language(s) that recommend it |
|-------------|---------------------------------------------------------|---------------|-------------------------------|
| Snake Case  | All words are lowercase and separated by underscores    | num_new_users | Python, Ruby, Rust            |
| Camel Case  | Capitalize the first letter of each word except first   | numNewUsers   | JavaScript, Java              |
| Pascal Case | Capitalize the first letter of each word                | NumNewUsers   | C#, C++                       |
| No Casing   | All lowercase with no separation                        | numnewusers   | ...just don't do this         |


- Strings
- Booleans
- Numbers
- None or NoneType

```python
is_tall = True
is_short = False
```


```python
print("player_health is a/an", type(player_health).__name__)
print("player_has_magic is a/an", type(player_has_magic).__name__)
value = 10
my_string = f"something {value}"
```

We can make an "empty" variable by setting it to `None`

`None` is a special value in Python that represents the absence of a value. It is
not the same as zero, False, or an empty string.

Python is dynamically typed


This is equivalent

```python
sword_name, sword_damage, sword_length = "Excalibur", 10, 200
sword_name = "Excalibur"
sword_damage = 10
sword_length = 200
```

## Functions

```python
def area_of_circle(r):
    pi = 3.14
    result = pi * r * r
    return result
```



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

