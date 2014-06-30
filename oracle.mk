#/bin/make
###############################################################################
#                       Make file for OCI,OCCI and ODBC demos
###############################################################################
#  Usage :
# For compiling & linking the cdemo81.c file
#    make -f demo_xe.mk buildoci CDEMOEXE=cdemo81 CDEMOOBJS=cdemo81.o 
#
# For compiling & linking the occidml.cpp
#    make -f demo_xe.mk buildocci EXE=occidml OBJS=occidml.o
#
# For compiling & linking the occiobj.cpp
#    make -f demo_xe.mk occiobj 
#
# For compiling & linking ODBCDEMOS
#     make -f demo_xe.mk buildodbcdemo 
#     ODBCDM_HOME=<path where unix driver manager is installed> 
#     ODBCDEMOOBJS=odbcdemo.o ODBCDEMOEXE=odbcdemo 
#
# In general, for any occi program
#    make -f demo_xe.mk buildocci EXE=<exename> OBJS="<list of dependent objs>"
#
# For compiling all demos
#    make -f demo_xe.mk
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
OCCILIB=$(ICLIBPATH) -locci -lclntsh $(THREADLIBS)

CCINCLUDES = -I$(ICINCHOME)

SO_EXT=.so
EXTLDFLAGS=$(LDFLAGS) -shared

REMOVE=rm -rf
MKLINK=ln
MAKE=make
MAKEFILE=oracle.mk

# Linux compiler definitions
CC=/usr/bin/gcc
cc=/usr/bin/gcc
CCC=/usr/bin/g++

CCFLAGS=$(CCINCLUDES) -DLINUX -D_GNU_SOURCE -D_REENTRANT -g
LDFLAGS=-g

