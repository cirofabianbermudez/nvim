# SSH notes

To make an SSH connection you need at least two things

- `username`
- `serverhost`

```bash
ssh username@serverhost
```

The server host can either be an IP address or domain name

The user name will the user in the remote server that you are connecting to

You will also need some way of authenticating yourself to the remote server
which can either be a password or a key.

Examples:

```bash
ssh james@142.93.58.60
ssh james@server.juniordevelopercentral.com
```
