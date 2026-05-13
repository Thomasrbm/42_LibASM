<div align="center">

# libasm

**A re-implementation of selected libc functions in x86_64 assembly.**

[![Language](https://img.shields.io/badge/language-NASM-blue.svg)](https://www.nasm.us/)
[![Architecture](https://img.shields.io/badge/arch-x86__64-red.svg)](https://en.wikipedia.org/wiki/X86-64)
[![Platform](https://img.shields.io/badge/platform-Linux%20ELF64-lightgrey.svg)](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)
[![Syntax](https://img.shields.io/badge/syntax-Intel-yellow.svg)](https://en.wikipedia.org/wiki/X86_assembly_language#Syntax)
[![School 42](https://img.shields.io/badge/school-42-black.svg)](https://42.fr/)

</div>

---

## Overview

`libasm` is a 42 cursus project whose goal is to rewrite a subset of the C standard library in pure x86_64 assembly, then package the result as a static archive (`libasm.a`) linkable from any C program.

The library follows the **System V AMD64 ABI** for argument passing and return values, complies with the **Intel syntax** required by the subject, and propagates `errno` through `libc` wrappers exactly like the original symbols would.

---

## Functions

### Mandatory

| Symbol        | C prototype                                       | Behavior                                    |
| ------------- | ------------------------------------------------- | ------------------------------------------- |
| `ft_strlen`   | `size_t ft_strlen(const char *s);`                | Returns the length of a null-terminated string. |
| `ft_strcpy`   | `char *ft_strcpy(char *dst, const char *src);`    | Copies `src` (including `\0`) into `dst`.   |
| `ft_strcmp`   | `int ft_strcmp(const char *s1, const char *s2);`  | Lexicographic comparison of two strings.    |
| `ft_write`    | `ssize_t ft_write(int fd, const void *buf, size_t n);` | Wrapper around `syscall write` with `errno`. |
| `ft_read`     | `ssize_t ft_read(int fd, void *buf, size_t n);`   | Wrapper around `syscall read` with `errno`. |
| `ft_strdup`   | `char *ft_strdup(const char *s);`                 | Returns a `malloc`'d duplicate of `s`.      |

### Bonus

| Symbol               | C prototype                                                                                  | Behavior                                       |
| -------------------- | -------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| `ft_atoi_base`       | `int ft_atoi_base(const char *str, const char *base);`                                       | Converts a string in arbitrary base to an int. |
| `ft_list_push_front` | `void ft_list_push_front(t_list **begin, void *data);`                                       | Pushes a new node at the head of a list.       |
| `ft_list_size`       | `int ft_list_size(t_list *begin);`                                                           | Returns the number of nodes in a list.         |
| `ft_list_sort`       | `void ft_list_sort(t_list **begin, int (*cmp)(void *, void *));`                             | In-place sort using a user-supplied comparator. |
| `ft_list_remove_if`  | `void ft_list_remove_if(t_list **begin, void *data_ref, int (*cmp)(void *, void *), void (*free_fct)(void *));` | Removes every node whose data matches `data_ref`. |

The linked-list node is defined as:

```c
typedef struct s_list {
    void           *data;
    struct s_list  *next;
} t_list;
```

---

## Build

### Requirements

- `nasm` ≥ 2.14
- `ar` (GNU binutils)
- A C compiler (`gcc` or `clang`) for the test program
- Linux x86_64

### Targets

```bash
make            # build mandatory functions into libasm.a
make bonus      # build mandatory + bonus functions into libasm.a
make clean      # remove object files
make fclean     # remove object files and libasm.a
make re         # fclean + all
```

### Assembler flags

```
-f elf64        # 64-bit ELF object format required by the linker
```

> The subject **forbids** `-no-pie`. Position-independent code is mandatory, which is why every external call goes through the PLT (`call malloc wrt ..plt`).

---

## Usage

Link `libasm.a` into any C program:

```bash
nasm -f elf64 srcs/ft_strlen.s -o objs/ft_strlen.o
ar rcs libasm.a objs/*.o
gcc main.c -L. -lasm -o test_asm
```

Minimal example:

```c
#include <stdio.h>
#include <stddef.h>

size_t  ft_strlen(const char *s);
char   *ft_strdup(const char *s);

int main(void)
{
    const char *src = "Hello, libasm!";
    char       *dup = ft_strdup(src);

    printf("len = %zu\n", ft_strlen(src));
    printf("dup = %s\n", dup);
    free(dup);
    return 0;
}
```

---

## Calling convention (System V AMD64 ABI)

| Purpose                        | Registers                                  |
| ------------------------------ | ------------------------------------------ |
| Integer / pointer args (1–6)   | `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`     |
| Return value                   | `rax` (`rdx:rax` for 128-bit values)       |
| Syscall number                 | `rax`                                      |
| Syscall args (1–6)             | `rdi`, `rsi`, `rdx`, `r10`, `r8`, `r9`     |
| Caller-saved (volatile)        | `rax`, `rcx`, `rdx`, `rsi`, `rdi`, `r8–r11` |
| Callee-saved (preserved)       | `rbx`, `rbp`, `r12–r15`                    |

`errno` is set through the libc helper `__errno_location` on Linux. The `ft_read` and `ft_write` wrappers check the sign of the syscall return: on failure they negate it, store it through `__errno_location`, and return `-1`.

---

## Project layout

```
.
├── Makefile
├── srcs/                 # assembly sources
│   ├── ft_strlen.s
│   ├── ft_strcpy.s
│   ├── ft_strcmp.s
│   ├── ft_write.s
│   ├── ft_read.s
│   ├── ft_strdup.s
│   ├── ft_atoi_base.s
│   ├── ft_list_new.s
│   ├── ft_list_push_front.s
│   ├── ft_list_size.s
│   ├── ft_list_sort.s
│   └── ft_list_remove_if.s
├── objs/                 # generated object files
├── t_list.h              # public header for bonus list functions
└── libasm.a              # produced static library
```

---

## Implementation notes

- **Section markers.** Every translation unit ends with `section .note.GNU-stack noalloc noexec nowrite progbits` to mark the stack as non-executable and silence the linker warning on modern toolchains.
- **Local labels.** Inside a function, jumps use `.label` (file-local). Public symbols use `_underscore` or the bare function name, declared via `global`.
- **String literals.** Constants live in `.rodata`; `len equ $ - msg` is used to compute string length at assemble time.
- **Memory-to-memory moves.** Because x86 forbids `mov [mem], [mem]`, copies always go through a scratch register (typically the low byte of an unused volatile register, e.g. `dl`).
- **Bus alignment.** Loads are kept naturally aligned to avoid `SIGBUS` on strict targets.

---

## Testing

A C driver (`main.c` in `Rework asm/`) exercises every function against its libc counterpart, including error paths:

- `NULL` pointers
- empty strings
- invalid bases (duplicates, whitespace, `+`/`-`)
- bad file descriptors (to verify `errno == EBADF`)
- `malloc` failure simulation for `ft_strdup`

Compile and run:

```bash
gcc main.c libasm.a -o test_asm && ./test_asm
```

---

## Subject constraints

- Intel syntax only — no AT&T.
- Forbidden flags: `-no-pie`.
- Forbidden functions: anything the subject does not explicitly authorize.
- `errno` must be handled the same way the C library handles it.
- Every function must compile and behave correctly even when called with `NULL`.

---

## References

- *System V Application Binary Interface — AMD64 Architecture Processor Supplement*
- *Intel® 64 and IA-32 Architectures Software Developer's Manual*
- `man 2 syscall`, `man 2 write`, `man 2 read`
- [Linux syscall table (x86_64)](https://syscalls.w3challs.com/?arch=x86_64)
- NASM Manual — <https://www.nasm.us/doc/>

---

<div align="center">

Built as part of the **42 cursus**.

</div>
