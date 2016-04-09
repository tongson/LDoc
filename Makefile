.POSIX:
.SUFFIXES:
EXE= ld
MAIN= $(EXE).lua
VENDOR_C= lfs
VENDOR_LUA= markdown
VENDOR_SUBDIRS= pl ldoc
VENDOR_DEPS+= pl/app.lua pl/array2d.lua pl/class.lua pl/compat.lua pl/comprehension.lua pl/config.lua pl/data.lua pl/Date.lua pl/dir.lua pl/file.lua pl/func.lua pl/import_into.lua pl/init.lua pl/input.lua pl/lapp.lua pl/lexer.lua pl/List.lua pl/luabalanced.lua pl/Map.lua pl/MultiMap.lua pl/operator.lua pl/OrderedMap.lua pl/path.lua pl/permute.lua pl/pretty.lua pl/seq.lua pl/Set.lua pl/sip.lua pl/strict.lua pl/stringio.lua pl/stringx.lua pl/tablex.lua pl/template.lua pl/test.lua pl/text.lua pl/types.lua pl/url.lua pl/utils.lua pl/xml.lua
VENDOR_DEPS+= ldoc/builtin/coroutine.lua ldoc/builtin/lfs.lua ldoc/lang.lua ldoc/html.lua ldoc/builtin/table.lua ldoc/builtin/os.lua ldoc/doc.lua ldoc/html/ldoc_one_css.lua ldoc/builtin/string.lua ldoc/builtin/package.lua ldoc/builtin/math.lua ldoc/builtin/lpeg.lua ldoc/builtin/io.lua ldoc/builtin/debug.lua ldoc/builtin/global.lua ldoc/builtin/globals.lua ldoc/html/ldoc_ltp.lua ldoc/tools.lua ldoc/html/ldoc_css.lua ldoc/markup.lua ldoc/prettify.lua ldoc/parse.lua ldoc/lexer.lua
LIB=
MAKEFLAGS= --silent
CC= cc
export CC
LD= ld
RANLIB= ranlib
AR= ar
CCWARN= -Wall
CCOPT= -Os -mtune=generic -mmmx -msse -msse2 -fomit-frame-pointer -pipe
CFLAGS+= -ffunction-sections -fdata-sections -fno-asynchronous-unwind-tables -fno-unwind-tables
LDFLAGS= -Wl,--gc-sections -Wl,--strip-all -Wl,--relax -Wl,--sort-common
luaDEFINES:= -DLUA_COMPAT_BITLIB -DLUA_USE_POSIX
include aux/tests.mk
include aux/flags.mk
include aux/std.mk
ifneq ($(LIB),)
  include $(eval _d:=lib/$(LIB) $(_d)) $(call _lget,$(LIB))
endif
ifneq ($(VENDOR_C),)
  include $(eval _d:=vendor/c/$(VENDOR_C) $(_d)) $(call _vget,$(VENDOR_C))
endif
include aux/rules.mk
