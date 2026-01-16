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


Check go version

```bash
go version
```

| Command           | Description                      |
| ------------      | -------------------------------- |
| `go version`      | Print go version                 |
| `go build`        | Compile the code                 |
| `go fmt`          | Code formatter                   |
| `go mod`          | Dependency manager               |
| `go test`         | Test runner                      |
| `go vet`          | Scans for common coding mistakes |
| `go get`          |                                  |
| `go mod tidy`     |                                  |


```bash
go mod init hello_world
```

> Note: You shouldn'tedit `go.mod` directly. Instead, use the `go get` and `go
mod tidy` commands to manage changes to the file.


```bash
go build
# or
go build -o hello
go fmt ./...
go vet ./...
```

Unlike many other languages, in Go single quotes and double quotes are not
interchangeable.


Booleans

```go
var flag bool // no value assigned, set to false
var is Awesome = true
```

Integers

```go
var i0  byte  // Alias of uint8
var i1  int8
var i2  int16
var i3  int32
var i4  int64
var i5  uint8
var i6  uint16
var i7  uint32
var i8  uint64
var i9  int
var i10 uint
```

Floating-point

```go
var f1 float32
var f2 float64
```

> Note: literals in Go are untyped

Type Conversion

```go
var x int = 10
var y float64 = 30.2
var sum1 float64 =  float64(x) + y
var sum2 int =  x + int(y)
// byte()
```

`var` VS `:=`

```go
var x int = 10 // Explicit declaration
var x = 10     // You can leave off the type
var x int      // Initialize to zero
var x, y int = 10, 20
var x, t int
var x, y = 10, "hello"
var (          // declaration list
    x    int
    y        = 10
    z    int = 30
    d, e     = 40, "hello"
    f, g string
)
```

When you are within a function, you can use the `:=` operator to replace a `var`
declaration to use **type inference**

```go
// This two statements do exactly the same thing
var x = 10
x := 10
```

You also can do this

```go
var x, y = 10, "hello"
x, y := 10, "hello"
```

As long as at least one new variable is on the lefthand side of the `:=`, any of
the other variables can already exist:

```go
x := 10
x,y := 30, "hello"
```

Using `:=` has one limitation. If you are declaring a variable at the package
level, you must use var because `:=` is not legal outside of functions.


Rune

The `rune` type is an alias for the `int32` type

```go
var myFirstInitial rune = 'J'
```

Using const

```go
const x int64 = 10
const (
    idKey   = "id"
    nameKey = "name"
)
const z = 20 * 10

const x = 10
var y int = x
var x float64 = x
var d byte = x

const typedX int = 10
```


> Note: Go uses camel case (names like `indexCounter` or
`numberTries`) when an identifier name consists of multiple words.

> Note: An underscore by itself (`_`) is a special identifier name in Go; 

> Note: Go uses the case of the first letter in the name of a
package-level declaration to determine if the item is accessible outside the package.

> Note: Within a function, favor short variable names. The smaller the scope for a variable,
the shorter the name that’s used for it.


Arrays

```go
var x [3]int // Initialize to zero
var x = [3]int{10, 20 30}
var x = [12]int{1, 5: 4, 6, 10: 100, 15}

var x = [...]int{10, 20, 30}
var y = [3]int{1, 2, 3}
fmt.Println(x == y) // Print true
```

Go has only one-dimensional arrays, but you can simulate multidimensional
arrays:

```go
var x [2][3]int
x[0] = 10
fmt.Println(x[2])
```

Like most languages, arrays in GO are read and written using bracket syntax

```go
x[0] = 10
fmt.Println(x[2])
```

> Note: You cannot read or write past the end of an array or use a negative index.
If you do this with a constant or literal index, it is a compile-time error. An
out-of-bounds read or write with a variable index compiles but fails at runtime
with a panic 

Finally, the built-in function `len` takes in an array and returns its length:

```go
fmt.Println(len(x))
```

> Note: arrays in Go are rarely used explicitly. This is because they come with
> an unusual limitation. Go considers the size of the array to be part of the
> type of the array. This makes an array that's declared to be `[3]int` a
> different type from an array that's declared to be `[4]int`. This alsomeans
> that you cannot use a variable to specify the size of an array, because types
> must be resolved at compile time, not at run time.

> Note: you can’t use a type conversion to directly convert arrays of different sizes
to identical types. 

> Note: don’t use arrays unless you know the exact length
you need ahead of time. 


Slices

Most of the time, when you want a data structure that holds a sequence of
values, a slice is what you should use. You can grow slices as needed. This is
because the length os a slice is not part of its type.

You don't specify the size of the slice when you declare it

```go
var x = []int{10, 20, 30}
```

> Note: Using `[...]` makes an array. Using `[]` makes a slice






