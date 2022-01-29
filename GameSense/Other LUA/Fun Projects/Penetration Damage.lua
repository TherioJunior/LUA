---GameSense menu path
local menu = {
    "VISUALS",
    "Effects"
}

local tab, container = menu[1], menu[2]

---GameSense menu items
function label()
    return ui.new_label(tab, container, "---------[ Penetration Damage ]---------")
end


label()

local items = {
    Enable = ui.new_checkbox(tab, container, "Penetration Damage"),
    Position = ui.new_checkbox(tab, container, "Position", -20, 20, 0, true, "px", 1)
}

label()


---things we won't store in a callback since they'd drop frames
local screenX, screenY = client.screen_size()


function onPaint()
    if(ui.get(items.Enable) ~= true) then
        return false;
    end

    ---arguments
    local nonWeapons = {
        "CKnife",
        "CSmokeGrenade",
        "CFlashbang",
        "CHEGrenade",
        "CDecoyGrenade",
        "CIncendiaryGrenade"
    }
    local me = entity.get_local_player()
    local myWeapon = entity.get_player_weapon(me)
    local myWeaponClass = entity.get_classname(myWeapon)


    for _, class in pairs(nonWeapons) do
        if(myWeaponClass == class) then
            return false;
        end
    end


    if(me == nil or entity.is_alive(me) == false) then
        return false;
    end


    ---rendering + variables
    ---positioning
    local posX, posY = screenX / 2 + 1, screenY / 2 + 20 - 15 * ui.get(items.Position)
	local eyeX, eyeY, eyeZ = client.eye_position()
	local pitch, yaw = client.camera_angles()


    ---general vars
    ---booleans and ints
    local entExists, wallDmg, multiplier = false, 0, 8192


    ---eye/view angles
    local sinPitch = math.sin(math.rad(pitch))
    local cosPitch = math.cos(math.rad(pitch))
    local sinYaw = math.sin(math.rad(yaw))
    local cosYaw = math.cos(math.rad(yaw))


    ---vector
    local directionVector = {
        cosPitch * cosYaw,
        cosPitch * sinYaw,
        -sinPitch
    }


    ---api calls
    local fraction, _ = client.trace_line(
        me,
        eyeX,
        eyeY,
        eyeZ,
        eyeX + (directionVector[1] + multiplier),
        eyeY + (directionVector[2] + multiplier),
        eyeZ + (directionVector[3] + multiplier)
    )


    if(fraction < 1) then
        local entIndex1, dmg = client.trace_bullet(
            me,
            eyeX,
            eyeY,
            eyeZ,
            eyeX + (directionVector[1] * (multiplier * fraction + 128)),
            eyeY + (directionVector[2] * (multiplier * fraction + 128)),
            eyeZ + (directionVector[3] * (multiplier * fraction + 128))
        )

        if(entIndex1 ~= nil) then
            entExists = true
            _ = _
        end

        if(wallDmg < dmg) then
            wallDmg = dmg
        end
    end


    if(wallDmg > 0) then
        local r, g, b, a = entExists and 0 or 124, entExists and 150 or 195, entExists and 255 or 13, 255

        renderer.text(posX, posY, r, g, b, a, "cb", 0, tostring(wallDmg))
    end
end


ui.set_callback(items.Enable, function()
    local updateCallback = ui.get(items.Enable) and client.set_event_callback or client.unset_event_callback
    updateCallback("paint", onPaint)
end)