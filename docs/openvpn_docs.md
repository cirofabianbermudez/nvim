# OpenVPN docs


In macOS the profiles are saved in:

```plain
~/Library/Application Support/OpenVPN Connect/profiles
```

For a certificate-based OpenVPN connection, the three files are usually:

| File | What it does |
| ---- | -------------|
| `ca.crt` | Verifies the VPN server's certificate |
| `client.cer` | Identifies the device or account to the VPN server |
| `client.key` | The private key that matches your client certificate |

The `.ovpn` file constains the connection settings and can bundle all three.


The logs are under:

```plain
~/Library/Application Support/OpenVPN Connect/log/ovpn.log
```

