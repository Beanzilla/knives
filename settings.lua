
knives.settings = {}
local set = knives.settings

set.allow_crafting = minetest.settings:get_bool("knives.allow_crafting")
if set.allow_crafting == nil then
    set.allow_crafting = true
    minetest.settings:set_bool("knives.allow_crafting", set.allow_crafting)
end

set.allow_power_mode = minetest.settings:get_bool("knives.allow_power_mode")
if set.allow_power_mode == nil then
    set.allow_power_mode = true
    minetest.settings:set_bool("knives.allow_power_mode", set.allow_power_mode)
end

set.power_mode_is_single = minetest.settings:get_bool("knives.power_mode_is_single")
if set.power_mode_is_single == nil then
    set.power_mode_is_single = true
    minetest.settings:set_bool("knives.power_mode_is_single", set.power_mode_is_single)
end
