# Just is a crossplatform task-runner, similar to make.
# And justfiles are equivalent to makefiles.
#
# Official docs:
#  - https://just.systems/man/en
#  - installation: https://just.systems/man/en/pre-built-binaries.html
#
# Usage:
#   > just  # configured to display all available tasks
#   > just --help
#   > just <taskname>
#
# Notes:
#  - Comments immediately preceding a recipe will appear in just --list

# load environment variables from .env file
set dotenv-filename := ".env"
set dotenv-load	:= true

# search for justfiles in parent directories
set fallback

# set tempdir := "var/tmp"

# enable experimental features
set unstable

# set shell to powershell on Windows
set windows-shell := ["pwsh.exe", "-NoLogo", "-Command"]
set shell := ["bash", "-uc"]


# Display all canonical tasks (default recipe)
[group: 'default']
list:
    @ just --list --unsorted --no-aliases



# install the uv workspace
[group: 'uv']
install args="":
    uv sync {{args}}


# build all workspace packages
[group: 'uv']
build args="":
    @ echo "Building all packages..."
    uv build --all-packages {{args}}


