# RHEL RHCSA Notes

## Installation

### VM Setup

From Windows Powershell use the `ipconfig` command to obtain the IPv4 Address
to correctly configure the **IPv4 Settings** selecting the Method: **Manual**
and adding the correct Address, Netmask and Gateway. It's important to use the
correct source, read under Wireless LAN adapter Wi-Fi or Ethernet adapter.

## Essential tools

| Command                                  | Options                                                                                                                                                                                                                                                                           | Description                     |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `whoami`                                 |                                                                                                                                                                                                                                                                                   |                                 |
| `pwd`                                    |                                                                                                                                                                                                                                                                                   | Print current working directory |
| `hostname`                               |                                                                                                                                                                                                                                                                                   |                                 |
| `logout`                                 |                                                                                                                                                                                                                                                                                   |                                 |
| `exit`                                   |                                                                                                                                                                                                                                                                                   |                                 |
| `nmcli`                                  |                                                                                                                                                                                                                                                                                   |                                 |
| `nmtui`                                  |                                                                                                                                                                                                                                                                                   |                                 |
| `nm-connection-editor`                   |                                                                                                                                                                                                                                                                                   |                                 |
| `ls`                                     | `-a` do not ignore entries starting with `.` <br> `-l` use long listing formatting <br> `-h` human readable <br> `-R` list subdirectories recursively <br> `-t` sort by time, newest first <br> `-r` reverse order while sorting <br> `-X` sort alphabetically by entry extension | List directory contents         |
| `find <directory> <condition> <actions>` | `-name`                                                                                                                                                                                                                                                                           |                                 |

Review Questions Chapter 1

1. RHEL 9 cannot be installed over the network. True or False?
   - **False**. RHEL can be installed with installation files located on a network server.
2. Can you install RHEL 9 in text mode?
   - **Yes**, RHEL can be installed using text mode.
3. You can use the `/boot` partition within LVM to boot RHEL. True or False?
   - **False** `/boot` cannot reside within LVM. Everything else can be on LVM.
4. Which kernel version is the initial release of RHEL 9 based on?
    - The initial release of RHEL 9 is based on kernel version **5.14**.
5. Several log files are created and updated in the /tmp directory during the installation process. Where are these files moved to after the completion of installation?
   - **These files are moved to the `/var/log` directory**.
6. The Minimal Install base environment includes the graphical support. True or False?
   - **False**. Minimal Install base environment does not include graphics support.
7. Name the RHEL installer program.
    - The name of the RHEL installed program is **Anaconda**.
8. How many console screens do you have access to during the installation process?
   - There are **six** console screens available to you during the installation process.
9. RHEL 9 may be downloaded from Red Hat’s developer site. True or False?
    - **True**. RHEL 9 may be downloaded from `developers.redhat.com`. You need to open a new account or use an existing before you can download it.
10. What is the name of the default graphical user desktop if Server with GUI is installed?
    - The default graphical desktop is called **GNOME** desktop environment.

Wayland is a client/server display protocol that sets up the foundation for running graphical programs and applications in RHEL 9.

There are two components that are critical to the functionality of a graphical environment: a
**display manager** (a.k.a login manager) and a **desktop environment**.

The default display manager is called GNOME Display Manager (GDM).

## Linux Directory Structure and File Systems

Linux files are organized logically in  a hierarchy for ease of administration and recognition.
This organization is maintained in hundreds of directories located in large containers called
**file systems**. RHEL follows the **Filesystem Hierarchy Standard (FHS)** for file organization,
which describes names, locations and permissions for many file types and directories.

The root of the directory is represented by the forward slash character (`\`). The forward slash
character is also used as a directory separator in a path.

Directory, subdirectory, parent directory, child directory.

### File System Categories

File System Categories:

1. Disk-based (created on physical media such as hard-drives or USB flash drive)
2. Network-based (disk-based that are shared over the network for remote access)
3. Memory-based (are virtual, created at system startup and destroyed when the system goes down)

During RHEL installation, two disk-based file systems are created when you select the default
partitioning. These file systems are refereed to as the **root** and **boot** file systems.

### The Root File System (`/`), Disk-Based

| Directory | Meaning                                                                                  |
| --------- | ---------------------------------------------------------------------------------------- |
| `/etc`    | The *etcetera* (or extended text configuration) directory holds system configuration files |
| `/root`   | This is the default home directory location for the root user                            |
| `/mnt`    | This directory is used to mount a file system temporarily                                |

### The Boot File System (`/boot`), Disk-Based

The boot file system contains the Linux kernel, boot support files, and boot configuration files.

### The Boot File System (`/home`), Disk-Based

The `\home` directory is designed to store user home directories an other user contents. Each user is assigned
a home directory to save personal files, and the user can block access to other users.

### The Optional Directory (`/opt`)

This directory can be used to hold additional software that may need to be installed on the system.

### The UNIX System Resources Directory (`/usr`)

This directory contains most of the system files.

| Directory                   | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                  |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `/usr/bin`                  | The *binary* directory, contains crucial user executable commands.                                                                                                                                                                                                                                                                                                                                                       |
| `/usr/sbin`                 | The *system binary* directory, contains crucial system administration commands that are not intended for execution by normal users                                                                                                                                                                                                                                                                                       |
| `/usr/lib` and `/usr/lib64` | The *library* directories contain shared library routines required bu many commands and programs located in the `/usr/bin` and `/usr/sbin` directories                                                                                                                                                                                                                                                                   |
| `/usr/include`              | This directory contains header files for C language                                                                                                                                                                                                                                                                                                                                                                      |
| `/usr/local`                | This directory serves as a system administrator repository for storing commands and tools downloaded from the web, developed in-house or obtained elsewhere. These commands and tools are not generally included with the original Linux distribution. In particular, `/usr/local/bin` holds executables, `/usr/local/etc` holds configuration files, and `/usr/local/lib` and `/usr/local/lib64` holds library routines |
| `/usr/share`                | This is the directory location for manual pages, documentation, sample templates, configuration files, etc., that may be shared with other Linux platforms                                                                                                                                                                                                                                                               |
| `/usr/src`                  | This directory is used to store source code                                                                                                                                                                                                                                                                                                                                                                              |

### The Variable Directory (`/var`)

The `/var` directory contains data that frequently changes while the system is operational. Files in this directory contains log, status
spool, lock and other dynamic data.

| Directory    | Meaning                                                                                                                                                                                                                                                                                                      |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `/var/log`   | This is the storage for most system log files, such as system logs, boot logs, failed user logs, installation logs, cron logs, mail logs, etc                                                                                                                                                                |
| `/var/opt`   | This directory stores log, status, and other variable data files for additional software installed in `/opt`                                                                                                                                                                                                 |
| `/var/spool` | Directories that hold print jobs, cron jobs, mail messages, and other queued items before being sent out to their intended destinations are located here                                                                                                                                                     |
| `/var/tmp`   | Large temporary files or temporary files that need to exist for longer periods of time than what is typically allowed in another temporary directory, `/tmp`, are stored here. There files survive system reboots and are automatically deleted if they are not accessed or modified for a period of 30 days |

### The Temporary Directory (`/tmp`)

This directory is a repository for temporary files. many programs create temporary files here during runtime or installation.
These files survive system reboots and are automatically removed if they are not accessed or modified for a period of 10 days.

### The Devices File System (`/dev`), virtual

The *Devices* (dev file system) file system is accessible via the `/dev` directory, and it is used to store device nodes for physical
hardware and virtual devices. The Linux kernel communicates with there devices through corresponding device nodes located here.

There are two types of device files: character (or raw) device files, and block device files.

Character devices are a accessed serially with streams of bits transferred during kernel and device communication. Examples:
serial printers, mice, keyboards, terminals.

Block devices are accessed in a parallel fashion with data exchanged in blocks, (parallel) during kernel and device communication. Data
on block devices is accessed randomly. Examples: hard disk drives, optical drives, parallel printers.

### The Procfs File System (`/proc`), virtual

The *procfs* (process file system) file system is accessible via the `/proc` directory, and it is used to
maintain information about the current state of the running kernel. This includes the details for the current hardware
configuration and status information on CPU, memory, disks, partitioning, file systems, networking,
running processes, and so on.

The contents in `/proc` are created in memory at system boot time, updated during runtime, and destroyed at 
system shutdown.

### The Runtime File System (`/run`), virtual

The virtual file system is a repository of data for processes running on the system. Once of its
subdirectories, `/run/media`, is also used to automatically mount external file systems such as
those that are on optical (CD and DVD) and flash USB.

### The System File System (`/sys`), virtual

Information about hardware devices, drivers, and some kernel features is stored and maintained
in the `sys` file system. This information is used by the kernel to load necessary support for the
devices, create device nodes in `dev`, and configure devices. This file system is auto-maintained.


```bash
drwxr-xr-x.  2 user1 user1    6 Aug 21 18:29 Desktop
drwxr-xr-x.  2 user1 user1    6 Aug 21 18:29 Documents
-rw-------.  1 user1 user1 6.8K Aug 24 23:30 .viminfo
```

**Column 1**: The first character (hyphen or d) divulged the file type, and the next nine characters
(``rw-rw-r--`) indicates permissions.

**Column 2**: Displays the number of links

**Column 3**: Shows the owner name

**Column 4**: Exhibits the owning group name

**Column 5**: Identifies the file size in bytes. For directories, this number reflects the number of blocks being used.

**Column 6, 7, 8**: Displays the month, day and time of creation or last modification

**Column 9**: Indicates the name of the file or directory




## Acronyms

| Word | Meaning                       |
| ---- | ----------------------------- |
| LVM  | Logical Volume Manager        |
| DE   | Desktop Environment           |
| GDM  | GNOME Display Manager         |
| FHS  | Filesystem Hierarchy Standard |