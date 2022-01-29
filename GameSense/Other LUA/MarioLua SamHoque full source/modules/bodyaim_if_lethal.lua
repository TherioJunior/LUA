local a, b, c, d, e, f, g, h, i, j, require, k, pairs, l, m, n, o = client.eye_position, client.register_esp_flag, client.trace_bullet, entity.get_local_player, entity.get_player_weapon, entity.get_players, entity.get_prop, entity.hitbox_position, plist.get, plist.set, require, ui.new_checkbox, pairs, ui.get, ui.set_callback, client.set_event_callback, client.unset_event_callback;
local p = require('vector')
local q = { enabled = false }
local r = { 3, 4, 5, 6 }
function extrapolate_position(s, t, u, v, w)
    local x, y, z = g(w, "m_vecVelocity")
    for A = 0, v do
        s = s + x * globals.tickinterval()
        t = t + y * globals.tickinterval()
        u = u + z * globals.tickinterval()
    end ;
    return s, t, u
end;
local function B(C, D)
    local E = 0;
    local F, G, H = a()
    local I, J, K;
    F, G, H = extrapolate_position(F, G, H, 20, D)
    I, J, K = F, G, H;
    for L, M in pairs(r) do
        local N = p(h(C, M))
        local O, P = c(D, I, J, K, N.x, N.y, N.z, true)
        if P > E then
            E = P
        end
    end ;
    return E
end;
function q.on_run_command()
    if not q.enabled then
        return
    end ;
    local Q = d()
    local R = e(Q)
    local S = f()
    if R == nil then
        return
    end ;
    for A = 1, #S do
        local w = S[A]
        local T = g(w, "m_iHealth")
        local U = B(w, Q) >= T;
        if T <= 0 then
            return
        end ;
        if U then
            j(w, "Override prefer body aim", "Force")
        else
            j(w, "Override prefer body aim", "-")
        end
    end
end;
return q