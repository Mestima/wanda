name = "Reliable Wanda"
description = "A bundle of modifications that makes Wanda more reliable"
author = "Mestima"
version = "1.2.5"
forumthread = ""
api_version = 6
api_version_dst = 10
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
all_clients_require_mod = true
icon_atlas = "images/modicon_pocketwatchpack.xml"
icon = "modicon_pocketwatchpack.tex"
priority = 0
server_filter_tags = {"Reliable Wanda"}

local keys = {
	"None",
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	"LSHIFT","LALT","LCTRL","TAB","BACKSPACE","PERIOD","SLASH","TILDE"
}

configuration_options = {
	{
		name = "lang",
		label = "Language",
		hover = "Choose a language",
		options = {
			{ description = "English", data = "eng" },
			{ description = "Русский", data = "ru" },
			{ description = "中文", data = "chi" },
			{ description = "Português", data = "pt" }
		},
		default = "eng"
	},
	{
		name = "clock_tools",
		label = "Clockmaker's Tools storable",
		hover = "Can store Clockmaker's Tools or not",
		options = {
			{ description = "you can", data = true },
			{ description = "you can't", data = false }
		},
		default = true
	},
	{
		name = "time_pieces",
		label = "Time Pieces storable",
		hover = "Can store Time Pieces or not",
		options = {
			{ description = "you can", data = true },
			{ description = "you can't", data = false }
		},
		default = true
	},
	{
		name = "nightmarefuel",
		label = "Nightmare Fuel storable",
		hover = "Can store Nightmare Fuel or not",
		options = {
			{ description = "you can", data = true },
			{ description = "you can't", data = false }
		},
		default = true
	},
	{
		name = "key_binds",
		label = "Enable Keybinds",
		hover = "Enable Wanda's Keybinds or not",
		options = {
			{ description = "enable", data = true },
			{ description = "disable", data = false }
		},
		default = true
	},
	{
		name = "ageless_key",
		label = "Ageless watch Keybind",
		hover = "Use available Ageless Watch with...",
		options = {},
		default = "X"
	},
	{
		name = "backstep_key",
		label = "Backstep watch Keybind",
		hover = "Use available Backstep Watch with...",
		options = {},
		default = "Z"
	},
	{
		name = "backtrek_key",
		label = "Backtrek watch Keybind",
		hover = "Use available Backtrek Watch with...",
		options = {},
		default = "B"
	},
	{
		name = "unspoil_rate",
		label = "Unspoil rate",
		hover = "Food freshness recovery percentage",
		options = {
			{ description = "none", data = 0.0 },
			{ description = "10% (fair play)", data = 0.1 },
			{ description = "-10% (will spoil)", data = -0.1 },
			{ description = "20%", data = 0.2 },
			{ description = "-20% (will spoil)", data = -0.2 },
			{ description = "30%", data = 0.3 },
			{ description = "-30% (will spoil)", data = -0.3 },
			{ description = "40%", data = 0.4 },
			{ description = "-40% (will spoil)", data = -0.4 },
			{ description = "50%", data = 0.5 },
			{ description = "-50% (will spoil)", data = -0.5 },
			{ description = "60%", data = 0.6 },
			{ description = "-60% (will spoil)", data = -0.6 },
			{ description = "70%", data = 0.7 },
			{ description = "-70% (will spoil)", data = -0.7 },
			{ description = "80%", data = 0.8 },
			{ description = "-80% (will spoil)", data = -0.8 },
			{ description = "90%", data = 0.9 },
			{ description = "-90% (will spoil)", data = -0.9 },
			{ description = "100%", data = 1.0 },
			{ description = "-100% (will spoil)", data = -1.0 }
		},
		default = 0.1
	}
}

local function filltable(tbl)
	for i=1, #keys do
		tbl[i] = {description = keys[i], data = keys[i]}
	end
end

for i=6, 8 do
	filltable(configuration_options[i].options)
end
