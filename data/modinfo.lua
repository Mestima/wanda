name = "Wanda's pocket watch bag (advanced)"
description = "An advanced version of Wanda's pocket watch bag"
author = "非自然对数㏑x & Mestima"
version = "1.0.0"

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
		},
		default = "eng"
	}
}
