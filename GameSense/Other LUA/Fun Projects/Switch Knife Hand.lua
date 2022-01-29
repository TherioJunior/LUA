---GameSense menu path
local menu = {
    "VISUALS",
    "Effects"
}

local tab, container = menu[1], menu[2]

---GameSense menu items
function label()
    return ui.new_label(tab, container, "---------[ Switch Knife Hand ]---------")
end


label()

local items = {
    Enable = ui.new_checkbox(tab, container, "Switch Knife Hand"),
}

label()


---lua start
function runCommand()
    if(ui.get(items.Enable) ~= true) then
        return false;
    end

    ---function arguments
    local me = entity.get_local_player()
    local myWeapon = entity.get_player_weapon(me)
    local myWeaponClass = entity.get_classname(myWeapon)
    local cachedValue = 0


    if(cvar.cl_righthand:get_int() == cachedValue) then
        return false;
    end

    ---this switching has a really ugly code and can probably be done way better, but it does what it's supposed to
    if(myWeaponClass == "CKnife") then
        if(cvar.cl_righthand:get_int() == 0) then
            if(cvar.cl_righthand:get_int() ~= 1) then
                cvar.cl_righthand:set_int(1)
                cachedValue = 1
            end
        elseif(cvar.cl_righthand:get_int() == 1) then
            if(cvar.cl_righthand:get_int() ~= 0) then
                cvar.cl_righthand:set_int(0)
                cachedValue = 0
            end
        end
    else
        if(cvar.cl_righthand:get_int() == 0) then
            if(cvar.cl_righthand:get_int() ~= 1) then
                cvar.cl_righthand:set_int(1)
                cachedValue = 1
            end
        elseif(cvar.cl_righthand:get_int() == 1) then
            if(cvar.cl_righthand:get_int() ~= 0) then
                cvar.cl_righthand:set_int(0)
                cachedValue = 0
            end
        end
    end
end


ui.set_callback(items.Enable, function()
    local updateCallback = ui.get(items.Enable) and client.set_event_callback or client.unset_event_callback
    updateCallback("run_command", runCommand)
end)
---lua end