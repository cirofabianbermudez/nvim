

# Linux notes 

## `chown`

`chown` means **change owner**.

It changes who owns a file or directory.

Example:

```bash
sudo chown -R $(whoami) worldbanc
```

-R means recursively

## `chmod`

`chmod` means **change mode**.

It changes file or directory permissions.

Example:

```bash
sudo chmod -R 755 worldbanc
```

## Permission Numbers

Permission numbers are built from these values:

| Number | Permission |
|---:|---|
| `4` | read |
| `2` | write |
| `1` | execute |

The numbers are added together.

| Number | Meaning |
|---:|---|
| `7` | read + write + execute |
| `6` | read + write |
| `5` | read + execute |
| `4` | read only |

A permission like `755` has three digits:

```text
755
```

Each digit applies to a different group:

| Digit | Applies to |
|---:|---|
| first digit | owner |
| second digit | group |
| third digit | others |

So:

```bash
chmod 755 worldbanc
```

Means:

| Who | Permission |
|---|---|
| Owner | read, write, execute |
| Group | read, execute |
| Others | read, execute |

In symbolic form:

```text
owner:  rwx
group:  r-x
others: r-x
```

finally there is a 10 character string that represents this:

-rwxrwxrwx
drwxrwxrwx

the first character represents if it's a file or a directory

also the x means execute and means if you can `cd` into it

## What Does `777` Mean?

```bash
chmod 777 worldbanc
```

Means:

| Who | Permission |
|---|---|
| Owner | read, write, execute |
| Group | read, write, execute |
| Others | read, write, execute |

In symbolic form:

```text
owner:  rwx
group:  rwx
others: rwx
```

`777` gives everyone full access.



## 

```bash
tail -n 10 file.txt
head -n 10 file.txt
wc file.txt
wc -l file.txt
```

you can run multiple commands on a single line by separating them with a semicolon (;).

```bash
command1 ; command2
```

The second command runs immediately after the first command finishes. If you only want to run the second command if the first succeeds, then you can use &&:

```bash
command1 && command2
```


pbcopy
wc -l file.txt | xclip -selection clipboard
less -N filename.txt

touch filename.txt

mkdir -p dirname

grep -r "hello" .

# Find all filenames that contain the word "chad"
find some_directory -name "*chad*"


chmod -R u=rwx,g=,o= DIRECTORY
chmod -x filename.txt
chmod +x filename.txt
chmod u+x filename.txt

sudo chown -R root contacts

which sh

set -o vi
set +o vi

bindkey -v
bindkey -e

sed -n '5p' file.txt
stream editor
#!/usr/bin/env bash

env

export NAME="LANE"
WARN_MESSAGE="this works too" ./warn.sh

The PATH variable is a list of directories that your shell will look into when
you try to run a command. If you type ls, your shell will look in each directory
listed in your PATH variable for an executable called ls. If it finds one, it
will just run it. If it doesn't, it will give you an error like: "command not
found".


echo $PATH | tr ':' '\n'

tr is translate characters

reset the path with

```bash
export PATH=""
```


add to the path

```bash
export PATH="$PATH:/path/to/new"
```

this two command are similar

realpath
pwd

man

curl --help


Exit codes

0 - is the exti code for success

Last exit code
echo $?


unset ENV_VAR_NAME
export ENV_VAR_NAME=""

The temporary directory (/tmp) exists by default on all Unix-like systems in
your root directory. Files there are deleted by your system routinely. It's a
great place to store temporary files that you don't need to keep around


PID stands for process ID

kill <PID>


Process status
ps aux

aux means show all processes


top

allow you to see which programs are using the most resources
on your computer


activity monitor in macos

 in macos is o and then mem
 or top -o mem


To check architecture 
uname -m
uname -a
lscpu

set a password

sudo passwd ubuntu
