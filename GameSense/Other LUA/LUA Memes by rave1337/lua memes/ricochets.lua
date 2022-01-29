local multiselect = ui.new_multiselect("LUA", "B", "Yeehaw richochets", { "Enemy miss", "Local player miss" })
local slider = ui.new_slider("LUA", "B", "Yeehaw ricochets volume", 0, 100, 100, true, "%")

local function play_sound()
    client.exec(string.format("playvol shot%i.mp3 %f", client.random_int(1, 15), ui.get(slider)/100))
end

local function GetClosestPoint(A, B, P)
    local a_to_p = { P[1] - A[1], P[2] - A[2] }
    local a_to_b = { B[1] - A[1], B[2] - A[2] }

    local atb2 = a_to_b[1]^2 + a_to_b[2]^2

    local atp_dot_atb = a_to_p[1]*a_to_b[1] + a_to_p[2]*a_to_b[2]
    local t = atp_dot_atb / atb2
    
    return { A[1] + a_to_b[1]*t, A[2] + a_to_b[2]*t }
end

local function on_bullet_impact(c)
    if entity.is_alive(entity.get_local_player()) then
        local ent = client.userid_to_entindex(c.userid)
        if not entity.is_dormant(ent) and entity.is_enemy(ent) then
            local ent_shoot = { entity.get_prop(ent, "m_vecOrigin") }
            ent_shoot[3] = ent_shoot[3] + entity.get_prop(ent, "m_vecViewOffset[2]")
            local player_head = { entity.hitbox_position(entity.get_local_player(), 0) }
            local closest = GetClosestPoint(ent_shoot, { c.x, c.y, c.z }, player_head)
            local delta = { player_head[1]-closest[1], player_head[2]-closest[2] }
            local delta_2d = math.sqrt(delta[1]^2+delta[2]^2)
        
            if math.abs(delta_2d) < 32 then
                play_sound()
            end
        end
    end
end

ui.set_callback(multiselect, function(c)
    local enemy_miss = false
    local local_player_miss = false
    for _, v in pairs(ui.get(c)) do
        enemy_miss = (v == "Enemy miss") or enemy_miss
        local_player_miss = (v == "Local player miss") or local_player_miss
    end
    
    if enemy_miss then
        client.set_event_callback("bullet_impact", on_bullet_impact)
    else
        client.unset_event_callback("bullet_impact", on_bullet_impact)
    end
    
    if local_player_miss then
        client.set_event_callback("aim_miss", play_sound)
    else
        client.unset_event_callback("aim_miss", play_sound)
    end
end)