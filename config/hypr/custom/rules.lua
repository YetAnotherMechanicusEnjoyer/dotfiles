hl.window_rule({
	name = "sameboy-float",
	match = {
		class = "sameboy",
	},
	float = true,
	size = { 800, 720 },
})

hl.window_rule({
	name = "miniquad-float",
	match = {
		class = "miniquad-application",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "memeblink",
	match = {
		title = "MemeBlink Overlay",
		class = "memeblink",
	},
	float = true,
	pin = true,
	no_focus = true,
	no_shadow = true,
	no_anim = true,
	no_blur = true,
	border_size = 0,
	no_dim = true,
	opacity = 0.999,
})

hl.window_rule({
	name = "sepsis",
	match = {
		class = "sepsis",
	},
	float = true,
	center = true,
})
