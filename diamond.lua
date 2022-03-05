
local uses = 35

if knives.settings.durability == false then
    uses = 0
end

minetest.register_tool("knives:diamond", {
	short_description = "Diamond Knife",
    description = "Diamond Knife\nDamage: 20",
	inventory_image = "knives_diamond.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=uses, maxlevel=3},
		},
		damage_groups = {fleshy=20},
	},
	groups = {sword = 1}
})
