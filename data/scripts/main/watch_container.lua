local containers = require("containers")

local storable = {
	["pocketwatch_dismantler"] = GetModConfigData("clock_tools"),
	["pocketwatch_parts"] = GetModConfigData("time_pieces")
}

local params = {
	pocketwatchpack = {
		widget = {
			slotpos = {},
			animbank = "ui_piggyback_2x6",
			animbuild = "ui_piggyback_2x6",
			pos = Vector3(-5, -50, 0)
		},
		issidewidget = true,
		openlimit = 1,
		type = "pack"
	}
}

for y = 0, 5 do
	table.insert(params.pocketwatchpack.widget.slotpos, Vector3(-162, -75 * y + 170, 0))
	table.insert(params.pocketwatchpack.widget.slotpos, Vector3(-162 + 75, -75 * y + 170, 0))
end


function params.pocketwatchpack.itemtestfn(container, item, slot)
	if item:HasTag("pocketwatch") then return true end
	return storable[item.prefab] == true
end 


for k, v in pairs(params) do
	containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end


local containers_widgetsetup = containers.widgetsetup

function containers.widgetsetup(container, prefab, data)
	local t = data or params[prefab or container.inst.prefab]
	if t ~= nil then
		for k, v in pairs(t) do
			container[k] = v
		end
		container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)    
	else
		return containers_widgetsetup(container, prefab, data)
	end
end
