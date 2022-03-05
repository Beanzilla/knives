
local items = {
    iron = "default:iron_ingot",
    mese = "default:mese_crystal", -- MCL replaces this with Redstone
    bronze = "default:bronze_ingot", -- MCL replaces this with Gold
    diamond = "default:diamond",
    stick = "group:stick",
    empty = ""
}

if minetest.get_modpath("mcl_core") then
    items.iron = "mcl_core:iron_ingot"
    items.mese = "mesecons:redstone"
    items.bronze = "mcl_core:gold_ingot"
    items.diamond = "mcl_core:diamond"
end

minetest.register_craft({
    output = "knives:steel",
    recipe = {
        {items.empty, items.empty, items.empty},
        {items.empty, items.iron, items.empty},
        {items.stick, items.empty, items.empty}
    }
})

minetest.register_craft({
    output = "knives:bronze",
    recipe = {
        {items.empty, items.empty, items.empty},
        {items.empty, items.bronze, items.empty},
        {items.stick, items.empty, items.empty}
    }
})

minetest.register_craft({
    output = "knives:mese",
    recipe = {
        {items.empty, items.empty, items.empty},
        {items.empty, items.mese, items.empty},
        {items.stick, items.empty, items.empty}
    }
})

minetest.register_craft({
    output = "knives:diamond",
    recipe = {
        {items.empty, items.empty, items.empty},
        {items.empty, items.diamond, items.empty},
        {items.stick, items.empty, items.empty}
    }
})
