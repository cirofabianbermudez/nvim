Tailscale + SSH Manual: Linux ↔ macOS
1. Goal

Connect your Linux laptop and MacBook Air securely using Tailscale, then use SSH between them from anywhere.

MacBook Air ──Tailscale/SSH──> Linux laptop
Linux laptop ──Tailscale/SSH──> MacBook Air
2. Linux Setup
2.1 Enable SSH on Linux

On the Linux machine:

sudo apt update
sudo apt install openssh-server
sudo systemctl enable --now ssh

This only needs to be done once.

Check SSH:

systemctl is-enabled ssh
systemctl is-active ssh

Expected output:

enabled
active
2.2 Login to Tailscale on Linux

On the Linux machine:

sudo tailscale up

Open the login URL and sign in.

Check Tailscale:

tailscale status

Get the Linux Tailscale IP:

tailscale ip -4
3. macOS Setup
3.1 Install and login to Tailscale

Install Tailscale on macOS and log in with the same account.

Check from the Mac terminal:

tailscale status

Get the Mac Tailscale IP:

tailscale ip -4
3.2 Enable SSH on macOS

On macOS:

System Settings → General → Sharing → Remote Login

Enable Remote Login.

Check your Mac username:

whoami
4. Connect from Mac to Linux

From the Mac terminal:

ssh linux_username@linux_tailscale_ip

Example:

ssh ciro@100.80.20.10

With MagicDNS/device name:

ssh ciro@linux-laptop
5. Connect from Linux to Mac

From the Linux terminal:

ssh mac_username@mac_tailscale_ip

Example:

ssh ciro@100.90.30.15

With MagicDNS/device name:

ssh ciro@macbook-air

The Mac must be awake for SSH to work.

6. Useful Commands

Show Tailscale devices:

tailscale status

Show this machine’s Tailscale IP:

tailscale ip -4

Check SSH on Linux:

systemctl status ssh

Check Tailscale on Linux:

systemctl status tailscaled

Restart SSH on Linux:

sudo systemctl restart ssh

Restart Tailscale on Linux:

sudo systemctl restart tailscaled
7. Daily Use

From Mac to Linux:

ssh ciro@linux-laptop

or:

ssh ciro@100.x.y.z

From Linux to Mac:

ssh ciro@macbook-air

or:

ssh ciro@100.x.y.z
8. Security Notes

Your Tailscale IPs are private to your tailnet.

Other people cannot connect unless:

They are added to your Tailscale network
You explicitly share a machine with them
Your account is compromised

Good practices:

Use 2FA on GitHub/Tailscale login
Keep SSH enabled only for your user
Avoid router port forwarding for SSH
Use Tailscale instead of exposing port 22 to the internet


## Create a new ubuntu image

1. List the USB

```bash
lsblk
```

2. Check which ones has MOUNTPOINTS then 

```bash
sudo umount /dev/sda1 /dev/sda3
```

3. Create the image with

```bash
sudo dd if=~/Downloads/ubuntu-*.iso of=/dev/sda bs=4M status=progress oflag=sync
```

4. Eject the USB

```bash
sudo eject /dev/sda
```


