EXE= ld
APP=
APP_DIR= ldoc ldoc/builtin ldoc/html
APP_C=
VENDOR= markdown
VENDOR_DIR= pl
VENDOR_C= lfs
MAKEFLAGS= --silent
CC= cc
LD= ld
RANLIB= ranlib
AR= ar
NM= nm
CCOPT= -Os -mtune=generic -mmmx -msse -msse2 -fomit-frame-pointer -pipe
CFLAGS+= -ffunction-sections -fdata-sections -fno-asynchronous-unwind-tables -fno-unwind-tables
LDFLAGS= -Wl,--gc-sections -Wl,--strip-all -Wl,--relax -Wl,--sort-common
luaDEFINES:= -DLUA_COMPAT_BITLIB -DLUA_USE_POSIX
include aux/tests.mk
include aux/std.mk
include aux/rules.mk
