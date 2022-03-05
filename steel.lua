
local uses = 35

if knives.settings.durability == false then
    uses = 0
end

minetest.register_tool("knives:steel", {
	description = "Steel Knife",
	inventory_image = "knives_steel.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=uses, maxlevel=2},
		},
		damage_groups = {fleshy=10},
	},
	groups = {sword = 1}
})
