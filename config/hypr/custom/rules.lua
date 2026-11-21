hl.window_rule({
	name = "Skyrim Console",
	match = {
		class = "steam_app_489830",
	},
	float = true,
	center = true,
	size = { 800, 720 },
	render_unfocused = true,
})

hl.window_rule({
	name = "Skyrim",
	match = {
		title = "Skyrim Special Edition",
	},
	fullscreen = true,
	monitor = "DP-1",
	render_unfocused = true,
})

hl.window_rule({
	match = { class = "com.mitchellh.ghostty" },
	opacity = "0.85 override 0.85 override",
})
