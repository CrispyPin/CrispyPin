#!/bin/env python3
import time
import datetime
import os
from subprocess import call


ROOT_DIR = "/home/crispypin/pictures/VRChat/"
MAX_SIZE = 8 * 1024 * 1024

PROCESSED = []

def delay(seconds=30):
	# delay that can be keyboard interrupted
	for _ in range(10*seconds):
		time.sleep(0.1)

def scan():
	print("scanning")
	date = datetime.datetime.now()
	month = f"{date.year}-{date.month:02d}/"
	path = ROOT_DIR + month
	print(f"checking {path}")
	items = os.listdir(path)
	# print(items)
	for f in items:
		if os.path.isfile(path + f):
			if os.path.getsize(path + f) > MAX_SIZE and f not in PROCESSED:
				# input(f)
				call(f"convert {f} temp.{f}", cwd=path, shell=True)
				call(f"mv temp.{f} {f}", cwd=path, shell=True)
			PROCESSED.append(f)

while True:
	scan()
	delay(60)

