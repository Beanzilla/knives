
local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:steel_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:steel")
end

local standard_descript = "Steel Knife\nDamage: 10\nRight Click for Power Mode"
local powered_descript = "Powered Steel Knife\nDamage: 20\nRight Click for Standard Mode"

local powered_uses = 0

if knives.settings.power_mode_is_single == true then
	powered_uses = 1
end

if knives.settings.allow_power_mode == false then
	standard_descript = "Steel Knife\nDamage: 10\nPower Mode is disabled"
	if powered_uses == 0 then
		powered_descript = "Powered Steel Knife\nDamage: 20\nUnable to switch (Power Mode is disabled)\nUnlimited Uses"
	else
		powered_descript = "Powered Steel Knife\nDamage: 20\nUnable to switch (Power Mode is disabled)\nSingle Use"
	end
else
	if powered_uses == 0 then
		powered_descript = "Powered Steel Knife\nDamage: 20\nRight Click for Standard Mode\nUnlimited Uses"
	else
		powered_descript = "Powered Steel Knife\nDamage: 20\nRight Click for Standard Mode\nSingle Use"
	end
end

minetest.register_tool("knives:steel", {
	short_description = "Steel Knife",
    description = standard_descript,
	inventory_image = "knives_steel.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=0, maxlevel=2},
		},
		damage_groups = {fleshy=10},
		punch_attack_uses = 0,
	},
	groups = {sword = 1, weapon=1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode,
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 6, level = 4, uses = 0 },
		swordy_cobweb = { speed = 6, level = 4, uses = 0 }
	},
})

minetest.register_tool("knives:steel_pwr", {
	short_description = "Powered Steel Knife",
    description = powered_descript,
	inventory_image = "knives_steel_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=powered_uses, maxlevel=2},
		},
		damage_groups = {fleshy=20},
		punch_attack_uses = powered_uses,
	},
	groups = {sword = 1, weapon=1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode,
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 6, level = 4, uses = 0 },
		swordy_cobweb = { speed = 6, level = 4, uses = 0 }
	},
})
