"""
Executing this script generate ~/install.sh.
Check the content of install.sh and execute it.
"""

import os

ignore = [".DS_Store", ".git", ".gitignore", "install.py"]
home = os.path.expanduser("~")
here = os.path.dirname(__file__)

cmd_ = []
cmd_force_ = []
log_ = []
ignore_ = []


def _ln_s(_target, _link):
	if os.path.islink(_link):
		log_.append(f"### Warning: {_link}: Already linked")
	elif os.path.exists(_link):
		log_.append(f"### {_link}: File exists")
		cmd_force_.append(f"#ln -sf {_target} {_link}")
	else:
		cmd_.append(f"ln -s {_target} {_link}")

for root, dirs, files in os.walk(here):
	for f in files:
		target_full_path = os.path.join(root, f)
		target_rel_dir = os.path.relpath(root, here)
		target_top_dir = target_rel_dir.split(os.path.sep)[0]
		link_dir = os.path.join(home, target_rel_dir)
		link_full_path = link_dir + "/" + f

		if f in ignore or target_top_dir in ignore:
			ignore_.append(f"## {f}")

		elif not os.path.exists(link_dir):
			cmd_.append(f"### {link_dir} does not exist.")
			cmd_.append(f"mkdir -p {link_dir}")
			_ln_s(target_full_path, link_full_path)

		else:
			_ln_s(target_full_path, link_full_path)


# Platform specific symlink
if os.uname().sysname == 'Darwin':
	for f in ["keybindings.json", "settings.json"]:
		target_full_path = home+"/dotfiles/.config/Code/User/"+f
		link_full_path = home+"/Library/Application\ Support/Code/User/"+f
		_ln_s(target_full_path, link_full_path)

elif "microsoft" in os.uname().release:
	for f in ["keybindings.json", "settings.json"]:
		target_full_path = home+"/dotfiles/.config/Code/User/"+f
		link_full_path = "/mnt/c/Users/kokep/AppData/Roaming/Code/User/"+f
		_ln_s(target_full_path, link_full_path)


# Generate installer
install_sh = os.path.join(home, "install.sh")
with open(install_sh, "w") as f:
	f.write("#!/bin/sh\n\n")

	f.write("# To generate symlinks, execute following commands:\n")
	for line in cmd_:
		f.write(str(line)+"\n")
	f.write("\n# Following files are already exists. Romove comment outs if needed:\n")
	for line in cmd_force_:
		f.write(str(line)+"\n")
	f.write("\n# Following files are ignored:\n")
	for line in ignore_:
		f.write(str(line)+"\n")
	f.write("\n##############################\n")
	for line in log_:
		f.write(str(line)+"\n")
