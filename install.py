import os
import subprocess as sp

ignore = [".DS_Store", ".git", ".gitignore", "install.py"]
home = os.path.expanduser("~")
here = os.path.dirname(__file__)

for root, dirs, files in os.walk(here):
	for d in dirs:
		src = os.path.relpath(os.path.join(root, d), here)
		dst = os.path.join(home, src)

		if os.path.exists(dst):
			print(d + ": Directory exists")
		elif os.path.lexists(dst):
			print(d + ": Broken link")
		else:
			cmd = ["mkdir", dst]
			print(" ".join(cmd))
			sp.call(cmd)

for root, dirs, files in os.walk(here):
	for f in files:
		src_abs = os.path.join(root, f)
		src_rel = os.path.relpath(src_abs, here)
		dst = os.path.join(home, src_rel)

		if f in ignore:
			print(f + ": Ignored")
			continue
		if os.path.exists(dst):
			print(f + ": File exists")
		elif os.path.lexists(dst):
			print(f + ": Broken link")
		else:
			cmd = ["ln", "-s", src_abs, dst]
			print(" ".join(cmd))
			sp.call(cmd)
