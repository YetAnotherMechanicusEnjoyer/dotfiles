hl.bind(
	"CTRL+SUPER+N",
	hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"),
	{ description = "Edit shell config" }
)
hl.bind(
	"CTRL+SUPER+ALT+N",
	hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"),
	{ description = "Edit user keybinds" }
)

hl.bind("SUPER+SHIFT+N", hl.dsp.global("quickshell:cheatsheetToggle"), { description = "Toggle cheatsheet" })

hl.bind("Print", hl.dsp.global("quickshell:regionScreenshot"), { description = "Screen snip" })

hl.bind(
	"SUPER+SHIFT+Space",
	hl.dsp.global("sh ~/.yame/scripts/toggle_kb.sh"),
	{ description = "Toggle Keybooad Layout" }
)

hl.bind("SUPER + escape", hl.dsp.global("quickshell:settingsToggle"), { description = "Toggle settings" })

hl.bind("code:199", hl.dsp.global("discord:discord-toggle-mute"))
hl.bind("code:200", hl.dsp.global("discord:discord-toggle-deafen"))
