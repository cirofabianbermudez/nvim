# Linux notes

To see which terminals you have installed on your computer you can use the command:

```unix
cat /etc/shells
```

To see what operating system is installed on your Linux computer you can use the command:

```unix
cat /etc/os-release
```

To see what CPU your Linux computer has you can use the command:

```unix
lscpu
```

To see how much RAM your Linux computer has, you can use the command:

```unix
free -h
free
free -m
free -g
```

# `tar`

To compress files, the most used is the `tar` program, the easiest way to use it is as follows:

To compress a folder or file we use the following command:

```unix
tar -czvf file_or_directory.tar.gz file_or_directory
```

- `-c` creates a new compressed file
- `-z` means use gzip
- `-v` shows the files being processed (verbose),
- `-f` specifies the file name

To decompress we use the following command:

```unix
tar -xzvf file_or_directory.tar.gz 
```

- `-x` means decompress

It is important that the name of the decompressed file is not equal to any that is in the containing folder, otherwise it could automatically overwrite or rename a file. We can avoid this by viewing the content of the compressed file with the command:

```unix
tar -tvf file_or_directory.tar.gz
```

- `-t` shows the contents of the file without extracting it

Another alternative is to create a folder and unzip our tar file inside the folder as follows:

```unix
mkdir some_dir_name && tar -xzvf file_or_directory.tar.gz -C some_dir_name
```

- `-C` changes to the specified directory before unzipping.

## `source`

The `source` command in linux is used to execute commands from a file in the current shell. It is a way of executing commands from a file within the current context of the shell, meaning that any changes to environment variables or settings made in that file will be reflected in the current shell.

```unix
source some_shell_script.sh
. some_shell_script.sh
```

## Shell types

- `csh` or C shell is a Unix command interpreter (shell) created by Bill Joy when he graduated from the University of Berkeley in California in 1970.
- `tcsh` is a UNIX shell based on and compatible with the C Shell (csh). It is essentially C Shell with improvements and (programmable) features such as automatic name completion and command line editing among many other qualities.
- `sh` or Bourne Shell, is one of the oldest and most fundamental shells in Unix-based operating systems. It was developed by Stephen Bourne at Bell Labs in the 1970s and became an integral part of many Unix systems.
- `bash` meaning "Bourne Again Shell", is a Unix shell and command interpreter that has gained wide popularity on Unix and Linux based systems. It is an evolution of the original Unix shell, sh (Bourne Shell), with additional features and significant improvements.
- `ksh`, known as Korn Shell, is another of the Unix shells, developed by David Korn at Bell Labs in the 1980s. It aims to combine the most useful features of the Bourne Shell (sh) and the C Shell (csh), providing a wide range of functionality and ease of use.

To find out what shell you are using you can run the command

```unix
echo $0
```

To see which terminal you are using, run the command:

```unix
echo $TERM
```

## cron

cron allows us to schedule tasks in advance and it's very powerful and definitely recommended.

cron jobs are schedule tasks, if you want something to be done at a specific time and you don't want to set an alarm at three in the morning to run that backup job that you plan on running, you want to be able to schedule that and have it run when you are not at your computer or server that's exactly what a cron job will allow you tu do.

Every user on the system will have their own set of cron jobs and a list of crown jobs for a user is considered their crontab.

This command allow us to see the user crontab:

```plain
crontab -l
```

This command allow us to edit our crontab

```plain
crontab -e
```

`minute hour month_day month week_day`

Syntaxis

With this we run the `touch` command every minute

```plain
* * * * * touch "$(date +"%Y-%m-%d_%H:%M:%S").txt"
```

With this we run the `touch` command every 5 minute

```plain
*/5 * * * * touch "$(date +"%Y-%m-%d_%H:%M:%S").txt"
```

With this we can run the touch command _“At 00:30 on Monday.”_

```plain
30 0 * * 1 touch "$(date +"%Y-%m-%d_%H:%M:%S").txt"
```

With this we can run the touch command _“At 01:00 on Monday.”_

```plain
0 1 * * 1 touch "$(date +"%Y-%m-%d_%H:%M:%S").txt"
```

With this we can run the touch command _“At 00:30 on Friday.”_

```plain
30 0 * * 5 touch "$(date +"%Y-%m-%d_%H:%M:%S").txt"
```

With this we can run the touch command _“At 01:00 on Friday.”_

```plain
0 1 * * 5 touch "$(date +"%Y-%m-%d_%H:%M:%S").txt"
```

[crontab.guru](https://crontab.guru/) is a nice site to check if your configuration is correct.

## find

```plain
find . -maxdepth 1 -not -name "Makefile" -not -name "." -exec rm -Rf {} \;
```

- `.`: Represents the current directory.
- `-maxdepth 1`: Specifies that the search should not go beyond the current directory. It limits the depth of the search to 1 level, meaning it will only consider files and directories directly within the current directory, excluding subdirectories.
- `-not`: Negates the following expression.
- `-name "Makefile"`: Specifies that the name of the file or directory should not be "Makefile"
- `-not -name "."`: Specifies that the name should not be "." (current directory). This is an additional check to avoid deleting the current directory itself.
- `-exec rm -rf {} \;`: Executes the `rm -rf` command on each file or directory found. The `{}` is a placeholder for the file or directory name, and `\;` marks the end of the `-exec` command.

```plain
find . -mtime +5 -type f
```

- `.`: Represents the current directory, indicating that the search should start from the current directory.
- `-mtime +5`: Specifies that the search should consider files based on their modification time. Specifically, it looks for files that were modified more than 5 days ago.
- `-type f`: Specifies that the search should only consider regular files (not directories or other types).

```plain
find . -type f -name '*.o' -exec ls -lh {} +
```

```bash
find . -type f -name "Makefile" ! -path ./template/Makefile -exec cp template/Makefile {} \;
```

## grep

```plain
ls -lh | grep '.cpp$'
```

```plain
wget --help | grep "-E"
```

```plain
grep -r "xrun" .
```

`-i, --ignore-case`

	Ignore case distinctions in both the PATTERN and the input files. (-i is specified by POSIX.)

/

`-n, --line-number`

Prefix each line of output with the 1-based line number within its input file. (-n is specified by POSIX.)

`-v, --invert-match`

	Invert the sense of matching, to select non-matching lines. (-v is specified by POSIX.)

`-w, --word-regexp`

	Select only those lines containing matches that form whole words. The test is that the matching substring must either be at the beginning of the line, or preceded by a non-word constituent character. Similarly, it must be either at the end of the line or followed by a non-word constituent character. Word-constituent characters are letters, digits, and the underscore.

- `"word"` literal
- `"^word"` Lines that starts with `word`
- `"word$"` Lines that ends with `word`
- `"word..."` Lines with `word` and any three characters `word`
- `"t[wo]o"` Specify that the character at that position can be any one character found within the bracket group.
- `"^[A-Z]"` find every line that begins with a capital letter

<https://www.digitalocean.com/community/tutorials/using-grep-regular-expressions-to-search-for-text-patterns-in-linux>

## more

```plain
more filename.txt
```

## 7z

```plain
7z x file.zip -ofile
```

To open in the GUI

```bash
7zFM .
```

## sort

```plain
ls -1 . | sort
```

## cut

the default delimiter for cut is `\t`

```plain
xrun -version | cut -f 3
gcc --version | head -n 1 | cut -d ' ' -f 3

```

## head

```plain
gcc --version | head -n 1
```

## tail

```plain
gcc --version | tail -n 1
```

## awk

```plain
 xrun -version | awk '{print $3}'
```

## sed

select an specific line

```plain
gcc --version | sed -n '1p' | awk '{print $3}'
```

substitute all the ciro for alejandro in file.txt

```plain
sed -i 's/ciro/alejandro/g' file.txt
```

## wc

```plain
git diff $$lab | wc -l
```

Programs run by the shell get three streams:

```bash
0 - standard input [stdin]
1 - standard output [stdout]
2 - standard error (output) [stderr]
```

## cd

Change to the last directory

```plain
cd -
```

## command

```plain
command -v <some_command>
```

## date

```plain
date +"%Y_%m_%d_%H:%M:%S"
```

## wget

```bash
wget <url>
```

```bash
wget --mirror --page-requisites --convert-link -no-clober --no-parent --domain verificationacademy.com https://verificationacademy.com/cookbook/uvm-universal-verification-methodology/ 
```




## unzip

```bash
unzip -q simefile.zip
```

`-q`: quiet mode

`.bashrc` and `.profile` are both configuration files used in Unix-like operating systems, including Linux and macOS, to set up the environment for users when they log in. However, they serve slightly different purposes:

1. **.bashrc**:

		- `.bashrc` is specific to the Bash shell. It is executed every time a new interactive Bash shell is started.
		- This file typically contains settings and configurations related to the Bash shell itself, such as aliases, functions, shell options, and other customizations.
		- It's used primarily for defining settings and functions specific to the user's interaction with the command line.
2. **.profile**:

		- `.profile` is more generic and not limited to a specific shell. It is executed when a user logs in, regardless of the shell being used (Bash, sh, zsh, etc.).
		- This file is often used for setting environment variables, initializing variables needed by various programs, and running commands that should be executed once upon login.
		- It's used for setting up the user's environment variables and paths, making it suitable for system-wide configurations.

In summary, `.bashrc` is specific to the Bash shell and is executed every time a new interactive shell is started, while `.profile` is executed once during login and is not tied to any particular shell, making it suitable for broader environment setup.

This is Windows but you can use this command to open the explorer from the terminal

```bash
explorer .
```

In Linux for example

```bash
nautilus .
```

Terminal useful shortcuts

| Shortcut   | Description         |
| ---------- | ------------------- |
| `Ctrl + l` | Clear screen        |
| `Ctrl + u` | Delete current line |

## Backticks vs Parentheses

The difference between \` \` (backticks) and $() (parentheses) in Bash scripting lies in how they are used for command substitution.

Backticks were traditionally used for command substitution. When you enclose a command within backticks, the shell executes that command and substitutes its output in place of the backticks. However, the use of backticks is deprecated in favor of `$()` due to several issues, such as difficulties in nesting and escaping.

`$()` provides a more readable and flexible syntax for command substitution. It has largely replaced backticks.

`$()` can be nested within other `$()` commands more easily than backticks, and it's easier to read and understand.

In summary, while both backticks and `$()` can be used for command substitution, `$()` is generally preferred for its readability and ease of use, and it has largely replaced backticks in modern Bash scripting.

```bash
result=`ls -l`
echo $result

result=$(ls -l)
echo $result
```

To open WSL inside a PowerShell you can use the commands

```bash
ubuntu
wsl
bash
```

with `sh` you open the MINGW64 terminal inside the git installation

<https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script>


## Symbolic link `ln`

### Creating a Symbolic Link

To create a symlink, you use the `ln` command with the `-s` option

```bash
ln -s /path/to/target /path/to/symlink
```

### Viewing Symbolic Links

You can use the ls `-l` command to view symlinks:

```bash
ls -l /path/to/symlink
```

### Overwriting a Symbolic Link

To overwrite a symlink, you can use the `sf` option

```bash
ln -sf /path/to/target /path/to/symlink
```

## `mkdir`

The `mkdir` (make directory) command is used to create new directories in Unix/Linux systems

The basic syntax is:

```bash
mkdir [options] directory_name
```

Some common option are 

- `-p` or `--parents`: Create parent directories as needed. If the specified directory already exists no error is shown
- `-v` or `--verbose`: Display a message for each created directory

Examples:

```bash
mkdir -p /path/to/new/directory
```

```bash
mkdir -v new_directory
```

```bash
mkdir -p -v /path/to/new/project
```

## `curl`

Check the weather

```bash
curl wttr.in/mexico
curl wttr.in/puebla?1p
 curl wttr.in/bari?1p
```

Generate a QR Code

```bash
curl qrenco.de/google.com
```

Check the IP

```bash
curl ifconfig.me
curl ipinfo.io
```

Open a manual page of a command

```bash
curl cheat.sh/ls
curl cht.sh/ls
```

You can also use it to download files

```bash
curl -LO <some_url_file> 
```



# X11 Forwarding

Install Xming
And with putty enable 


nautilus
thunar
gedit

