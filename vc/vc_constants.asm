INCLUDE "constants.asm"

; These are all the asm constants needed to make the pokecrystalvc patch.

vc_const: MACRO
	println "{d:\1} \1"
ENDM

; [fight begin]
	vc_const SCREEN_HEIGHT_PX

; [print forbid 2]
; [print forbid 3]
	vc_const MAPGROUP_CIANWOOD
	vc_const MAP_CIANWOOD_PHOTO_STUDIO
; [print forbid 5]
	vc_const NO_INPUT
	vc_const B_BUTTON
	vc_const D_UP
	vc_const D_DOWN

; [FPA 001 Begin]
	vc_const FISSURE
; [FPA 002 Begin]
	vc_const SELFDESTRUCT
; [FPA 003 Begin]
	vc_const THUNDER
; [FPA 004 Begin]
	vc_const FLASH
; [FPA 005 Begin]
	vc_const EXPLOSION
; [FPA 006 Begin]
	vc_const HORN_DRILL
; [FPA 007 Begin]
	vc_const HYPER_BEAM

; [FPA 042801 Begin]
	vc_const PRESENT
	vc_const anim_1gfx_command
