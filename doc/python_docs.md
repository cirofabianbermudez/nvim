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



## References

https://docs.python.org/3/howto/argparse.html
https://docs.python.org/3/library/argparse.html#default
https://packaging.python.org/en/latest/tutorials/packaging-projects/
