#!/bin/make
# -- file containing the global settings for the SDCCLinker generation
#
# naming convention for variables:
#  - globally visible names are upper-case and underscore-separated
#  - local names are lower-case, camel-cased

SHELL:=/bin/sh
.SUFFIXES:

#------------------------
#- file name extensions -
#------------------------

#-- extension of executable file names
EXEEXT := 

#-- extension of object file names
OBJEXT := .o

#-- extension of source file names
SRCEXT := .c

#-- extension of header file names
HDREXT := .h


#---------------------------
#- target root directories -
#---------------------------

#-- the root of the complete installation target directories
TARGET_ROOT_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

#-- the root directory of C include and src files
TARGET_SOURCE_DIR:=$(TARGET_ROOT_DIR)/src

#-- the root directory of object files
TARGET_OBJECT_DIR:=$(TARGET_ROOT_DIR)/objects

# -- the directory of documentation files
TARGET_DOCUMENTATION_DIR:=$(TARGET_ROOT_DIR)/doc

#----------------
#- target files -
#----------------

#-- the name of the target SDCC linker executable file
TARGET_EXECUTABLE_NAME:=sdldgb_rev$(EXEEXT)
#-- the path name of the target SDCC linker program
TARGET_EXECUTABLE:=$(TARGET_ROOT_DIR)/$(TARGET_EXECUTABLE_NAME)
#-- the name of the target SDCC linker document file
TARGET_DOCUMENTATION_FILE:=rev_sdcc_linker-documentation.pdf
#-- the path name of the target SDCC linker documentation
TARGET_DOCUMENTATION:=$(TARGET_ROOT_DIR)/$(TARGET_DOCUMENTATION_FILE)

#--------------------
#- support programs -
#--------------------

#-- the path name of the copy program (CP)
CP_PROGRAM:=cp$(EXEEXT)

#-- the path name of the GAWK program
GAWK_PROGRAM:=gawk$(EXEEXT)

#-- the path name of the directory creation program (MKDIR)
MKDIR_PROGRAM:=mkdir$(EXEEXT)

#-- the path name of the file movement program (MV)
MV_PROGRAM:=mv$(EXEEXT)

#-- the path name of the file deletion program (RM)
RM_PROGRAM:=rm$(EXEEXT) -f

#-- the directory of the specific development tools
currentFilePath:=$(strip $(dir $(lastword $(MAKEFILE_LIST))))
TOOLS_DIR:=$(currentFilePath)tools

#-- the C compiler and linker
CCOMP:=gcc$(EXEEXT)
#CLINKER:=ld$(EXEEXT)
CLINKER:=gcc$(EXEEXT)

#-- the LaTeX and MetaPost programs
PDFLATEX:=pdflatex$(EXEEXT)
METAPOST:=mpost$(EXEEXT)

#---------------------------
#- configuration variables -
#---------------------------

#-- the name list of all supporting modules (excluding main) --
SUPPORTING_MODULE_NAME_LIST:=area banking codeoutput codesequence error file \
                             globdefs integermap library list listingupdater \
                             map mapfile module multimap noicemapfile parser \
                             scanner set string stringlist stringtable symbol \
                             target typedescriptor platform/gameboy

#-- the name list of all supporting modules (including main) --
MODULE_NAME_LIST:=$(SUPPORTING_MODULE_NAME_LIST) main

#-------------------------------
#- installation path variables -
#-------------------------------

#-- default values for installation path variables
prefix?=/usr/local
exec_prefix:=${prefix}
bindir:=${exec_prefix}/bin
datarootdir:=${prefix}/share
docdir:=${datarootdir}/sdcc/doc
