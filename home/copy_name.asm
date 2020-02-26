INCLUDE "charmap.inc"


SECTION "home/copy_name", ROM0

CopyName1::
; Copies the name from de to wStringBuffer2
	ld hl, wStringBuffer2

CopyName2::
; Copies the name from de to hl
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
	ret
