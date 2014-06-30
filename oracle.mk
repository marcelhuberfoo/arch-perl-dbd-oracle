#/bin/make
###############################################################################
#                       Make file for OCI,OCCI and ODBC demos
###############################################################################
#  Usage :
# In general, for any occi program
#    make -f oracle.mk buildocci EXE=<exename> OBJS="<list of dependent objs>"
#
# NOTE: Please change cc and CC to point to the appropiate location on your
#       machine.
#
###############################################################################

.SUFFIXES: .o .c .cpp

ICINCHOME=/usr/include/
ICLIBHOME=/usr/lib/
ICLIBPATH=-L$(ICLIBHOME)
CCLIB=$(ICLIBPATH) -lclntsh $(THREADLIBS)

CCINCLUDES = -I$(ICINCHOME)

SO_EXT=.so
EXTLDFLAGS=$(LDFLAGS) -shared

REMOVE=rm -rf
MKLINK=ln
MAKE=make
MAKEFILE=oracle.mk

# Linux compiler definitions
CC=/usr/bin/gcc

CCFLAGS=$(CCINCLUDES) -DLINUX -D_GNU_SOURCE -D_REENTRANT -g
LDFLAGS=-g

