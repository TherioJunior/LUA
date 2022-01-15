---GameSense menu path
local menu = {
    "VISUALS",
    "Effects"
}

local tab, container = menu[1], menu[2]


---Additional table setup
local vars = {
    Event = ""
}

local effectModes = {
    "On Kill",
    "On Hurt"
}

---GameSense menu items
function label()
    return ui.new_label(tab, container, "---------[ Health boost effect ]---------")
end


label()

local items = {
    Enable = ui.new_checkbox(tab, container, "Health boost effect"),
    Event = ui.new_combobox(tab, container, "Mode", effectModes),
    Duration = ui.new_slider(tab, container, "Duration", 3, 20, 5, true, "s", 0.1)
}

label()


ui.set_callback(items.Event, function()
    ---this whole function is a quite heavy ghetto fix

    if(ui.get(items.Event) == effectModes[1]) then
        ---case: On Kill
        ui.set(items.Enable, false)
        vars.Event = "player_death"
        ui.set(items.Enable, true)
    elseif(ui.get(items.Event) == effectModes[2]) then
        ---case: On Hurt
        ui.set(items.Enable, false)
        vars.Event = "player_hurt"
        ui.set(items.Enable, true)
    end
end)


function onEvent(event)
    ---function disclaimer:
    ---both player_death and player_hurt contain ".attacker" which returns a userid
    ---because of that above we do not have to setup the event data caching part per event

    ---checking if the user is using the script features
    if(ui.get(items.Enable) ~= true) then
        return false;
    end

    ---event data caching
    local attacker = client.userid_to_entindex(event.attacker)
    local me = entity.get_local_player()

    ---variable setup
    local duration = globals.curtime() + (ui.get(items.Duration) * 0.1)

    ---actual health boost effect
    if(attacker == me) then
        entity.set_prop(me, "m_flHealthShotBoostExpirationTime", duration)
    end
end


ui.set_callback(items.Enable, function()
    local updateCallback = ui.get(items.Enable) and client.set_event_callback or client.unset_event_callback

    updateCallback(vars.Event, onEvent)
end)
