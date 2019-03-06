sh4-oe-starter

Starter repository for SH4 based satellite receiver OpenPLi
Enigma 2 software based on Open-Embedded.

Instructions

To set up your sh4-oe build environment, do the following:

1. If it not installed yet, install the git package for your Linux distribution.
   As an alternative, your can download the file prepare-for-oe.sh, give it execution rights and excute it with superuser rights.

2. Create a temporary directory. In the rest of this text, this directory will be named X.

3. In directory X, open a terminal and clone this repository with the command:
   'clone git://github.com/Audioniek/sh4-oe starter.git .'
   Note the period at the end.

4. In directory X, clone the build environment with the command:
   ./clone.sh
   You will be asked for the directory where the build environment will reside. You can accept the default by pressing Enter.
   In the rest of this text, this directory will be named Y.

   CAUTION: You must give the complete path, otherwise the build environment will be a subdirectory of directory X.

   The temporary directory X is now no longer needed and you delete it.
   
5. If not done yet in step 1, run the file Y/prepare-for-oe.sh with superuser rights. This will install all the necessary packages for your distribution.

6. Your sh4-oe build environment is now ready. See the file Y/README.md for further information on how to proceed.

This sh4-oe build environment is largely based on the work of OpenATV and OpenVisionE2 and they are thanked for their effort.
