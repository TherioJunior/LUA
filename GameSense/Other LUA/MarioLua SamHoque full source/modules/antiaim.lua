local a = require('ffi')
local b = {}
local c = database.read('mariolua_db_aa_config') or {}
local d = {}
local e = {}
local f = {}
local g = {}
local h = {}
local i = {}
local j = {}
local k = {}
local l = {}
local m = {}
local n = {}
local function o()
end;
local function p()
end;
local q = entity.get_local_player()
function b.set_vars(r)
    f = r.mariolua or f;
    e = r.cache or e;
    m = r.bindings or m;
    l = r.refs or l;
    g = r.cmath or g;
    ctable = r.ctable or ctable;
    h = r.centity or h;
    k = r.cstring or k;
    j = r.crender or j;
    i = r.cangle or i;
    o = r.Angle or o;
    p = r.Vector3 or p;
    n = r.vector or n
end;
local function s()
    local t = entity.get_players(true)
    if #t ~= 0 then
        local u, v, w = client.eye_position()
        local x, y = client.camera_angles()
        e.closest_enemy = nil;
        e.closest_distance = 999999999;
        for z = 1, #t do
            local A = t[z]
            local B, C, D = entity.hitbox_position(A, 0)
            local E = B - u;
            local F = C - v;
            local G = D - w;
            local H = math.atan2(F, E) * 180 / math.pi;
            local I = -(math.atan2(G, math.sqrt(math.pow(E, 2) + math.pow(F, 2))) * 180 / math.pi)
            local J = math.abs(y % 360 - H % 360) % 360;
            local K = math.abs(x - I) % 360;
            if J > 180 then
                J = 360 - J
            end ;
            local L = math.sqrt(math.pow(J, 2) + math.pow(K, 2))
            if e.closest_distance > L then
                e.closest_distance = L;
                e.closest_enemy = A
            end
        end ;
        if e.closest_enemy ~= nil then
            return e.closest_enemy, e.closest_distance
        end
    end ;
    return nil, nil
end;
d = {}
d.settings = {}
function d.Enable(M)
    if not M then
        return ui.get(e.ref.aa.enabled)
    end ;
    if d.settings.enable ~= M then
        d.settings.enable = M;
        ui.set(e.ref.aa.enabled, M)
    end
end;
function d.BodyYaw(M)
    if not M then
        return ui.get(e.ref.aa.body_yaw[1])
    end ;
    if d.settings.body_yaw ~= M then
        d.settings.body_yaw = M;
        ui.set(e.ref.aa.body_yaw[1], M)
    end
end;
function d.BodyYawValue(M)
    if not M then
        return ui.get(e.ref.aa.body_yaw[2])
    end ;
    if d.settings.body_yaw_value ~= M then
        d.settings.body_yaw_value = M;
        ui.set(e.ref.aa.body_yaw[2], M)
    end
end;
function d.YawBase(M)
    if not M then
        return ui.get(e.ref.aa.yaw_base)
    end ;
    if d.settings.yaw_base ~= M then
        d.settings.yaw_base = M;
        ui.set(e.ref.aa.yaw_base, M)
    end
end;
function d.YawJitter(M)
    if not M then
        return ui.get(e.ref.aa.jitter[1])
    end ;
    if d.settings.jitter ~= M then
        d.settings.jitter = M;
        ui.set(e.ref.aa.jitter[1], M)
    end
end;
function d.YawJitterValue(M)
    if not M then
        return ui.get(e.ref.aa.jitter[2])
    end ;
    if d.settings.jitter_value ~= M then
        d.settings.jitter_value = M;
        ui.set(e.ref.aa.jitter[2], M)
    end
end;
function d.FreestandingBodyYaw(M)
    if not M then
        return ui.get(e.ref.aa.freestanding_body_yaw)
    end ;
    if d.settings.freestanding_body_yaw ~= M then
        d.settings.freestanding_body_yaw = M;
        ui.set(e.ref.aa.freestanding_body_yaw, M)
    end
end;
function d.Yaw(M)
    local N, O = ui.reference("AA", "Anti-aimbot angles", "Yaw")
    if not M then
        return ui.get(N)
    end ;
    if d.settings.yaw ~= M then
        d.settings.yaw = M;
        ui.set(N, M)
    end
end;
function d.YawValue(M)
    local O, P = ui.reference("AA", "Anti-aimbot angles", "Yaw")
    if not M then
        return ui.get(P)
    end ;
    if d.settings.yaw_value ~= M then
        d.settings.yaw_value = M;
        ui.set(P, M)
    end
end;
function d.Edge(M)
    if not M then
        return ui.get(e.ref.aa.edge)
    end ;
    if d.settings.edge ~= M then
        d.settings.edge = M;
        ui.set(e.ref.aa.edge, M)
    end
end;
function d.Freestanding(M)
    if not M then
        return ui.get(e.ref.aa.freestanding[1])
    end ;
    if d.settings.freestanding ~= M then
        d.settings.freestanding = M;
        ui.set(e.ref.aa.freestanding[1], M)
    end
end;
function d.FreestandingBind(M)
    if not M then
        return ui.get(e.ref.aa.freestanding[2])
    end ;
    if d.settings.freestandingbinsd ~= M then
        d.settings.freestandingbinsd = M;
        ui.set(e.ref.aa.freestanding[2], M)
    end
end;
function d.Pitch(M)
    if not M then
        return ui.get(e.ref.aa.pitch)
    end ;
    if d.settings.pitch ~= M then
        d.settings.pitch = M;
        ui.set(e.ref.aa.pitch, M)
    end
end;
function d.Fake(M)
    if not M then
        return ui.get(e.ref.aa.fake)
    end ;
    if d.settings.fake ~= M then
        d.settings.fake = M;
        ui.set(e.ref.aa.fake, M)
    end
end;
b.freestanding = {}
b.freestanding.data = { side = 1, last_side = 0, last_hit = 0, hit_side = 0 }
b.fake_yaw = 0;
b.body_yaw_value = 60;
b.pich = 'Off'
b.yaw = 'Off'
b.yaw_value = 0;
b.lowerbody_yaw_target = "Eye Yaw"
b.fakelag_limit = 14;
b.fakelag_limit_backup = false;
function b.Freestanding()
    if not l.antiaim_freestanding:GetItemName() == 'Skeet Freestanding' then
        return
    end ;
    local Q, R = 'left', 'right'
    local q = entity.get_local_player()
    if not q or entity.get_prop(q, "m_lifeState") ~= 0 then
        return
    end ;
    local S = globals.curtime()
    if b.freestanding.data.hit_side ~= 0 and S - b.freestanding.data.last_hit > 5 then
        b.freestanding.data.last_side = 0;
        b.freestanding.data.last_hit = 0;
        b.freestanding.data.hit_side = 0
    end ;
    local T = "Hide real"
    local E, F, G = client.eye_position()
    local O, H = client.camera_angles()
    local U = l.antiaim_state:GetItemName()
    local V = nil;
    local W = math.huge;
    local X = p(entity.get_prop(q, "m_vecOrigin"))
    if U == 'Rage' then
        V, W = s()
    end ;
    local Y = { left = 0, right = 0 }
    local Z;
    for z = H - 90, H + 90, 10 do
        if z ~= H then
            local _ = math.rad(z)
            local a0, a1, a2 = E + 256 * math.cos(_), F + 256 * math.sin(_), G;
            local a3 = client.trace_line(q, E, F, G, a0, a1, a2)
            if a3 == nil then
                return
            end ;
            local a4 = z < H and Q or R;
            Y[a4] = Y[a4] + a3
        end
    end ;
    b.freestanding.data.side = Y.left < Y.right and 1 or 2;
    if b.freestanding.data.side == b.freestanding.data.last_side then
        return
    end ;
    b.freestanding.data.last_side = b.freestanding.data.side;
    if b.freestanding.data.hit_side ~= 0 then
        b.freestanding.data.side = b.freestanding.data.hit_side == 1 and 2 or 1
    end ;
    local a5 = l.antiaim_body:GetValue()
    if V ~= nil and U == 'Rage' then
        X = p(entity.get_origin(q))
        local a6 = p(entity.get_origin(V))
        local a7 = i.CalcRelativeAngle(X.x, X.y, a6.x, a6.y)
        local a8 = T == "Hide real" and (b.freestanding.data.side == 1 and 60 or -60) or (b.freestanding.data.side == 1 and -60 or 60)
        local O, a9 = client.camera_angles()
        local aa = i.NormalizeAsYaw(a7 + a8 * -1 - a9)
        b.yaw_value = aa
    end ;
    b.body_yaw_value = T == "Hide real" and (b.freestanding.data.side == 1 and a5 or -a5) or (b.freestanding.data.side == 1 and -a5 or a5)
end;
function b.SetAntiAim(r)
    d.Enable(r.enabled or d.Enable())
    d.BodyYaw(r.body_yaw or d.BodyYaw())
    d.BodyYawValue(r.body_yaw_value or d.BodyYawValue())
    d.YawBase(r.yaw_base or d.YawBase())
    d.YawJitter(r.jitter or d.YawJitter())
    d.YawJitterValue(r.jitter_value or d.YawJitterValue())
    d.Freestanding(r.fa or d.Freestanding())
    d.FreestandingBodyYaw(r.fa_body_yaw or d.FreestandingBodyYaw())
    d.FreestandingBind(r.fa_bind)
    d.Yaw(r.yaw or d.Yaw())
    d.YawValue(r.yaw_value or d.YawValue())
    d.Edge(r.edge or d.Edge())
    d.Pitch(r.pitch or d.Pitch())
    d.Fake(r.fake or d.Fake())
end;
function b.SetLegitAntiAim()
    d.Pitch('Off')
    d.Yaw('Off')
    d.YawValue('0')
    d.YawBase('Local View')
    d.YawJitter('Off')
    d.Edge(false)
    d.Freestanding('-')
    d.FreestandingBind('On hotkey')
end;
function b.SetRageAntiAim()
    d.Pitch('Down')
    d.Yaw('180')
    d.YawValue('0')
end;
function b.SetMarioLuaFreestanding()
    local ab = l.antiaim_body_mode:GetItemName()
    d.Enable(b.exception_met or false)
    local ac = { client.camera_angles() }
    local O, ad = entity.get_prop(q, 'm_angAbsRotation')
    local ae = e.indicator.real_yaw < 1 and e.indicator.real_yaw > 0.0001 and math.floor(e.indicator.real_yaw, 1) or e.indicator.real_yaw;
    if ac[2] ~= nil and ad ~= nil and 60 < math.floor(math.abs(i.normalize_yaw(ac[2] - ae))) then
        ae = ae * -1
    end ;
    d.BodyYawValue(b.body_yaw_value)
    d.BodyYaw(ab)
    d.FreestandingBodyYaw(false)
    d.Fake(b.fake_yaw)
    b.state = "on"
end;
function b.SetSkeetFreestanding(ab)
    local ab = l.antiaim_body_mode:GetItemName()
    d.Enable(b.exception_met)
    d.BodyYaw(ab)
    if b.pich == 'Down' and b.yaw == '180' then
        d.BodyYawValue(b.body_yaw_value * -1)
    else
        d.BodyYawValue(b.body_yaw_value)
    end ;
    d.FreestandingBodyYaw(true)
    d.Fake(b.fake_yaw)
    b.state = "on"
end;
function b.SetManualAntiAim()
    local ab = l.antiaim_body_mode:GetItemName()
    local af = l.antiaim_body:GetValue()
    d.Enable(b.exception_met)
    d.BodyYaw(ab)
    d.BodyYawValue(b.body_yaw_value)
    d.FreestandingBodyYaw(false)
    d.Fake(b.fake_yaw)
    b.state = "on"
end;
function b.GetFakeJitter()
    local ag = l.antiaim_fake:GetValue()
    if not l.antiaim_fake_jitter_enable:GetValue() then
        b.fake_yaw = ag;
        return
    end ;
    local ah = l.antiaim_fake_jitter:GetValue()
    local ai = g.round(l.antiaim_fake_jitter_speed:GetValue())
    if ag == ah then
        b.fake_yaw = ag;
        return
    end ;
    client.delay_call(ai / 1000, function()
        if b.fake_yaw == ah then
            b.fake_yaw = ag
        elseif b.fake_yaw == ag then
            b.fake_yaw = ah
        else
            b.fake_yaw = ag
        end
    end)
end;
function b.exceptions()
    if not ui.get(e.ref.rage.fakeduck) and (l.antiaim_exception_enable:GetValue() and l.antiaim_enable:GetValue() and q ~= nil and entity.is_alive(q)) then
        local aj = a.cast("void***", m.get_net_channel_info(m.ivengineclient))
        local ak = a.cast("get_avg_loss_t", aj[0][11])
        local al = a.cast("get_avg_choke_t", aj[0][12])
        local am = ak(aj, 1)
        local an = al(aj, 1)
        b.exception_toggle = true;
        local ao = function()
            return math.floor(client.latency() * 1000 + 0.5)
        end;
        if am >= l.antiaim_exception_loss:GetValue() and l.antiaim_exception_loss:GetValue() ~= 100 then
            b.exception_met = false
        elseif an >= l.antiaim_exception_choke:GetValue() and l.antiaim_exception_choke:GetValue() ~= 100 then
            b.exception_met = false
        elseif e.AccumulateFps() <= l.antiaim_exception_fps:GetValue() and l.antiaim_exception_fps:GetValue() ~= 100 then
            b.exception_met = false
        elseif ao() >= l.antiaim_exception_ping:GetValue() and l.antiaim_exception_ping:GetValue() ~= 1000 then
            b.exception_met = false
        elseif b.exception_met ~= true then
            b.exception_met = true
        else
            b.exception_met = false
        end ;
        d.Enable(b.exception_met)
    elseif not l.antiaim_exception_enable:GetValue() and b.exception_toggle then
        b.exception_met = true;
        b.exception_toggle = false
    end
end;
local ap = false;
function b.handle()
    if l.antiaim_enable:GetValue() then
        local aq = l.antiaim_fake:GetValue()
        local ar = l.antiaim_body:GetValue()
        local ab = l.antiaim_body_mode:GetItemName()
        local U = l.antiaim_state:GetItemName()
        local as = l.antiaim_freestanding:GetItemName()
        b.body_yaw_mode = l.antiaim_body_mode:GetItemName()
        if U == 'Legit' then
            b.SetAntiAim({ enabled = true, yaw_base = 'Local View', body_yaw = ab, body_yaw_value = ar, fa = false, fa_bind = 'On hotkey', yaw = 'Off', yaw_value = '0', edge = false, pitch = 'Off', fake = aq, lby = 'Opposite' })
        elseif U == 'Rage' then
            b.SetAntiAim({ enabled = true, yaw_base = 'Local View', body_yaw = ab, body_yaw_value = ar, yaw = '180', yaw_value = '0', pitch = 'Down', fake = aq })
        end ;
        if l.antiaim_lby_mode:GetItemName() ~= 'Match Real' and b.fakelag_limit_backup then
            ui.set(e.ref.fakelag_limit, b.fakelag_limit)
            b.fakelag_limit_backup = false
        end ;
        if l.antiaim_lby_mode:GetItemName() == 'Local View' then
            b.lowerbody_yaw_target = "Eye Yaw"
        elseif l.antiaim_lby_mode:GetItemName() == 'Opposite' then
            b.lowerbody_yaw_target = "Opposite"
        elseif l.antiaim_lby_mode:GetItemName() == 'Match Real' then
            b.lowerbody_yaw_target = "Off"
            if not b.fakelag_limit_backup then
                b.fakelag_limit = ui.get(e.ref.fakelag_limit)
                b.fakelag_limit_backup = true
            end ;
            ui.set(e.ref.fakelag_limit, 2)
        elseif l.antiaim_lby_mode:GetItemName() == 'Sway' then
            b.lowerbody_yaw_target = "Sway"
        end ;
        if l.antiaim_switch_key:IsKeyToggle() and not ap then
            ap = true;
            b.body_yaw_value = b.body_yaw_value * -1
        elseif not l.antiaim_switch_key:IsKeyToggle() and ap then
            ap = false;
            b.body_yaw_value = b.body_yaw_value * -1
        end ;
        if l.antiaim_off_key:IsKeyToggle() then
            l.antiaim_off_key.bSet = true;
            b.SetAntiAim({ enabled = false, body_yaw = 'Off', body_yaw_value = '0', jitter = 'Off', jitter_value = '0', fa = false, yaw = 'Off', yaw_value = '0', edge = false, pitch = 'Off', fake = '0', lby = 'Off' })
            b.state = "off"
        else
            l.antiaim_off_key.bSet = false
        end ;
        b.GetFakeJitter()
        b.exceptions()
        if not l.antiaim_off_key.bSet then
            if as == 'MarioLua Freestanding' then
                b.Freestanding()
                b.SetMarioLuaFreestanding()
            elseif as == 'Skeet Freestanding' then
                b.SetSkeetFreestanding()
            elseif as == 'Manual' then
                b.SetManualAntiAim()
            end
        end
    elseif b.state == 'on' then
        d.Enable(false)
        b.state = 'off'
    end
end;
return { antiaim = b, cache = e, bindings = m, refs = l, cmath = g, centity = h, crender = j, cangle = i, Angle = o, Vector3 = p, vector = n, mariolua = f }