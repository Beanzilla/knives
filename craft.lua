
local items = {
    iron = "default:iron_ingot",
    mese = "default:mese_crystal", -- MCL Reuses this and renames the item to gold knife rather than mese (but I reuse the texture)
    bronze = "default:bronze_ingot", -- MCL disables this type
    diamond = "default:diamond",
    stick = "group:stick",
    empty = "",
}

if minetest.get_modpath("mcl_core") then
    items.iron = "mcl_core:iron_ingot"
    items.mese = "mcl_core:gold_ingot"
    items.diamond = "mcl_core:diamond"
end

minetest.register_craft({
    output = "knives:steel",
    recipe = {
        {items.empty, items.iron},
        {items.stick, items.empty}
    }
})

if minetest.get_modpath("mcl_core") == nil then
    minetest.register_craft({
        output = "knives:bronze",
        recipe = {
            {items.empty, items.bronze},
            {items.stick, items.empty}
        }
    })
end

if minetest.get_modpath("mcl_core") then
    minetest.register_craft({
        output = "knives:gold",
        recipe = {
            {items.empty, items.mese},
            {items.stick, items.empty}
        }
    })
else
    minetest.register_craft({
        output = "knives:mese",
        recipe = {
            {items.empty, items.mese},
            {items.stick, items.empty}
        }
    })
end

minetest.register_craft({
    output = "knives:diamond",
    recipe = {
        {items.empty, items.diamond},
        {items.stick, items.empty}
    }
})
