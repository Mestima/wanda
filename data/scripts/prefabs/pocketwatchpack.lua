local assets = {
	Asset("ANIM", "anim/pocketwatchpack.zip"),
	Asset("ATLAS", "images/inventoryimages/pocketwatchpack.xml") 
}

local prefabs = {}

local function onopen(inst)
end

local function onclose(inst)
	local owner = inst and inst.components and inst.components.inventoryitem and inst.components.inventoryitem.owner or nil
	if owner ~= nil then
		local container = owner and owner.components and owner.components.inventory and owner.components.inventory:GetOverflowContainer() or nil
		if container ~= nil then
			container:Open(owner)
		end
	end
end

local function ondropped(inst)
	if inst.components.container ~= nil then
		inst.components.container:Close()
	end
end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("pocketwatchpack")
	inst.AnimState:SetBuild("pocketwatchpack")
	inst.AnimState:PlayAnimation("idle")

	MakeInventoryFloatable(inst)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "pocketwatchpack"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/pocketwatchpack.xml"
	inst.components.inventoryitem.canonlygoinpocket = true -- can't store a pocket watch bag into a backpack etc
	inst.components.inventoryitem.keepondeath = true
	inst.components.inventoryitem.keepondrown = true
	inst.components.inventoryitem:SetOnDroppedFn(ondropped)

	inst:AddComponent("container")
	inst.components.container:WidgetSetup("pocketwatchpack")
	--inst.components.container.onopenfn = onopen
	inst.components.container.onclosefn = onclose
	
	MakeHauntableLaunchAndDropFirstItem(inst)

	return inst
end

return Prefab("pocketwatchpack", fn, assets, prefabs)