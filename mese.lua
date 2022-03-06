
local knife_name = "Mese"
local knife_item = "mese"

if minetest.get_modpath("mcl_core") then
	knife_name = "Gold"
	knife_item = "gold"
	knives.log("MCL Detected, using gold rather than mese.")
end

local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:"..knife_item.."_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:"..knife_item)
end

local standard_descript = knife_name.." Knife\nDamage: 17\nRight Click for Power Mode"
local powered_descript = "Powered "..knife_name.." Knife\nDamage: 34\nRight Click for Standard Mode"

local powered_uses = 0

if knives.settings.power_mode_is_single == true then
	powered_uses = 1
end
if knives.settings.allow_power_mode == false then
	standard_descript = knife_name.." Knife\nDamage: 17\nPower Mode is disabled"
	if powered_uses == 0 then
		powered_descript = "Powered "..knife_name.." Knife\nDamage: 34\nUnable to switch (Power Mode is disabled)\nUnlimited Uses"
	else
		powered_descript = "Powered "..knife_name.." Knife\nDamage: 34\nUnable to switch (Power Mode is disabled)\nSingle Use"
	end
else
	if powered_uses == 0 then
		powered_descript = "Powered "..knife_name.." Knife\nDamage: 34\nRight Click for Standard Mode\nUnlimited Uses"
	else
		powered_descript = "Powered "..knife_name.." Knife\nDamage: 34\nRight Click for Standard Mode\nSingle Use"
	end
end

minetest.register_tool("knives:"..knife_item, {
	short_description = knife_name.." Knife",
    description = standard_descript,
	inventory_image = "knives_mese.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
            snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=17},
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

minetest.register_tool("knives:"..knife_item.."_pwr", {
	short_description = "Powered "..knife_name.." Knife",
    description = powered_descript,
	inventory_image = "knives_mese_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
            snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=powered_uses, maxlevel=3},
		},
		damage_groups = {fleshy=34},
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
