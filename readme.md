# uv workspace demo

This project demonstrates a [uv](https://docs.astral.sh/uv/) workspace containing both regular Python packages and namespace packages.

See also https://github.com/astral-sh/uv/issues/6575

## Project Structure

This workspace contains three packages:

- **foobar** - A regular Python package located in `src/foobar/`
- **foo.sub1** - A namespace package located in `src/foo-sub1/`
- **foo.sub2** - A namespace package located in `src/foo-sub2/`

## Installation

Install all packages in the workspace using:

```bash
uv sync
```

This will create a virtual environment and install all packages defined in the workspace.

## Build all packages

```bash
uv build --all-packages
```


## Interactive shell

```bash
uv run python
>>> import foo
foo.__path__
_NamespacePath([
    '<project-dir>/src/foo-sub1/src/foo',
    '<project-dir>/src/foo-sub2/src/foo'])

>>> import foo.sub1
>>> foo.sub1.hello()
Hello from foo.sub1!

>>> import foo.sub2
>>> foo.sub2.hello()
Hello from foo.sub2!
```