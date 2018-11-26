======================================
Revised SDCC-Linker Distribution
======================================

This is the source suite for the Revised SDCC Linker for the SDCC-C-Compiler. The repository includes source code of the Revised SDCC Linker and configuration files for building on Linux platforms.

Original author of the Revised SDCC Linker project is Dr. Thomas Tensi (http://www.tensi.eu). Original source code, documentation and Windows binaries are available on the site of Dr. Thomas Tensi (http://www.tensi.eu/thomas/programming/asxxx-linker/asxxxlinker.html).

The Revised SDCC Linker is a completely renovated version of the linker from the 8-bit-assembler suite ASXXX from Alan Baldwin for the compiler SDCC.

-------------
Preconditions
-------------

Ensure that you have the following software available:

  - Linux (Unix) based OS;
  - some C compiler for your platform (GNU C compiler is used by default);
  - an AWK program (e.g. GNU awk);
  - LaTeX and MetaPost (if you want to generate the documentation).

------------------
Building
------------------

For building the linker and documentation you should run the following command:

$ make

To clean up temporary files run the following command:

$ make clean

------------------
Installation
------------------

For installation you can create a package via checkinstall suite. Go to the root directory of the repo and run the following command:

$ checkinstall prefix=<installation prefix>

After package was created, install it with a package manager.

If you do not want to create a package, you can just run "make install" command:

$ make install prefix=<installation prefix>

Installation directories are specified in _configure.mk, you can change them:

$bindir  --  the installation directory for binaries
$docdir  --  the installation directory for documentation .pdf file

-----------------------------
Note for non-Linux platforms
-----------------------------

Original sources with Windows build tools and Windiws binaries of the Revised SDCC Linker are available here: http://www.tensi.eu/thomas/programming/asxxx-linker/asxxxlinker.html
