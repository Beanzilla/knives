
local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:diamond_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:diamond")
end

local standard_descript = "Diamond Knife\nDamage: 20\nRight Click for Power Mode"
local powered_descript = "Powered Diamond Knife\nDamage: 40\nRight Click for Standard Mode"

local powered_uses = 0

if knives.settings.power_mode_is_single == true then
	powered_uses = 1
end

if knives.settings.allow_power_mode == false then
	standard_descript = "Diamond Knife\nDamage: 20\nPower Mode is disabled"
	if powered_uses == 0 then
		powered_descript = "Powered Diamond Knife\nDamage: 40\nUnable to switch (Power Mode is disabled)\nUnlimited Uses"
	else
		powered_descript = "Powered Diamond Knife\nDamage: 40\nUnable to switch (Power Mode is disabled)\nSingle Use"
	end
else
	if powered_uses == 0 then
		powered_descript = "Powered Diamond Knife\nDamage: 40\nRight Click for Standard Mode\nUnlimited Uses"
	else
		powered_descript = "Powered Diamond Knife\nDamage: 40\nRight Click for Standard Mode\nSingle Use"
	end
end

minetest.register_tool("knives:diamond", {
	short_description = "Diamond Knife",
    description = standard_descript,
	inventory_image = "knives_diamond.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=20},
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

minetest.register_tool("knives:diamond_pwr", {
	short_description = "Powered Diamond Knife",
    description = powered_descript,
	inventory_image = "knives_diamond_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=powered_uses, maxlevel=3},
		},
		damage_groups = {fleshy=40},
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
