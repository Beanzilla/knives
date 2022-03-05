
local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:diamond_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:diamond")
end

minetest.register_tool("knives:diamond", {
	short_description = "Diamond Knife",
    description = "Diamond Knife\nDamage: 20\nRight Click for Power Mode",
	inventory_image = "knives_diamond.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=20},
	},
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})

minetest.register_tool("knives:diamond_pwr", {
	short_description = "Powered Diamond Knife",
    description = "Powered Diamond Knife\nDamage: 40\nRight Click for Standard Mode",
	inventory_image = "knives_diamond_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=40},
	},
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})
