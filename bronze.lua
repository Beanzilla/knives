
local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:bronze_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:bronze")
end

local standard_descript = "Bronze Knife\nDamage: 15\nRight Click for Power Mode"
local powered_descript = "Powered Bronze Knife\nDamage: 30\nRight Click for Standard Mode"

local powered_uses = 0

if knives.settings.power_mode_is_single == true then
	powered_uses = 1
end

if knives.settings.allow_power_mode == false then
	standard_descript = "Bronze Knife\nDamage: 15\nPower Mode is disabled"
	if powered_uses == 0 then
		powered_descript = "Powered Bronze Knife\nDamage: 30\nUnable to switch (Power Mode is disabled)\nUnlimited Uses"
	else
		powered_descript = "Powered Bronze Knife\nDamage: 30\nUnable to switch (Power Mode is disabled)\nSingle Use"
	end
else
	if powered_uses == 0 then
		powered_descript = "Powered Bronze Knife\nDamage: 30\nRight Click for Standard Mode\nUnlimited Uses"
	else
		powered_descript = "Powered Bronze Knife\nDamage: 30\nRight Click for Standard Mode\nSingle Use"
	end
end

minetest.register_tool("knives:bronze", {
	short_description = "Bronze Knife",
    description = standard_descript,
	inventory_image = "knives_bronze.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=0, maxlevel=2},
		},
		damage_groups = {fleshy=15},
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

minetest.register_tool("knives:bronze_pwr", {
	short_description = "Powered Bronze Knife",
    description = powered_descript,
	inventory_image = "knives_bronze_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=powered_uses, maxlevel=2},
		},
		damage_groups = {fleshy=30},
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

