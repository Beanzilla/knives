
knives = {}

knives.modpath = minetest.get_modpath("knives")
knives.version = "0.1-dev"

knives.log = function(msg)
    minetest.log("action", "[knives] " .. tostring(msg))
end

knives.dofile = function (filename)
    dofile(knives.modpath .. DIR_DELIM .. filename .. ".lua")
end

knives.dofile("settings")

knives.dofile("steel")
knives.dofile("bronze")
knives.dofile("mese")
knives.dofile("diamond")

if knives.settings.allow_crafting == true then
    knives.dofile("craft")
end
