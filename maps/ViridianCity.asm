ViridianCity_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

GrampsScript_0x1a9a4c:
	faceplayer
	loadfont
	writetext UnknownText_0x1a9aa5
	yesorno
	iffalse UnknownScript_0x1a9a5b
	writetext UnknownText_0x1a9b6f
	closetext
	loadmovesprites
	end

UnknownScript_0x1a9a5b:
	writetext UnknownText_0x1a9bb7
	closetext
	loadmovesprites
	end

GrampsScript_0x1a9a61:
	faceplayer
	loadfont
	checkevent $0775
	iftrue UnknownScript_0x1a9a6f
	writetext UnknownText_0x1a9c11
	closetext
	loadmovesprites
	end

UnknownScript_0x1a9a6f:
	writetext UnknownText_0x1a9c7e
	closetext
	loadmovesprites
	end

FisherScript_0x1a9a75:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue UnknownScript_0x1a9a8a
	writetext UnknownText_0x1a9cc4
	keeptextopen
	verbosegiveitem TM_DREAM_EATER, 1
	iffalse UnknownScript_0x1a9a8e
	setevent EVENT_GOT_TM42_DREAM_EATER
UnknownScript_0x1a9a8a:
	writetext UnknownText_0x1a9d86
	closetext
UnknownScript_0x1a9a8e:
	loadmovesprites
	end

YoungsterScript_0x1a9a90:
	jumptextfaceplayer UnknownText_0x1a9daa

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokeCenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

UnknownText_0x1a9aa5:
	text "Hey, kid! I just"
	line "had a double shot"

	para "of espresso, and"
	line "I am wired!"

	para "I need to talk to"
	line "someone, so you'll"
	cont "have to do!"

	para "I might not look"
	line "like much now, but"

	para "I was an expert at"
	line "catching #MON."

	para "Do you believe me?"
	done

UnknownText_0x1a9b6f:
	text "Good, good. Yes, I"
	line "was something out"

	para "of the ordinary,"
	line "let me tell you!"
	done

UnknownText_0x1a9bb7:
	text "What? You little"
	line "whelp!"

	para "If I were just a"
	line "bit younger, I'd"

	para "show you a thing"
	line "or two. Humph!"
	done

UnknownText_0x1a9c11:
	text "This GYM didn't"
	line "have a LEADER"
	cont "until recently."

	para "A young man from"
	line "PALLET became the"

	para "LEADER, but he's"
	line "often away."
	done

UnknownText_0x1a9c7e:
	text "Are you going to"
	line "battle the LEADER?"

	para "Good luck to you."
	line "You'll need it."
	done

UnknownText_0x1a9cc4:
	text "Yawn!"

	para "I must have dozed"
	line "off in the sun."

	para "…I had this dream"
	line "about a DROWZEE"

	para "eating my dream."
	line "Weird, huh?"

	para "Huh?"
	line "What's this?"

	para "Where did this TM"
	line "come from?"

	para "This is spooky!"
	line "Here, you can have"
	cont "this TM."
	done

UnknownText_0x1a9d86:
	text "TM42 contains"
	line "DREAM EATER…"

	para "…Zzzzz…"
	done

UnknownText_0x1a9daa:
	text "I heard that there"
	line "are many items on"

	para "the ground in"
	line "VIRIDIAN FOREST."
	done

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "The Eternally"
	line "Green Paradise"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	cont "LEADER: …"

	para "The rest of the"
	line "text is illegible…"
	done

ViridianCityWelcomeSignText:
	text "WELCOME TO"
	line "VIRIDIAN CITY,"

	para "THE GATEWAY TO"
	line "INDIGO PLATEAU"
	done

TrainerHouseSignText:
	text "TRAINER HOUSE"

	para "The Club for Top"
	line "Trainer Battles"
	done

ViridianCity_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $7, $20, 1, GROUP_VIRIDIAN_GYM, MAP_VIRIDIAN_GYM
	warp_def $9, $15, 1, GROUP_VIRIDIAN_NICKNAME_SPEECH_HOUSE, MAP_VIRIDIAN_NICKNAME_SPEECH_HOUSE
	warp_def $f, $17, 1, GROUP_TRAINER_HOUSE_1F, MAP_TRAINER_HOUSE_1F
	warp_def $13, $1d, 2, GROUP_VIRIDIAN_MART, MAP_VIRIDIAN_MART
	warp_def $19, $17, 1, GROUP_VIRIDIAN_POKECENTER_1F, MAP_VIRIDIAN_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 17, 17, $0, ViridianCitySign
	signpost 7, 27, $0, ViridianGymSign
	signpost 1, 19, $0, ViridianCityWelcomeSign
	signpost 15, 21, $0, TrainerHouseSign
	signpost 25, 24, $0, ViridianCityPokeCenterSign
	signpost 19, 30, $0, ViridianCityMartSign

	; people-events
	db 4
	person_event SPRITE_GRAMPS, 9, 22, $2, $22, 255, 255, $0, 0, GrampsScript_0x1a9a4c, $ffff
	person_event SPRITE_GRAMPS, 12, 34, $6, $0, 255, 255, $90, 0, GrampsScript_0x1a9a61, $ffff
	person_event SPRITE_FISHER, 27, 10, $6, $0, 255, 255, $80, 0, FisherScript_0x1a9a75, $ffff
	person_event SPRITE_YOUNGSTER, 25, 21, $2, $33, 255, 255, $a0, 0, YoungsterScript_0x1a9a90, $ffff
