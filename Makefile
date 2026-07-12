NUKLEAR_H   := nuklear.h
API_JSON    := nuklear_api.json
PYTHON      := python3
SCRIPTS     := scripts
CC          := cc
CFLAGS      := -O2 -I.

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
    SHIM_LIB     := libnuklear.dylib
    SHARED_FLAGS := -dynamiclib
else
    SHIM_LIB     := libnuklear.so
    SHARED_FLAGS := -shared -fPIC
endif

.PHONY: all api bindings lib clean

## Default: parse header, generate bindings, build shared lib
all: api bindings lib

## Step 1: parse nuklear.h -> JSON
api: $(API_JSON)

$(API_JSON): $(NUKLEAR_H) $(SCRIPTS)/nuklear2json.py
	$(PYTHON) $(SCRIPTS)/nuklear2json.py $(NUKLEAR_H) $(API_JSON)

## Step 2: JSON -> Lisp bindings + C shim source
bindings: package.lisp enums.lisp structs.lisp functions.lisp nuklear_shims.c

package.lisp enums.lisp structs.lisp functions.lisp nuklear_shims.c &: \
		$(API_JSON) $(SCRIPTS)/bindings2lisp.py
	$(PYTHON) $(SCRIPTS)/bindings2lisp.py $(API_JSON) .

## Step 3: compile shim source -> shared library
lib: $(SHIM_LIB)

$(SHIM_LIB): nuklear_shims.c $(NUKLEAR_H)
	$(CC) $(SHARED_FLAGS) $(CFLAGS) -o $@ $<

clean:
	rm -f $(API_JSON) \
	      package.lisp enums.lisp structs.lisp functions.lisp \
	      nuklear_shims.c libnuklear.dylib libnuklear.so \
	      cl-nuklear.asd
