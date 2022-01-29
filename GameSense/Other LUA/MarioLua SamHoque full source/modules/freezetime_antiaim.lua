local a = require('ffi')
local b = a.typeof('void*(__thiscall*)(void*)')
local c = a.typeof('void*(__thiscall*)(void*)')
local d = a.typeof('const void*(__thiscall*)(void*)')
local e = a.typeof('int(__fastcall*)(void*, void*, int)')
local f = {}
local g = a.typeof('void***')
local h = client.create_interface('client_panorama.dll', 'VClientEntityList003') or error('VClientEntityList003 wasnt found', 2)
local i = a.cast(g, h) or error('rawientitylist is nil', 2)
local j = a.cast('void*(__thiscall*)(void*, int)', i[0][0]) or error('get_client_networkable_t is nil', 2)
local k = a.cast('void*(__thiscall*)(void*, int)', i[0][3]) or error('get_client_entity is nil', 2)
local function l(m)
    if m == nil then
        return
    end ;
    local n = a.cast("void***", k(i, m))
    local o = a.cast("char*", n) + 0x3914;
    local p = a.cast("struct c_animstate_freeze_aa_mariolua**", o)[0]
    return p
end;
local function q(r, s, t)
    return { x = r or 0, y = s or 0, z = t or 0 }
end;
function round(u)
    return u >= 0 and math.floor(u + 0.5) or math.ceil(u - 0.5)
end;
local function v(w)
    return globals.tickinterval() * w
end;
local function x(y)
    return 0.5 + y / globals.tickinterval()
end;
local z = { enabled = ui.reference("aa", "anti-aimbot angles", "enabled"), pitch = ui.reference("aa", "anti-aimbot angles", "pitch"), yaw_base = ui.reference("aa", "anti-aimbot angles", "yaw base"), yaw = { ui.reference("aa", "anti-aimbot angles", "yaw") }, jitter = { ui.reference("aa", "anti-aimbot angles", "yaw jitter") }, body_yaw = { ui.reference("aa", "anti-aimbot angles", "body yaw") }, freestanding_body_yaw = ui.reference("aa", "anti-aimbot angles", "freestanding body yaw"), freestanding = { ui.reference("aa", "anti-aimbot angles", "freestanding") }, fake = ui.reference("aa", "anti-aimbot angles", "fake yaw limit"), edge = ui.reference("aa", "anti-aimbot angles", "edge yaw"), onshot_aa = { ui.reference("AA", "Other", "On shot anti-aim") }, slow_motion = { ui.reference("AA", "other", "slow motion") }, fakelag = { amount = ui.reference("AA", "fake lag", "amount"), limit = ui.reference("AA", "fake lag", "limit"), variance = ui.reference("AA", "fake lag", "variance") } }
local function A(B, C, D)
    B = tonumber(B) or 0;
    C = tonumber(C) or 0;
    D = tonumber(D) or 0;
    if B < C then
        B = C
    elseif B > D then
        B = D
    end ;
    return B
end;
local function E(F)
    while F > 180 do
        F = F - 360
    end ;
    while F < -180 do
        F = F + 360
    end ;
    return F
end;
local function G(H, I, J, K)
    local L = I - K;
    local M = H - J;
    local N = math.atan(L / M)
    N = E(N * 180 / math_pi)
    if M >= 0 then
        N = E(N + 180)
    end ;
    return N
end;
local function round(B, O)
    local P = 10 ^ (O or 0)
    return math.floor(B * P + 0.5) / P
end;
local function Q(R)
    return round(R / globals.tickinterval())
end;
local function S(m)
    local T = entity.get_prop(m, "m_flSimulationTime")
    local U = entity.get_prop(entity.get_player_resource(), "m_iPing", m) or 0;
    local V = Q(globals.curtime() - T - U)
    return V
end;
local function W(m)
    local X = entity.get_prop(m, "m_fFlags")
    return bit.band(X, bit.lshift(1, 0)) == 1
end;
local Y = 0;
local Z = false;
local function _(a0)
    local a1 = globals.curtime()
    local a2 = l(entity.get_local_player())
    if not W(entity.get_local_player()) then
        return false
    end ;
    if a2.m_flSpeed2D > 0.1 then
        Y = a1 + 0.22
    end ;
    if Q(Y) - 4 < Q(a1) and Z then
        a0.allow_send_packet = true;
        Z = false
    end ;
    if Y < a1 then
        Y = a1 + 1.1;
        Z = true;
        return true
    end ;
    return false
end;
local function a3(a0)
    if ui.get(z.pitch) == 'Off' then
        return
    end ;
    if ui.get(z.pitch) == 'Down' or ui.get(z.pitch) == 'Default' then
        a0.pitch = 89
    elseif ui.get(z.pitch) == 'Up' then
        a0.pitch = -89
    elseif ui.get(z.pitch) == 'Random' then
        a0.pitch = math.random(-89, 89)
    end
end;
local a4 = 0;
local a5 = 0;
local function a6(a0)
    if ui.get(z.yaw[1]) == 'Off' then
        return
    end ;
    if ui.get(z.yaw[1]) == '180' then
        a0.yaw = a0.yaw + 180 + ui.get(z.yaw[2])
    elseif ui.get(z.yaw[1]) == 'Spin' then
        if ui.get(z.yaw[2]) > 0 then
            a0.yaw = a0.yaw + a4;
            a4 = a4 + ui.get(z.yaw[2])
        elseif ui.get(z.yaw[2]) < 0 then
            a0.yaw = a0.yaw - a5;
            a5 = a5 + math.abs(ui.get(z.yaw[2]))
        end
    end
end;
local a7 = false;
local function a8(a0)
    if ui.get(z.jitter[1]) == 'Off' then
        return
    end ;
    if ui.get(z.jitter[1]) == 'Offset' then
        if a7 then
            a0.yaw = a0.yaw + ui.get(z.jitter[2])
        else
            a0.yaw = a0.yaw - ui.get(z.jitter[2])
        end ;
        a7 = not a7
    elseif ui.get(z.jitter[1]) == 'Center' then
        if ui.get(z.jitter[2]) > 0 then
            a0.yaw = a0.yaw + a4;
            a4 = a4 + ui.get(z.jitter[2])
        elseif ui.get(z.jitter[2]) < 0 then
            a0.yaw = a0.yaw - a5;
            a5 = a5 + math.abs(ui.get(z.jitter[2]))
        end
    elseif ui.get(z.jitter[1]) == 'Random' then
        a0.yaw = math.random(-ui.get(z.jitter[2]), ui.get(z.jitter[2]))
    end
end;
local a9 = false;
local function aa(a0)
    local ab = a0.chokedcommands ~= 0;
    if ui.get(z.body_yaw[1]) == 'Off' or ab then
        return
    end ;
    local ac = false;
    if ui.get(z.body_yaw[1]) == 'Static' then
        a0.allow_send_packet = ac;
        a0.yaw = a0.yaw - ui.get(z.body_yaw[2])
    elseif ui.get(z.body_yaw[1]) == 'Opposite' then
        a0.allow_send_packet = ac;
        a0.yaw = ui.get(z.body_yaw[2])
    elseif ui.get(z.body_yaw[1]) == 'Jitter' then
        a0.allow_send_packet = ac;
        if a9 then
            a0.yaw = a0.yaw - ui.get(z.body_yaw[2])
        else
            a0.yaw = a0.yaw + ui.get(z.body_yaw[2])
        end ;
        a9 = not a9
    end
end;
function f.on_setup_command(a0)
    local ad = { entity.get_prop(entity.get_local_player(), "m_angEyeAngles") }
    local ae = { entity.get_prop(entity.get_local_player(), "m_angAbsRotation") }
    local af = E(ae[2] - ad[2]) > 0 and -1 or 1;
    local ag = entity.get_prop(entity.get_game_rules(), "m_bFreezePeriod")
    entity.set_prop(entity.get_game_rules(), "m_bFreezePeriod", 1)
    local ah = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
    local ai = entity.get_prop(ah, "m_flNextPrimaryAttack")
    local ab = a0.chokedcommands ~= 0;
    if ag == 1 then
        if a0.in_use == 1 or a0.in_attack == 1 and globals.curtime() >= ai or not ui.get(z.enabled) then
            return
        end ;
        if _(a0) then
            a0.allow_send_packet = false;
            a0.yaw = E(ad[2] + 60 * af)
        else
            a0.allow_send_packet = true
        end ;
        a3(a0)
        a6(a0)
        a8(a0)
        aa(a0)
    end
end;
return f