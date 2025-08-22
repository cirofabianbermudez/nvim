# RHEL RHCSA Notes

## Installation

### VM Setup

From Windows Powershell use the `ipconfig` command to obtain the IPv4 Address
to correctly configure the **IPv4 Settings** selecting the Method: **Manual**
and adding the correct Address, Netmask and Gateway. It's important to use the
correct source, read under Wireless LAN adapter Wi-Fi or Ethernet adapter.

## Essential tools

| Command    | Options | Description |
| ---------- | ------- | ----------- |
| `whoami`   |         |             |
| `pwd`      |         |             |
| `hostname` |         |             |
| `logout`   |         |             |
| `exit`     |         |             |

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

## Acronyms

| Word | Meaning                |
| ---- | ---------------------- |
| LVM  | Logical Volume Manager |
|      |                        |