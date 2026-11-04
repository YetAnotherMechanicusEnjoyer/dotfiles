hl.window_rule({
	name = "Skyrim Console",
	match = {
		class = "steam_app_489830",
	},
	float = true,
	center = true,
	size = { 800, 720 },
})

hl.window_rule({
	name = "Skyrim",
	match = {
		title = "Skyrim Special Edition",
	},
	fullscreen = true,
	monitor = "DP-1",
})
