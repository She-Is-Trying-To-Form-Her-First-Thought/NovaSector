/obj/structure/flora/dunegrass
	name = "dunegrass"
	desc = "A tall-growing species of grass, one of the few plants that can actually grow in this environment."
	icon = 'modular_vintage/random_resources/icons/dunegrass.dmi'
	icon_state = "dunegrass-255"
	base_icon_state = "dunegrass"
	layer = ABOVE_MOB_LAYER
	product_types = list()
	harvest_with_hands = TRUE
	harvest_amount_high = 4
	harvest_amount_low = 1
	harvest_verb = "cut"
	can_uproot = FALSE
	delete_on_harvest = TRUE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_HEDGE_FLUFF
	canSmoothWith = SMOOTH_GROUP_HEDGE_FLUFF

/obj/structure/flora/dunegrass/Initialize(mapload)
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/structure/flora/dunegrass/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER
	if(!ismob(AM))
		return
	Shake(1, 1, 1 SECONDS)
