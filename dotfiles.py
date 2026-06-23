import argparse
import dotfiles.config as config
from pathlib import Path
import dotfiles.install as install
import dotfiles.configure as configure
import dotfiles.util as util

config.set_dotfiles_dir(Path(__file__).resolve().parent)

parser = argparse.ArgumentParser()
subparsers = parser.add_subparsers(dest="command", required=True)

install_parser = subparsers.add_parser("install", help="Install / Reinstall programs")
install_parser.add_argument("programs", nargs="?")

config_parser = subparsers.add_parser("config", help="Update configuration files")
config_parser.add_argument("programs", nargs="?")

args = parser.parse_args()

if (args.command == "install"):
    if not args.programs:
        print("No program(s) specified. Installing all programs")
    else:
        programs = args.programs.split()

        for program in programs:
            match program:
                case "zellij":
                    util.run(install.zellij.install, "Installing zellij")
                case "alacritty":
                    util.run(install.alacritty.install, "Installing alacritty")
                case "neovim":
                    util.run(install.neovim.install, "Installing neovim")
                case "lldb-dap":
                    util.run(install.lldbdap.install, "Installing lldb-dap")

if (args.command == "config"):
    if not args.programs:
        print("No program(s) specified. Updating all configurations")
    else:
        programs = args.programs.split()

        for program in programs:
            match program:
                case "zellij":
                    util.run(configure.zellij.configure, "Refreshing zellij config")
                case "alacritty":
                    util.run(configure.alacritty.configure, "Refreshing alacritty config")
                case "neovim":
                    util.run(configure.neovim.configure, "Refreshing neovim config")
