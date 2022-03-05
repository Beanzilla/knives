
local uses = 35

if knives.settings.durability == false then
    uses = 0
end

minetest.register_tool("knives:bronze", {
	description = "Bronze Knife",
	inventory_image = "knives_bronze.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=uses, maxlevel=2},
		},
		damage_groups = {fleshy=15},
	},
	groups = {sword = 1}
})
