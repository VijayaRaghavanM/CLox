#!/usr/bin/python3
import os
import subprocess

# Set source directory
srcDir = "src"

# Get all files from the source directory
files = os.listdir(srcDir)

# List to store all the intermediary object file names
objects = []

# Compilation step
for file in files:
    filedetails = file.split(".")
    filename = filedetails[0]
    extension = filedetails[-1]
    if extension =="c" and filename != "main":
        compileCommand = ["gcc", srcDir+"/"+file, "-c"]
        subprocess.call(compileCommand)
        obj_file = filename + ".o"
        objects.append(obj_file)

# Linking step
mainCommand = ["gcc"]
for obj_file in objects:
    mainCommand.append(obj_file)
mainCommand.append(srcDir+"/main.c")
subprocess.call(mainCommand)

# Deleting the object files
for obj_file in objects:
    cleanCommand = ["rm", obj_file]
    subprocess.call(cleanCommand)

# Executing the program
subprocess.call(["./a.out"])