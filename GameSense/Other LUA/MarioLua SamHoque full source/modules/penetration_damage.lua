local r, g, b = ui.get(ui.reference('MISC', 'Settings', 'Menu color'))
local data = {
    enabled = false,
    color = { r = r, g = g, b = b, a = 200 },
    x = -15, --   40 -40
    y = -15, --   40 -40
    xPos = 1,
    yPos = 1,
}

local wall_dmg = 0
local ent_exists = false

function data.on_run_command()
    if entity.get_local_player() == nil then
        return
    end
    local weap_classname = entity.get_classname(entity.get_player_weapon(entity.get_local_player()))

    if weap_classname == "CKnife" or weap_classname == "CSmokeGrenade" or weap_classname == "CFlashbang" or weap_classname == "CHEGrenade" or weap_classname == "CDecoyGrenade" or weap_classname == "CIncendiaryGrenade" then
        return
    end

    local screenX, screenY = client.screen_size()
    data.xPos = screenX / 2 + data.x
    data.yPos = screenY / 2 + data.y

    local eyeX, eyeY, eyeZ = client.eye_position()
    local pitch, yaw = client.camera_angles()

    local sin_pitch = math.sin(math.rad(pitch))
    local cos_pitch = math.cos(math.rad(pitch))
    local sin_yaw = math.sin(math.rad(yaw))
    local cos_yaw = math.cos(math.rad(yaw))

    local dirVector = { cos_pitch * cos_yaw, cos_pitch * sin_yaw, -sin_pitch }

    local fraction, entindex = client.trace_line(entity.get_local_player(), eyeX, eyeY, eyeZ, eyeX + (dirVector[1] * 8192), eyeY + (dirVector[2] * 8192), eyeZ + (dirVector[3] * 8192))
    wall_dmg = 0
    ent_exists = false

    if fraction < 1 then
        local entindex_1, dmg = client.trace_bullet(entity.get_local_player(), eyeX, eyeY, eyeZ, eyeX + (dirVector[1] * (8192 * fraction + 128)), eyeY + (dirVector[2] * (8192 * fraction + 128)), eyeZ + (dirVector[3] * (8192 * fraction + 128)))

        if entindex_1 ~= nil then
            ent_exists = true
        end

        if wall_dmg < dmg then
            wall_dmg = dmg
        end
    end
end

function data.on_render()
    if wall_dmg > 0 then
        if ent_exists then
            renderer.text(data.xPos, data.yPos, data.color.r, data.color.g, data.color.b, data.color.a, "-cbd", 0, wall_dmg)
            --renderer.indicator(data.color.r, data.color.g, data.color.b, data.color.a, "AP: " ,wall_dmg)
        else
            renderer.text(data.xPos, data.yPos, data.color.r, data.color.g, data.color.b, data.color.a, "-cbd", 0, wall_dmg)
            --renderer.indicator(data.color.r, data.color.g, data.color.b, data.color.a, "AP: " ,wall_dmg)
        end
    end
end

return data