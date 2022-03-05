
local uses = 35

if knives.settings.durability == false then
    uses = 0
end

minetest.register_tool("knives:mese", {
	description = "Mese Knife",
	inventory_image = "knives_mese.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
            snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=uses, maxlevel=3},
		},
		damage_groups = {fleshy=17},
	},
	groups = {sword = 1}
})
