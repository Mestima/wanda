GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})

local function GetConfig(name, default)
	local opt = GetModConfigData(name)
	if (not opt) then
		opt = default
	end
	if (type(opt) == "table") then
		opt = opt.option_data
	end
	return opt
end

local lang = {
	eng = {
		name = "Watch bag",
		desc = "A bag for your watch!",
		insp = "It contains the power of shadows..."
	},
	ru = {
		name = "Сумка с часами",
		desc = "Сумка для всех Ваших часов!",
		insp = "В ней сила теней..."
	},
	chi = {
		name = "怀表工具袋",
		desc = "收纳时间",
		insp = "蕴含暗影的力量"
	}
}

local language = GetConfig("lang", "eng")

PrefabFiles = { "pocketwatchpack" }
Assets = {
	Asset("ATLAS", "images/inventoryimages/pocketwatchpack.xml")
}

modimport("scripts/main/lnx_container.lua")
AddRecipe("pocketwatchpack",
	{
		Ingredient("pocketwatch_dismantler", 1),
		Ingredient("livinglog", 2),
		Ingredient("nightmarefuel", 2)
	},
	CUSTOM_RECIPETABS.CLOCKMAKER, 
	TECH.NONE,
	nil, nil, nil, nil,
	"clockmaker",
	"images/inventoryimages/pocketwatchpack.xml", 
	"pocketwatchpack.tex"
)

STRINGS.NAMES.POCKETWATCHPACK = lang[language].name
STRINGS.RECIPE_DESC.POCKETWATCHPACK = lang[language].desc
STRINGS.CHARACTERS.GENERIC.DESCRIBE.POCKETWATCHPACK = lang[language].insp
