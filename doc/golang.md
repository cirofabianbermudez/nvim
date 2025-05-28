# Go notes

## Installation

### Windows

```bash
scoop install go
```

### Linux

```bash
wget https://go.dev/dl/go1.24.3.linux-amd64.tar.gz
```

## Basic commands

```bash
go version
go mod init <modulename>
go run <filename>
go build <filename>
```


```go
package main

import (
  "fmt"
)

func main() {
  fmt.Println("Hello World")
}
```

```go
  fmt.Println()
  fmt.Printf()
```

## References
