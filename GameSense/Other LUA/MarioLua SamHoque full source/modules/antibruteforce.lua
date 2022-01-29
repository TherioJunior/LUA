local a, b = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local c, d = ui.reference("AA", "Anti-aimbot angles", "Body Yaw")
local e = false;
local f = math.huge;
local g = { enable_anti_bruteforce = false, anti_bruteforce_timeout = 0, default_yaw_offset = 0, max_yaw_delta = 0, yaw_step = 0, default_body_yaw_offset = 0, max_body_yaw_delta = 0, body_yaw_step = 0, vector = nil, log = nil }
local function h(i, j)
    local k = 10 ^ (j or 0)
    return math.floor(i * k + 0.5) / k
end;
local function l(m, n)
    return math.sqrt((m.x - n.x) ^ 2 + (m.y - n.y) ^ 2)
end;
local function o(p)
    while p > 180 do
        p = p - 360
    end ;
    while p < -180 do
        p = p + 360
    end ;
    return p
end;
local function q(r, s)
    local t, u = r.x - s.x, r.y - s.y;
    return math.sqrt(t * t + u * u)
end;
function g.on_bullet_impact(v)
    local w = entity.get_local_player()
    local x = client.userid_to_entindex(v.userid)
    if x ~= w and entity.is_enemy(x) and entity.is_alive(w) then
        local y = g.vector(entity.hitbox_position(x, 0))
        local z = g.vector(v.x, v.y, v.z)
        local A = g.vector(client.eye_position())
        local B = A:closest_ray_point(y, z)
        local C = q(B, A)
        if C <= 250 then
            local D = o(A:angle_to(B)[2])
            local E = h(g.max_yaw_delta / g.yaw_step, 0.1) * client.random_int(1, g.yaw_step) * (client.random_int(0, 1) * 2 - 1)
            local F = o(g.default_yaw_offset + E)
            local G = h(g.max_body_yaw_delta / g.body_yaw_step, 0.1) * client.random_int(1, g.body_yaw_step) * (client.random_int(0, 1) * 2 - 1)
            local H = o(g.default_body_yaw_offset + G)
            ui.set(a, "180")
            ui.set(b, F)
            ui.set(c, "Static")
            ui.set(d, H)
            f = globals.curtime()
            e = true
        end
    end
end;
function g.on_run_command()
    if globals.curtime() - f > g.anti_bruteforce_timeout and e then
        ui.set(a, "180")
        ui.set(b, g.default_yaw_offset)
        ui.set(c, "Static")
        ui.set(d, g.default_body_yaw_offset)
        e = false
    end
end;
return g