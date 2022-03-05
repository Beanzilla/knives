
knives.settings = {}
local set = knives.settings

set.allow_crafting = minetest.settings:get_bool("knives.allow_crafting")
if set.allow_crafting == nil then
    set.allow_crafting = true
    minetest.settings:set_bool("knives.allow_crafting", set.allow_crafting)
end

set.durability = minetest.settings:get_bool("knives.durability")
if set.durability == nil then
    set.durability = true
    minetest.settings:set_bool("knives.durability", set.durability)
end
