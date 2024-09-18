
# 7zip plain

## Installation

```bash
scoop install main/7zip
```

## Usage

| Command | Description                                                |
| ------- | ---------------------------------------------------------- |
| `a`     | Add files to archive                                       |
| `e`     | Extract files from archive (without using directory names) |
| `l`     | List contents of archive                                   |
| `x`     | Extract files with full paths                              |
| `u`     | Update files to archive                                    |

Compress files or directories

```plain
7z a compress_filename.7z file.txt directory
```

Extract files from an archive

```plain
7z x compress_filename.7z
```

Extract files from an archive to an specific directory

```plain
7z x compress_filename.7z -o/path/to/destination
```

Add files or directories to an existing archive

```plain
7z u compress_filename.7z newfile.txt
```

List the content of the archive without extraction

```plain
7z l compress_filename.7z
```

Encrypt an archive with a password

```plain
7z a -p<password> compress_filename.7z file.txt
```

## References

- [7zip Official Website](https://www.7-zip.org/)