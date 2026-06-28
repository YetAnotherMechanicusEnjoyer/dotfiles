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

hl.bind(
	"SUPER+Return",
	hl.dsp.exec_cmd(
		'~/.config/hypr/hyprland/scripts/launch_first_available.sh "${TERMINAL}" "ghostty" "kitty -1" "foot" "alacritty" "konsole" '
	),
	{ description = "Terminal" }
)
