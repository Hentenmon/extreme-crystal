; rst vectors

SECTION "home/rst.inc@rst0", ROM0[$0000]
	di
	jp Start

SECTION "home/rst.inc@rst8", ROM0[$0008] ; rst FarCall
	jp FarCall_hl

SECTION "home/rst.inc@rst10", ROM0[$0010] ; rst Bankswitch
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "home/rst.inc@rst18", ROM0[$0018]
	rst $38

SECTION "home/rst.inc@rst20", ROM0[$0020]
	rst $38

SECTION "home/rst.inc@rst28", ROM0[$0028] ; rst JumpTable
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp hl

; SECTION "rst30", ROM0
; rst30 is midst rst28

SECTION "home/rst.inc@rst38", ROM0[$0038]
	rst $38