PYTHON := python
.SUFFIXES: .asm .tx .o .gbc .png .2bpp .lz
.PHONY: all clean pngs gfx
.SECONDEXPANSION:

TEXTFILES := $(shell find ./ -type f -name '*.asm' | grep -v globals.asm)
TEXTQUEUE :=

OBJS := pokecrystal.o

PNGS   := $(shell find gfx/ -type f -name '*.png')
LZS    := $(shell find gfx/ -type f -name '*.lz')
_2BPPS := $(shell find gfx/ -type f -name '*.2bpp')
_1BPPS := $(shell find gfx/ -type f -name '*.1bpp')

# generate a list of dependencies for each object file
$(shell \
	$(foreach obj, $(OBJS), \
		$(eval OBJ_$(obj:.o=) := \
		$(shell $(PYTHON) scan_includes.py $(obj:.o=.asm) | sed s/globals.asm//g)) \
	) \
)

all: baserom.gbc globals.asm pokecrystal.gbc
	cmp baserom.gbc pokecrystal.gbc
clean:
	rm -f pokecrystal.o pokecrystal.gbc
	rm -f globals.asm globals.tx
	@echo 'Removing preprocessed .tx files...'
	@rm -f $(TEXTFILES:.asm=.tx)

baserom.gbc:
	@echo "Wait! Need baserom.gbc first. Check README and INSTALL for details." && false

.asm.tx:
	$(eval TEXTQUEUE := $(TEXTQUEUE) $<)
	@rm -f $@

globals.asm: $(TEXTFILES:.asm=.tx)
	@echo "Creating globals.asm..."
	@touch globals.asm
	@echo "Preprocessing .asm to .tx..."
	@$(PYTHON) prequeue.py $(TEXTQUEUE) globals.asm

$(OBJS): $$(patsubst %.o,%.tx,$$@) $$(patsubst %.asm,%.tx,$$(OBJ_$$(patsubst %.o,%,$$@)))
	rgbasm -o $@ $(@:.o=.tx)

pokecrystal.gbc: $(OBJS)
	rgblink -n pokecrystal.sym -m pokecrystal.map -o pokecrystal.gbc $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@

pngs:
	$(PYTHON) extras/pokemontools/gfx.py mass-decompress
	$(PYTHON) extras/pokemontools/gfx.py dump-pngs

gfx: $(LZS) $(_2BPPS) $(_1BPPS)
	@:

gfx/pics/%/front.lz: gfx/pics/%/tiles.2bpp gfx/pics/%/front.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz --front $^
gfx/pics/%/tiles.2bpp: gfx/pics/%/tiles.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-2bpp $<
gfx/pics/%/back.lz: gfx/pics/%/back.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz --vert $<
gfx/trainers/%.lz: gfx/trainers/%.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz --vert $<
.png.lz:
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz $<
.png.2bpp:
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz $<
.png.1bpp:
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz $<
%.2bpp:
	@:
%.1bpp:
	@:
