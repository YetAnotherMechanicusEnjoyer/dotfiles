hl.monitor({
	output = "DP-1",
	mode = "2560x1440@164.80Hz",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@99.67Hz",
	position = "2560x360",
	scale = 1,
})

hl.config({
	input = {
		kb_layout = "fr, us",

		touchpad = {
			disable_while_typing = false,
		},
	},

	misc = {
		vrr = 0,
	},

	decoration = {
		blur = {
			enabled = false,
		},
	},

	cursor = {
		no_hardware_cursors = true,
	},
})
