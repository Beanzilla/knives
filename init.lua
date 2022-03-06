
knives = {}

knives.modpath = minetest.get_modpath("knives")
knives.version = "1.1"

knives.log = function(msg)
    minetest.log("action", "[knives] " .. tostring(msg))
end

knives.dofile = function (filename)
    dofile(knives.modpath .. DIR_DELIM .. filename .. ".lua")
end

knives.dofile("settings")

-- A helper function for determining what the itemstack's powered or standard item/modes are.
knives.toggle_power_mode = function (itemstack, placer, pointed_thing)
    local parts = string.split(itemstack:get_name(), "_")
    --knives.log(itemstack:get_name() .. " | " .. tostring(#parts) .. " | " .. minetest.serialize(parts))
    if knives.settings.allow_power_mode then
        if #parts == 2 then
            return ItemStack(parts[1])
        else
            knives.log(placer:get_player_name() .. " entered Power Mode")
            return ItemStack(parts[1].."_pwr")
        end
    else
        if #parts == 2 then
            minetest.chat_send_player(placer:get_player_name(), "[knives] Power Mode is disabled, so I won't return you to Standard Mode.")
        else
            minetest.chat_send_player(placer:get_player_name(), "[knives] Power Mode is disabled, beg to your Server Admin.")
        end
        return nil
    end
end

knives.dofile("steel")
-- Bronze is removed if MCL
if minetest.get_modpath("mcl_core") == nil then
    knives.dofile("bronze")
else
    knives.log("Bronze Knives are disabled in MCL.")
end
knives.dofile("mese") -- Renamed to Gold if MCL
knives.dofile("diamond")

knives.log("Version: "..knives.version)

if knives.settings.allow_crafting == true then
    knives.log("Crafing Allowed")
    knives.dofile("craft")
end
