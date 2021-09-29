name = "Wanda's pocket watch bag (advanced)"
description = "An advanced version of Wanda's pocket watch bag"
author = "非自然对数㏑x & Mestima"
version = "1.0.1"

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

server_filter_tags = {"Wanda's bag"}

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
	}
}
