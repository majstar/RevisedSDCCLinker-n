#!/bin/make
# -- file containing the local settings for the Revised SDCC Linker
# -- source overriding the global settings

#-- the C compiler flags
CCOMPFLAGS := -g -c -I$(TARGET_SOURCE_DIR)

EXTENDED_CCOMPFLAGS := $(CCOMPFLAGS)

# -- the C compiler flag for specifying the output object file
CCOMP_OUTFLAG := -o

# -- the C linker flags
#CLINKFLAGS := -lc --entry main
CLINKFLAGS := -lc

# -- the C linker flag for specifying the output file
CLINK_OUTFLAG := -o
