
local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:bronze_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:bronze")
end

local standard_descript = "Bronze Knife\nDamage: 15\nRight Click for Power Mode"

if knives.settings.allow_power_mode == false then
	standard_descript = "Bronze Knife\nDamage: 15\nPower Mode is disabled"
end

minetest.register_tool("knives:bronze", {
	short_description = "Bronze Knife",
    description = "Bronze Knife\nDamage: 15\nRight Click for Power Mode",
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
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})

minetest.register_tool("knives:bronze_pwr", {
	short_description = "Powered Bronze Knife",
    description = "Powered Bronze Knife\nDamage: 30\nRight Click for Standard Mode",
	inventory_image = "knives_bronze_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=1, maxlevel=2},
		},
		damage_groups = {fleshy=30},
		punch_attack_uses = 1,
	},
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})

