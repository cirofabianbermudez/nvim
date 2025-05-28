# C++ programming notes

## Installation

### Linux

Version 1

```bash
sudo apt update
sudo apt install build-essential
```

Version 2

```bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt install gcc-13 g++-13
```

create an alias in `~/.bashrc`, in Makefiles remember to use g++-13


### Windows


```powershell
scoop bucket add versions
scoop install versions/mingw-winlibs-llvm-msvcrt
```


## Compilation Flags

| Flag                       | Description                                                                                      |
| -------------------------- | ------------------------------------------------------------------------------------------------ |
| `-o <filename>`            | Specifies the output file name.                                                                  |
| `-c`                       | Compile the source code files into object files                                                  |
| `-Wall`                    | Enables almost all compiler warnings.                                                            |
| `-Wextra`                  | Enables more compiler warnings.                                                                  |
| `-std=c++14`               | Specifies the C++ language standard to use.                                                      |
| `-Wno-missing-braces`      | Suppresses warnings related to missing braces in initializers.                                   |
| `-g`                       | Generates debug information to be used by debuggers like GDB.                                    |
| `-O0`, `-O1`, `-O2`, `-O3` | Disables almost all optimizations. Basic optimization. Moderate optimization. High optimization. |
| `-I <path>`                | Specifies an additional directory to search for header files.                                    |
| `-L <path>`                | Specifies an additional directory to search for library files.                                   |
| `-l <file>`                | Specifies the name of the library to link against.                                               |

> **Warning:**  for `-I`, `-L`, `-l` if an error occurs remove the blank.


## Data Structures

| Data Structure            | Header            | Category              | Description                                 |
| ------------------------- | ----------------- | --------------------- | ------------------------------------------- |
| `std::vector<T>`          | `<vector>`        | Sequence              | Dynamic array; contiguous storage.          |
| `std::deque<T>`           | `<deque>`         | Sequence              | Double-ended queue; fast insert/erase ends. |
| `std::list<T>`            | `<list>`          | Sequence              | Doubly-linked list.                         |
| `std::forward_list<T>`    | `<forward_list>`  | Sequence              | Singly-linked list (lower overhead).        |
| `std::array<T, N>`        | `<array>`         | Sequence              | Fixed-size array; stack-allocated.          |
| `std::string`             | `<string>`        | Sequence              | Dynamic array of characters.                |
| `std::bitset<N>`          | `<bitset>`        | Sequence              | Fixed-size sequence of bits.                |
| `std::set<T>`             | `<set>`           | Associative           | Sorted unique keys.                         |
| `std::map<K,V>`           | `<map>`           | Associative           | Sorted key→value pairs.                     |
| `std::unordered_set<T>`   | `<unordered_set>` | Unordered associative | Hash-based unique keys.                     |
| `std::unordered_map<K,V>` | `<unordered_map>` | Unordered associative | Hash-based key→value pairs.                 |
| `std::stack<T>`           | `<stack>`         | Container adaptor     | LIFO adaptor (default `deque`).             |
| `std::queue<T>`           | `<queue>`         | Container adaptor     | FIFO adaptor (default `deque`).             |
| `std::priority_queue<T>`  | `<queue>`         | Container adaptor     | Heap-based max-priority queue.              |


## lvalues and rvalue


## References

### Books

[C++ Core Guidelines - Bjarne Stroustrup](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines)

[Competitive Programmer's Handbook - Antti Laaksonen](https://cses.fi/book/book.pdf)

[Effictive Modern C++ - Scoot Meyers](https://ananyapam7.github.io/resources/C++/Scott_Meyers_Effective_Modern_C++.pdf)

### Websites

[learncpp.com](https://www.learncpp.com/)

[cppreference.com](https://en.cppreference.com/)

