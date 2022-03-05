
local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:steel_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:steel")
end

local standard_descript = "Steel Knife\nDamage: 10\nRight Click for Power Mode"

if knives.settings.allow_power_mode == false then
	standard_descript = "Steel Knife\nDamage: 10\nPower Mode is disabled"
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
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})

minetest.register_tool("knives:steel_pwr", {
	short_description = "Powered Steel Knife",
    description = "Powered Steel Knife\nDamage: 20\nRight Click for Standard Mode",
	inventory_image = "knives_steel_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=1, maxlevel=2},
		},
		damage_groups = {fleshy=20},
		punch_attack_uses = 1,
	},
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})
