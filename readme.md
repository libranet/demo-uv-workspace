# uv workspace demo

This project demonstrates a [uv](https://docs.astral.sh/uv/) workspace containing both regular Python packages and namespace packages.

See also
- https://docs.astral.sh/uv/concepts/build-backend/#namespace-packages
- https://github.com/astral-sh/uv/issues/6575


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

[foo-sub1] Building source distribution...
[foo-sub2] Building source distribution...
[foobar] Building source distribution...
[foo-sub1] Building wheel from source distribution...
[foobar] Building wheel from source distribution...
[foo-sub2] Building wheel from source distribution...
Successfully built var/dist/foo_sub1-0.1.tar.gz
Successfully built var/dist/foo_sub1-0.1-py3-none-any.whl
Successfully built var/dist/foo_sub2-0.2.tar.gz
Successfully built var/dist/foo_sub2-0.2-py3-none-any.whl
Successfully built var/dist/foobar-0.3.tar.gz
Successfully built var/dist/foobar-0.3-py3-none-any.whl
```

## Interactive Python-shell

Open a shell with `uv run python`:
```python
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
