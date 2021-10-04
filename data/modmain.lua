GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})
local G = GLOBAL

local agelesskey = GetModConfigData("ageless_key")
local backstepkey = GetModConfigData("backstep_key")
local backtrekkey = GetModConfigData("backtrek_key")
local keybinds = GetModConfigData("key_binds")

local function IsInGameplay()
	return G.ThePlayer ~= nil and G.TheFrontEnd:GetActiveScreen().name == "HUD"
end

local function GetWatch(watchType)
	if keybinds ~= true then return end
	local items = G.ThePlayer.replica.inventory:GetItems()
	local backpack = G.ThePlayer.replica.inventory:GetEquippedItem(G.EQUIPSLOTS.BODY)
	local watchbag = nil
	for k, v in pairs(items) do
		if v.prefab == "pocketwatchpack" then
			watchbag = v
		end
	end
	local watchbagitems = watchbag and watchbag.replica.container and watchbag.replica.container:GetItems() or nil
	local packitems = backpack and backpack.replica.container and backpack.replica.container:GetItems() or nil
	local watch = nil
	for k, v in pairs(items) do
		if v.prefab == watchType and v:HasTag("pocketwatch_inactive") then
			watch = v
			break
		end
	end
	if watch ~= nil or (packitems == nil and watchbagitems == nil) then return watch end
	if (packitems ~= nil) then
		for k, v in pairs(packitems) do
			if v.prefab == watchType and v:HasTag("pocketwatch_inactive") then
				watch = v
				break
			end
		end
	end
	if watch ~= nil or watchbagitems == nil then return watch end
	for k, v in pairs(watchbagitems) do
		if v.prefab == watchType and v:HasTag("pocketwatch_inactive") then
			watch = v
			break
		end
	end
	return watch
end

if agelesskey ~= "None" then
	if keybinds == true then
		local keybind = G["KEY_"..agelesskey]
		G.TheInput:AddKeyDownHandler(keybind, function()
			if not IsInGameplay() then return end
			local pocketwatch = GetWatch("pocketwatch_heal")
			if pocketwatch == nil or not G.ThePlayer:HasTag("pocketwatchcaster") then return end
			act = G.ACTIONS.CAST_POCKETWATCH
			local buffact = G.BufferedAction(G.ThePlayer, target, act, pocketwatch)
			if not G.TheWorld.ismastersim then
				local function cb()
					G.SendRPCToServer(G.RPC.ControllerUseItemOnSelfFromInvTile, act.code, pocketwatch, target)
				end
				if G.ThePlayer.components.locomotor then
					buffact.preview_cb = cb
				else
					cb()
				end
			end
			G.ThePlayer.components.playercontroller:DoAction(buffact)
		end)
	end
end

if backstepkey ~= "None" then
	if keybinds == true then
		local keybind2 = G["KEY_"..backstepkey]
		G.TheInput:AddKeyDownHandler(keybind2, function()
			if not IsInGameplay() then return end
			local pocketwatch = GetWatch("pocketwatch_warp")
			if pocketwatch == nil or not G.ThePlayer:HasTag("pocketwatchcaster") then return end
			act = G.ACTIONS.CAST_POCKETWATCH
			local buffact = G.BufferedAction(G.ThePlayer, target, act, pocketwatch)
			if not G.TheWorld.ismastersim then
				local function cb()
					G.SendRPCToServer(G.RPC.ControllerUseItemOnSelfFromInvTile, act.code, pocketwatch, target)
				end
				if G.ThePlayer.components.locomotor then
					buffact.preview_cb = cb
				else
					cb()
				end
			end
			G.ThePlayer.components.playercontroller:DoAction(buffact)
		end)
	end
end

if backtrekkey ~= "None" then
	if keybinds == true then
		local keybind3 = G["KEY_"..backtrekkey]
		G.TheInput:AddKeyDownHandler(keybind3, function()
			if not IsInGameplay() then return end
			local pocketwatch = GetWatch("pocketwatch_recall")
			if pocketwatch == nil or not G.ThePlayer:HasTag("pocketwatchcaster") then return end
			act = G.ACTIONS.CAST_POCKETWATCH
			local buffact = G.BufferedAction(G.ThePlayer, target, act, pocketwatch)
			if not G.TheWorld.ismastersim then
				local function cb()
					G.SendRPCToServer(G.RPC.ControllerUseItemOnSelfFromInvTile, act.code, pocketwatch, target)
				end
				if G.ThePlayer.components.locomotor then
					buffact.preview_cb = cb
				else
					cb()
				end
			end
			G.ThePlayer.components.playercontroller:DoAction(buffact)
		end)
	end
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
	},
	pt = { -- thx to Gioga ( https://steamcommunity.com/profiles/76561198240723100 )
		name = "Bolsa dos relógios",
		desc = "Uma bolsa para seus relógios!",
		insp = "Ele contém o poder das sombras..."
	}
}

local language = GetModConfigData("lang")

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
