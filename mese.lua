
local standard_to_power = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:mese_pwr")
end

local power_to_standard = function (itemstack, placer, pointed_thing)
	return ItemStack("knives:mese")
end

local standard_descript = "Mese Knife\nDamage: 17\nRight Click for Power Mode"

if knives.settings.allow_power_mode == false then
	standard_descript = "Mese Knife\nDamage: 17\nPower Mode is disabled"
end

minetest.register_tool("knives:mese", {
	short_description = "Mese Knife",
    description = "Mese Knife\nDamage: 17\nRight Click for Power Mode",
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
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})

minetest.register_tool("knives:mese_pwr", {
	short_description = "Powered Mese Knife",
    description = "Powered Mese Knife\nDamage: 34\nRight Click for Standard Mode",
	inventory_image = "knives_mese_pwr.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
            snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=1, maxlevel=3},
		},
		damage_groups = {fleshy=34},
		punch_attack_uses = 1,
	},
	groups = {sword = 1},
	on_place = knives.toggle_power_mode,
	on_secondary_use = knives.toggle_power_mode
})
