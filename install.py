#!/usr/bin/env python3

import shutil
import subprocess
import tempfile
from pathlib import Path


def _install_uv():
    # Make sure uv is installed
    if shutil.which("uv"):
        return
    subprocess.run(
        "curl -LsSf https://astral.sh/uv/install.sh | sh",
        shell=True,
        check=True,
    )
    print("uv installed successfully.")


def _install_xonsh():
    # Make sure xonsh is installed
    if shutil.which("xonsh"):
        return
    subprocess.run(
        ["uv", "tool", "install", "xonsh[full]"],
        check=True,
    )
    print("xonsh installed successfully.")


def _install_dotfiles():
    # Clone the repo to a temporary directory
    with tempfile.TemporaryDirectory() as tmpdir:
        repo_url = "https://github.com/nimashoghi/dotfiles.git"
        subprocess.run(
            ["git", "clone", repo_url, tmpdir],
            check=True,
        )

        # With the exception of install.py, copy all files to the home directory
        # We should do this non-destructively, i.e., if a file exists, we should
        # create a backup of it first.
        home = Path.home()
        for item in Path(tmpdir).iterdir():
            if item.name in {"install.py", ".git", ".gitignore"}:
                continue

            dest = home / item.name
            if dest.exists():
                backup = dest.with_suffix(dest.suffix + ".backup")
                dest.rename(backup)
                print(f"Backed up {dest} to {backup}")

            if item.is_dir():
                shutil.copytree(item, dest)
            else:
                shutil.copy2(item, dest)
            print(f"Installed {dest}")
    print("Dotfiles installed successfully.")


def _set_git_configs():
    # Set global git configurations
    subprocess.run(
        ["git", "config", "--global", "core.hooksPath", "~/.config/git/hooks"],
        check=True,
    )
    print("Global git configurations set successfully.")


def main():
    _install_uv()
    _install_xonsh()
    _install_dotfiles()
    _set_git_configs()


if __name__ == "__main__":
    main()
