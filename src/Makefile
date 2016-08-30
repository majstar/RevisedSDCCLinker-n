#!/bin/make
# -- makefile for preparing, compiling and deploying the Revised
#    SDCCLinker executable

include ../_configure.mk
include _localconfigure.mk

#-----------------

.PHONY: all deploy process prepare clean install uninstall

all: deploy

deploy: process

process: prepare

#===============
#= PREPARATION =
#===============

#------------------
#- C source files -
#------------------

targetDirectories := \
  $(TARGET_SOURCE_DIR) $(TARGET_SOURCE_DIR)/platform

.PHONY: $(targetDirectories)

$(targetDirectories):
	$(MKDIR_PROGRAM) -p $@

targetFiles := \
    $(SUPPORTING_MODULE_NAME_LIST:%=$(TARGET_SOURCE_DIR)/%$(HDREXT)) \
    $(SUPPORTING_MODULE_NAME_LIST:%=$(TARGET_SOURCE_DIR)/%$(SRCEXT)) \
    $(TARGET_SOURCE_DIR)/main$(SRCEXT)

$(targetFiles): | $(targetDirectories)

$(targetFiles): $(TARGET_SOURCE_DIR)/% : %
	$(CP_PROGRAM) $< $@

prepare: $(targetFiles)

#==============
#= PROCESSING =
#==============

# object directories
objectDirectories := \
    $(TARGET_OBJECT_DIR) $(TARGET_OBJECT_DIR)/platform

.PHONY: $(objectDirectories)

$(objectDirectories):
	$(MKDIR_PROGRAM) -p $@

# object files requiring a special compilation
specialObjectFiles := $(TARGET_OBJECT_DIR)/mapfile$(OBJEXT)

# object files requiring a standard compilation
standardObjectFiles := $(SUPPORTING_MODULE_NAME_LIST:platform/=)
standardObjectFiles := $(standardObjectFiles:%=$(TARGET_OBJECT_DIR)/%$(OBJEXT))
standardObjectFiles := \
    $(filter-out $(specialObjectFiles), $(standardObjectFiles))

mainObjectFile := $(TARGET_OBJECT_DIR)/main$(OBJEXT)

allObjectFiles := \
    $(mainObjectFile) $(standardObjectFiles) $(specialObjectFiles)

$(allObjectFiles): | $(objectDirectories)

$(standardObjectFiles) $(mainObjectFile): \
    $(TARGET_OBJECT_DIR)/%$(OBJEXT): $(TARGET_SOURCE_DIR)/%$(SRCEXT)
	$(standardCompileCommand)

$(specialObjectFiles): $(TARGET_OBJECT_DIR)/%$(OBJEXT): $(TARGET_SOURCE_DIR)/%$(SRCEXT)
	$(extendedCompileCommand)

# the main executable file
executableFile := $(TARGET_OBJECT_DIR)/main$(EXEEXT)

$(executableFile): $(allObjectFiles)
	@echo "### SDCC linker: linking into " $@ \
	&& $(CLINKER) $(CLINKFLAGS) $(CLINK_OUTFLAG) $@ $^

process: $(executableFile)

#-----------------------
#- processing commands -
#-----------------------

standardCompileCommand = \
    @echo "=== compiling" $< "===" \
    && $(CCOMP) $(CCOMPFLAGS) $< $(CCOMP_OUTFLAG)$@

extendedCompileCommand = \
    @echo "=== compiling" $< "[]===" \
    && $(CCOMP) $(EXTENDED_CCOMPFLAGS) $< $(CCOMP_OUTFLAG)$@


#==========
#= DEPLOY =
#==========

deploy:
	$(CP_PROGRAM) $(executableFile) $(TARGET_EXECUTABLE)


#===========
#= CLEANUP =
#===========

# -- cleaning up the temporary files generated
# -- for the documentation: the figures, logs and the interface
# -- description TeX files for all modules

clean:
	$(RM_PROGRAM) $(allObjectFiles)
	$(RM_PROGRAM) $(executableFile)


#===========
#= INSTALL =
#===========

install: deploy
	$(CP_PROGRAM) $(TARGET_EXECUTABLE) $(bindir)/$(TARGET_EXECUTABLE_NAME)


#=============
#= UNINSTALL =
#=============

uninstall:
	$(RM_PROGRAM) $(bindir)/$(TARGET_EXECUTABLE_NAME)
