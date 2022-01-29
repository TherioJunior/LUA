local a = {}
local b = { resolver = {} }
local c = {}
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
local function n()
end;
local function o()
end;
local p = entity.get_local_player()
function a.get_vars()
    return { resolver = a, cache = b, bindings = k, refs = j, cmath = d, centity = e, crender = g, cangle = f, Angle = n, Vector3 = o, vector = l, mariolua = c, cstring = h, plylist = m, cweapon = i }
end;
function a.set_vars(q)
    c = q.mariolua or c;
    b = q.cache or b;
    k = q.bindings or k;
    j = q.refs or j;
    d = q.cmath or d;
    e = q.centity or e;
    h = q.cstring or h;
    g = q.crender or g;
    f = q.cangle or f;
    n = q.Angle or n;
    o = q.Vector3 or o;
    l = q.vector or l;
    m = q.plylist or m;
    i = q.cweapon or i
end;
a.indicator = { x = {}, y = {}, color = {}, arrow = {} }
local r = { ['arrow_1_l'] = '4peE', ['arrow_1_r'] = '4pa6', ['arrow_2_l'] = '4q+H', ['arrow_2_r'] = '4q+I', ['arrow_3_l'] = '4q6Y', ['arrow_3_r'] = '4q6a', ['arrow_4'] = '4oCS' }
function a.IsActive()
    return j.resolver_enable:GetValue() and not a.force_off
end;
local s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function t(u)
    local u = string.gsub(u, '[^' .. s .. '=]', '')
    return u:gsub('.', function(v)
        if v == '=' then
            return ''
        end ;
        local w, x = '', s:find(v) - 1;
        for y = 6, 1, -1 do
            w = w .. (x % 2 ^ y - x % 2 ^ (y - 1) > 0 and '1' or '0')
        end ;
        return w
    end)    :gsub('%d%d%d?%d?%d?%d?%d?%d?', function(v)
        if #v ~= 8 then
            return ''
        end ;
        local z = 0;
        for y = 1, 8 do
            z = z + (v:sub(y, y) == '1' and 2 ^ (8 - y) or 0)
        end ;
        return string.char(z)
    end)
end;
local A = { ['left_1'] = t(r['arrow_1_l']), ['right_1'] = t(r['arrow_1_r']), ['left_2'] = t(r['arrow_2_l']), ['right_2'] = t(r['arrow_2_r']), ['left_3'] = t(r['arrow_3_l']), ['right_3'] = t(r['arrow_3_r']), ['4'] = t(r['arrow_4']) }
function a.handle_resolver_indicator(ent)
    if not j.resolver_draw_side_indicator:GetValue() or not a.IsActive() or not entity.is_alive(p) or not m.GetForceBodyYawCheckbox(ent) then
        return
    end ;
    local B = l.get_FOV(o(0, entity.get_prop(ent, "m_angEyeAngles[1]"), 0), o(entity.get_prop(ent, "m_vecOrigin")), o(entity.get_prop(p, "m_vecAbsOrigin")))
    local C = B >= 0 and B <= 90 and true or false;
    local D = m.GetPlayerBodyYaw(ent)
    local E = 1 + math.sin(math.abs(-math.pi + globals.realtime() * 1 / 0.5 % (math.pi * 2))) * 170;
    if C and D > 0 or not C and D < 0 then
        a.indicator.color[ent] = { r = 124, g = 195, b = 13, a = E }
        a.indicator.arrow[ent] = A['left_2']
    elseif C and D < 0 or not C and D > 0 then
        a.indicator.color[ent] = { r = 250, g = 120, b = 170, a = E }
        a.indicator.arrow[ent] = A['right_2']
    end
end;
function a.render_resolver_indicator()
    if not j.resolver_draw_side_indicator:GetValue() or not a.IsActive() or not entity.is_alive(p) then
        return
    end ;
    local F = entity.get_players(true)
    for y = 1, #F do
        local ent = F[y]
        if not m.GetForceBodyYawCheckbox(ent) then
            return
        end ;
        local G, H, I = entity.hitbox_position(ent, 1)
        a.indicator.x[ent], a.indicator.y[ent] = renderer.world_to_screen(G, H, I)
        if a.indicator.color[ent] and a.indicator.x[ent] and a.indicator.y[ent] then
            local J = a.indicator.color[ent]
            renderer.text(a.indicator.x[ent], a.indicator.y[ent], J.r, J.g, J.b, J.a, "c+", 0, a.indicator.arrow[ent])
        end
    end
end;
a.hit = { ['Gamesense'] = { ['count'] = 0, ['headshot'] = 0 }, ['MarioLua'] = { ['count'] = 0, ['headshot'] = 0 } }
a.missed = { ['Gamesense'] = 0, ['MarioLua'] = 0 }
a.data = {}
a.info = {}
a.force_off = false;
a.data_off = false;
function a.full_reset()
    a.hit = { ['Gamesense'] = { ['count'] = 0, ['headshot'] = 0 }, ['MarioLua'] = { ['count'] = 0, ['headshot'] = 0 } }
    a.missed = { ['Gamesense'] = 0, ['MarioLua'] = 0 }
    a.data = {}
    a.info = {}
    a.force_off = false;
    a.data_off = false;
    c.log('[Resolver] Full reseted!')
end;
function a.set_current_resolver(ent)
    a.data[ent] = a.data[ent] or a.set_round_data()
    a.info[ent] = a.info[ent] or a.set_match_data()
    if ui.get(b.ref.rage.resolver_ref) then
        if a.IsActive() then
            if not m.IsCorrectionActive(ent) then
                a.info[ent].current = j.resolver_modules:IsEnabled('Desync Detection') and 'MarioLua (no correction active)' or 'Gamesense (no correction active)'
            else
                a.info[ent].current = 'MarioLua'
            end
        else
            a.info[ent].current = not m.IsCorrectionActive(ent) and 'Gamesense (no correction active)' or 'Gamesense'
        end
    else
        a.info[ent].current = 'None'
    end
end;
function a.set_round_data()
    return { logic = {}, ['slowwalk_limit'] = false, ['bruteforce'] = { ['active'] = false, ['hit'] = 0, ['miss'] = 0, ['set_yaw'] = nil }, antiaim = { ['is_backwards'] = false, ['extended'] = false, ['eye_yaw'] = false }, switch = {}, low_delta_switch = {}, ['animlayer'] = { ['switched'] = false, ['switch_state'] = false, ['switch_count'] = 0, ['is_desync'] = false, ['eye_yaw'] = false, ['fake_yaw'] = 60 }, props = { ['is_fakeduck'] = false, ['is_slowwalking'] = false, ['m_flChokedPackets'] = 0, ['m_flLowerBodyYawTarget'] = 0, ['m_flLowerBodyYawMoving'] = 0, ['m_flLowerBodyYawStanding'] = 0, ['m_flLowerBodyFakeDuck'] = 0, ['m_flLowerBodyYawSequenceAct'] = 0, ['m_angEyeAngles'] = n(0, 0, 0), ['velocity'] = {}, ['m_flVelocity2D'] = 0, ['lowdelta'] = false, ['highdelta'] = false, ['correction'] = nil, ['should_resolve'] = false, ['pref_packet'] = 0, ['bad_packets'] = 0, ['clean_packets'] = 0, ['m_flEyeYaw'] = 0, ['m_flGoalFeetYaw'] = 0, ['m_flGoalFeetDelta'] = 0, ['m_flCurrentFeetYaw'] = 0 }, record = { abs_yaw_set = false, latest_bullet_impact = 0, old_simulation_time = 0, latest_shot_yaw = 0 }, is_onshot = false, cur_hit_pattern = -1, fakeduck = false, force_zero = false, rec_sw_time = 0, sw_vel = {}, lby_next_think = 0, lby_side = '', lby_yaw = 0, yaw_dif = 0, resolved_yaw = 0, last_side = 0, side = 0, last_hit = 0, hit_side = 0, misses = 0, hits = 0, slowwalk_misses = 0, missed_body_yaw = nil, dmg_left = 0, dmg_right = 0, at_pitch = 0, at_yaw = 0 }
end;
function a.set_match_data()
    return { logic = { side = '' }, current = '', module = '', ['modules'] = { ['trace'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['trace2'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['fraction'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['fraction2'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['predict'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['edge'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['edge2'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['damage'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['damage2'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['position'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['simple'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['onshot'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['condition'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['lby'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 }, ['animlayer'] = { ['side'] = '', ['angle'] = 0, ['success'] = 1, ['failed'] = 1, ['accuracy'] = 100 } }, ['low_delta'] = { ['count'] = 0, ['active'] = false, ['yaw'] = nil }, ['bruteforce'] = { ['count'] = 0, ['hit_yaw'] = nil, ['missed_yaw'] = nil, ['fucked_up'] = false, ['reset_brute_timer'] = false }, ['hit_yaws_t'] = {}, ['missed_yaws_t'] = {}, ['average_hit_yaw'] = 0, ['average_missed_yaw'] = 0, ['hit_info'] = {}, ['miss_info'] = {}, miss_streak = 0, fake_limit = 60, misses = 0, hits = 0, hit_yaw = 60, force_off = false, inversed = false, slowwalk_inversed = false, real = 'Hide', missed_body_yaw = nil, hide_miss = 0, show_miss = 0, hide_hit = 0, show_hit = 0, state = '' }
end;
function a.update_resolver_stats()
    a.print_resolver_stats = { [1] = '------------[Resolver Stats]------------', [2] = '[Gamesense] Missed: ' .. a.missed['Gamesense'] .. ' | Hit: ' .. a.hit['Gamesense']['count'] .. ' | Headshots: ' .. a.hit['Gamesense']['headshot'], [3] = '[MarioLua] Missed: ' .. a.missed['MarioLua'] .. ' | Hit: ' .. a.hit['MarioLua']['count'] .. ' | Headshots: ' .. a.hit['MarioLua']['headshot'], [4] = '-------------------------------------------' }
end;
function a.OffResolverAll()
    local F = entity.get_players(true)
    for y = 1, #F do
        local ent = F[y]
        if a.info[ent] ~= nil then
            a.info[ent].current = 'Gamesense'
            a.info[ent].module = ''
        end ;
        client.update_player_list()
        m.SetPlayerBodyYaw(ent, 0)
        m.SetForceBodyYawCheckbox(ent, false)
        c.log("[Resolver] Set " .. entity.get_player_name(ent) .. "'s' off.")
    end ;
    return
end;
function a.OffResolver(ent)
    if a.info[ent] ~= nil then
        a.info[ent].current = 'Gamesense'
        a.info[ent].module = ''
    end ;
    m.SetPlayerBodyYaw(ent, 0)
    m.SetForceBodyYawCheckbox(ent, false)
    c.log("[Resolver] Set " .. entity.get_player_name(ent) .. "'s' off.")
    return
end;
function a.add_hit_info(ent, q)
    table.insert(a.info[ent]['hit_info'], q)
end;
function a.add_miss_info(ent, q)
    table.insert(a.info[ent]['miss_info'], q)
end;
function a.match_info_pattern(ent)
    if not j.resolver_modules:IsEnabled('Pattern') then
        a.data[ent].cur_hit_pattern = -1;
        return
    end ;
    for y = 1, #a.info[ent]['hit_info'] do
        local K = a.info[ent]['hit_info'][y]
        if K.slowwalk and a.data[ent].props['is_slowwalking'] or K.mode == a.data[ent].antiaim['mode'] and K.yaw_base == a.data[ent].antiaim['yaw_base'] or K.fakeduck and a.data[ent].props['is_fakeduck'] then
            a.data[ent].cur_hit_pattern = y;
            local D = a.data[ent].logic.side == 'left' and K.body_yaw or -K.body_yaw;
            a.data[ent].resolved_yaw = D;
            m.SetForceBodyYawCheckbox(ent, true)
            m.SetPlayerBodyYaw(ent, D)
            c.log("[Resolver] Found matching pattern for " .. entity.get_player_name(ent) .. ". Trying body yaw " .. D .. "�.")
        end
    end
end;
function a.should_log(ent)
    local L = a.data[ent]['condition_active']
    return not L
end;
b.brute_pos_offsets = { o(0, 0, 15), o(0, 15, 0), o(15, 0, 0) }
function a.render_brute_pos()
    if a.data[ent].brute_pos[1] == nil then
        return
    end ;
    local M, N = renderer.world_to_screen(a.data[ent].brute_pos[1], a.data[ent].brute_pos[2], a.data[ent].brute_pos[3])
    if M ~= nil then
        if not true then
            local O, P = renderer.world_to_screen(a.data[ent].brute_pos + b.brute_pos_offsets[1])
            if O ~= nil then
                renderer.line(M, N, O, P, 255, 0, 0, 180)
            end ;
            local Q, R = renderer.world_to_screen(a.data[ent].brute_pos + b.brute_pos_offsets[2])
            if Q ~= nil then
                renderer.line(M, N, Q, R, 255, 0, 0, 180)
            end ;
            local S, T = renderer.world_to_screen(a.data[ent].brute_pos - b.brute_pos_offsets[2])
            if S ~= nil then
                renderer.line(M, N, S, T, 255, 0, 0, 180)
            end ;
            local U, V = renderer.world_to_screen(a.data[ent].brute_pos + b.brute_pos_offsets[3])
            if U ~= nil then
                renderer.line(M, N, U, V, 255, 0, 0, 180)
            end ;
            local W, X = renderer.world_to_screen(a.data[ent].brute_pos - b.brute_pos_offsets[3])
            if W ~= nil then
                renderer.line(M, N, W, X, 255, 0, 0, 180)
            end
        end
    end
end;
function a.is_brute_pos(ent)
    if a.data[ent].misses < 1 then
        return
    end ;
    local Y = o(entity.get_prop(ent, "m_vecOrigin"))
    if Y.x == nil then
        return
    end ;
    local Z = l.distance_2d(Y.x, Y.y, a.data[ent].brute_pos[1], a.data[ent].brute_pos[2])
    if Z >= 5 then
        a.data[ent]['bruteforce']['active'] = false
    else
        a.data[ent]['bruteforce']['active'] = true
    end
end;
function a.log_bruteforce_pos(ent)
    local Y = o(entity.get_prop(ent, "m_vecOrigin"))
    if Y.x == nil then
        return
    end ;
    a.data[ent].brute_pos = { Y.x, Y.y, Y.z }
end;
function a.reset_bruteforce_on_dormancy(ent)
    if not a.data[ent] or not entity.is_dormant(ent) then
        return
    end ;
    if not a.data[ent]['bruteforce']['active'] then
        return
    end ;
    a.data[ent].reset_brute_timer = true;
    client.delay_call(5, function()
        if not a.data[ent] or not entity.is_dormant(ent) then
            return
        end ;
        if not a.data[ent]['bruteforce']['active'] then
            return
        end ;
        a.data[ent]['bruteforce']['fucked_up'] = false;
        a.data[ent]['bruteforce']['active'] = false;
        a.data[ent].reset_brute_timer = false;
        c.log('[Resolver] Reset bruteforce on ' .. entity.get_player_name(ent) .. ' due to long dormancy.')
    end)
end;
b.bruteforce_low_delta = { 40, 30, 20, 10 }
b.bruteforce_yaw = { 60, 45, 30, 20, 10 }
function a.bruteforce(ent, D)
    if a.info[ent]['low_delta']['active'] or not a.data[ent]['bruteforce']['active'] then
        return
    end ;
    if a.data[ent]['bruteforce']['miss'] == 1 and a.info[ent]['bruteforce']['count'] > 1 then
        a.info[ent]['bruteforce']['count'] = a.info[ent]['bruteforce']['count'] - 1
    end ;
    local _ = a.info[ent]['bruteforce']['count']
    local a0 = j.resolver_yawlimit:GetValue()
    local a1 = d.IsNumberNegative(D)
    a.data[ent].switch = { D * -1, a1 and 45 or -45, a1 and 30 or -30, a1 and 20 or -20, a1 and 10 or -10, 0 }
    a.data[ent]['bruteforce']['set_yaw'] = a.data[ent].switch[_]
    c.log("[Resolver] Bruteforced " .. entity.get_player_name(ent) .. "'s yaw to " .. a.data[ent].switch[_] .. "�.")
    m.SetPlayerBodyYaw(ent, d.clamp(a.data[ent].switch[_ % #a.data[ent].switch], -a0, a0))
    if a.info[ent]['bruteforce']['count'] >= #a.data[ent].switch then
        a.info[ent]['bruteforce']['count'] = 1;
        a.info[ent]['bruteforce']['fucked_up'] = true
    end ;
    if a.data[ent].switch[a.info[ent]['bruteforce']['count']] == 0 then
        a.info[ent]['bruteforce']['count'] = 1
    end
end;
function a.bruteforce_lowdelta(ent, D)
    if not j.resolver_modules:IsEnabled('Low Delta') and (not a.info[ent]['bruteforce']['fucked_up'] and not j.resolver_force_lowdelta:GetValue()) then
        return
    end ;
    if a.data[ent]['bruteforce']['miss'] == 1 and a.info[ent]['bruteforce']['count'] > 1 then
        a.info[ent]['bruteforce']['count'] = a.info[ent]['bruteforce']['count'] - 1
    end ;
    local a0 = j.resolver_yawlimit:GetValue()
    local a1 = d.IsNumberNegative(D)
    a.data[ent].low_delta_switch = { D * -1, a1 and 30 or -30, a1 and 20 or -20, a1 and 10 or -10, 0 }
    a.data[ent]['bruteforce']['set_yaw'] = a.data[ent].switch[a.info[ent]['bruteforce']['count']]
    c.log("[Resolver] *Low-Delta* Bruteforced '" .. entity.get_player_name(ent) .. "'s yaw to " .. a.data[ent].low_delta_switch[a.info[ent]['bruteforce']['count']] .. ".")
    m.SetPlayerBodyYaw(ent, d.clamp(a.data[ent].low_delta_switch[a.info[ent]['bruteforce']['count'] % #a.data[ent].low_delta_switch], -a0, a0))
    if a.info[ent]['bruteforce']['count'] >= #a.data[ent].low_delta_switch then
        a.info[ent]['bruteforce']['count'] = 1
    end ;
    if a.data[ent].low_delta_switch[a.info[ent]['bruteforce']['count']] == 0 then
        a.info[ent]['bruteforce']['count'] = 1
    end
end;
function a.bruteforce_handler(ent)
    if not j.resolver_modules:IsEnabled('Bruteforce') then
        return
    end ;
    a.data[ent]['bruteforce']['active'] = true;
    a.info[ent]['bruteforce']['count'] = a.info[ent]['bruteforce']['count'] + 1;
    local D = m.GetPlayerBodyYaw(ent)
    if a.info[ent]['bruteforce']['count'] <= 1 then
        if a.info[ent]['bruteforce']['missed_yaw'] ~= nil then
            D = a.info[ent]['bruteforce']['missed_yaw']
            if math.abs(D) == 0 then
                D = 60
            end ;
            nearest_idx, nearest_value = d.nearest_value((a.info[ent]['low_delta']['active'] or j.resolver_force_lowdelta:GetValue()) and b.bruteforce_low_delta or b.bruteforce_yaw, math.abs(D))
            a.info[ent]['bruteforce']['missed_yaw'] = nil;
            a.info[ent]['bruteforce']['count'] = nearest_idx + 1
        else
            D = m.GetPlayerBodyYaw(ent)
            nearest_idx, nearest_value = d.nearest_value((a.info[ent]['low_delta']['active'] or j.resolver_force_lowdelta:GetValue()) and b.bruteforce_low_delta or b.bruteforce_yaw, math.abs(D))
            a.info[ent]['bruteforce']['count'] = nearest_idx
        end
    end ;
    a.bruteforce(ent, D)
    if a.info[ent]['bruteforce']['count'] >= #a.data[ent].switch then
        a.info[ent]['bruteforce']['count'] = 1;
        a.info[ent]['bruteforce']['fucked_up'] = true
    end
end;
function a.low_delta(ent, a2)
    if not j.resolver_modules:IsEnabled('Low Delta') or not a.info[ent]['low_delta']['active'] then
        return
    end ;
    if a2 == 'miss' then
        if a.data[ent].misses >= 1 and a.data[ent].hits == 0 then
            a.info[ent]['low_delta']['count'] = a.info[ent]['low_delta']['count'] + 1
        end ;
        if a.data[ent].misses == 1 and a.info[ent]['low_delta']['count'] - 1 > 1 then
            a.info[ent]['low_delta']['count'] = a.info[ent]['low_delta']['count'] - 1
        end ;
        local a3 = a.info[ent]['low_delta']['count'] - 1;
        local D = m.GetPlayerBodyYaw(ent)
        local a0 = j.resolver_yawlimit:GetValue()
        local a1 = d.IsNumberNegative(D)
        if a3 == 1 then
            a.info[ent]['low_delta']['active'] = true;
            a.info[ent]['low_delta']['yaw'] = a1 and 30 or -30;
            c.log('[Resolver] Low-delta[' .. a3 .. '] detected on target [\'' .. entity.get_player_name(ent) .. '\']. Trying fake yaw \'' .. a.info[ent]['low_delta']['yaw'] .. '°\'')
            m.SetPlayerBodyYaw(ent, d.clamp(a.info[ent]['low_delta']['yaw'], -a0, a0))
        elseif a3 == 2 then
            a.info[ent]['low_delta']['yaw'] = a1 and 20 or -20;
            c.log('[Resolver] Low-delta[' .. a3 .. '] target [\'' .. entity.get_player_name(ent) .. '\']. Trying fake yaw \'' .. a.info[ent]['low_delta']['yaw'] .. '°\'')
            m.SetPlayerBodyYaw(ent, d.clamp(a.info[ent]['low_delta']['yaw'], -a0, a0))
        elseif a3 == 3 then
            a.info[ent]['low_delta']['yaw'] = a1 and 10 or -10;
            c.log('[Resolver] Low-delta[' .. a3 .. '] target [\'' .. entity.get_player_name(ent) .. '\']. Trying fake yaw \'' .. a.info[ent]['low_delta']['yaw'] .. '°\'')
            m.SetPlayerBodyYaw(ent, d.clamp(a.info[ent]['low_delta']['yaw'], -a0, a0))
        elseif a3 == 4 then
            a.info[ent]['low_delta']['count'] = 0;
            a.info[ent]['low_delta']['active'] = false;
            a.info[ent]['low_delta']['yaw'] = nil;
            m.SetPlayerBodyYaw(ent, d.clamp(a1 and 60 or -60, -a0, a0))
            c.log('[Resolver] Low-delta[' .. a3 .. '] target [\'' .. entity.get_player_name(ent) .. '\']. Possible wrong detection. Reseting low-delta data and body yaw to ' .. d.clamp(a1 and 60 or -60, -a0, a0) .. '�')
        end
    elseif a2 == 'hit' then
        if math.abs(a.info[ent].hit_yaw) <= 30 and not a.info[ent]['low_delta']['active'] then
            a.info[ent]['low_delta']['active'] = true;
            a.info[ent]['low_delta']['count'] = 2
        elseif math.abs(a.info[ent].hit_yaw) > 30 and a.info[ent]['low_delta']['active'] then
            a.info[ent]['low_delta']['active'] = false;
            a.info[ent]['low_delta']['count'] = 0
        end ;
        if not a.info[ent]['low_delta']['active'] and (a.info[ent].hits == 2 and a.info[ent]['low_delta']['count'] < 2 and a.info[ent].misses == 0) then
            a.info[ent]['low_delta']['count'] = 0
        end ;
        if not a.info[ent]['low_delta']['active'] and a.info[ent]['low_delta']['count'] > 0 then
            a.info[ent]['low_delta']['count'] = 0;
            c.log('[Resolver] Hit target [\'' .. entity.get_player_name(ent) .. '\']. Setting low delta count to 0�')
        end
    end
end;
function a.set_module_stats(ent, a4)
    local state = a4 and 'failed' or 'success'
    local a5 = a.info[ent].logic.side;
    for a6, a7 in pairs(a.info[ent]['modules']) do
        a7[state] = a7['side'] == a5 and a7[state] + 1 or a7[state]
    end
end;
function a.slowwalk_miss(ent)
    if a.data[ent].props['is_slowwalking'] then
        a.info[ent].slowwalk_inversed = not a.info[ent].slowwalk_inversed
    elseif a.info[ent].misses == 2 then
        a.info[ent].inversed = true
    elseif a.info[ent].misses == 4 then
        a.info[ent].inversed = false;
        a.info[ent].misses = 0
    end
end;
function a.handle_miss_streak(ent)
    if a.data[ent].misses == 1 and a.data[ent].hits == 0 and not a.data[ent].record.abs_yaw_set then
        a.info[ent].miss_streak = a.info[ent].miss_streak + 1
    end ;
    if a.info[ent].miss_streak == 3 then
        a.info[ent].real = 'Show'
        c.log('[Resolver] ' .. entity.get_player_name(ent) .. ' is maybe peeking with real.')
    elseif a.info[ent].miss_streak >= 6 then
        a.info[ent].real = 'Hide'
        c.log('[Resolver] ' .. entity.get_player_name(ent) .. ' is not peeking with real.')
    end
end;
b.hitgroup_names = { 'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear' }
b.shot_data = {}
function a.aim_fire(a8)
    b.shot_data[a8.id] = { state = state or 'unknown', target = a8.target or '', hitgroup = a8.hitgroup or '', target_hitgroup = a8.hitgroup or '' }
end;
function a.aim_hit(a8)
    local a9 = a8.id;
    b.shot_data[a9].state = 'hit'
    b.shot_data[a9].hitgroup = a8.hitgroup;
    local ent = a8.target;
    local aa = b.hitgroup_names[a8.hitgroup + 1] or '?'
    local ab = b.hitgroup_names[b.shot_data[a9].target_hitgroup + 1] or '?'
    a.data[ent] = a.data[ent] or a.set_round_data()
    a.info[ent] = a.info[ent] or a.set_match_data()
    a.set_current_resolver(ent)
    local ac = { ['hit'] = string.format('Hit %s in the %s for %d damage (%d health remaining)', entity.get_player_name(a8.target), aa, a8.damage, entity.get_prop(a8.target, 'm_iHealth')), ['wrong_hit'] = string.format('Missed target hitgroup "%s"  and hit "%s"', ab, aa), ['resolver_hit'] = '' }
    if a.info[ent].current == 'Gamesense' or a.info[ent].current == 'MarioLua' then
        ac['resolver_hit'] = string.format('%s Resolver hit %s in the %s for %d damage (%d health remaining)', a.info[ent].current, entity.get_player_name(a8.target), aa, a8.damage, entity.get_prop(a8.target, 'm_iHealth'))
        a.hit[a.info[ent].current]['count'] = a.hit[a.info[ent].current]['count'] + 1;
        if a8.hitgroup == 1 then
            a.hit[a.info[ent].current]['headshot'] = a.hit[a.info[ent].current]['headshot'] + 1
        end ;
        if a.info[ent].current == 'MarioLua' then
            a.info[ent].hits = a.info[ent].hits + 1;
            a.data[ent].hits = a.data[ent].hits + 1
        end ;
        if ab == aa and a.info[ent].current == 'MarioLua' then
            a.set_module_stats(ent, false)
            a.info[ent].hit_yaw = m.GetPlayerBodyYaw(ent)
            a.data[ent].resolved_yaw = m.GetPlayerBodyYaw(ent)
            table.insert(a.info[ent]['hit_yaws_t'], math.abs(a.info[ent].hit_yaw))
            a.low_delta(ent, 'hit')
        end ;
        a.data[ent]['bruteforce']['hit'] = a.data[ent]['bruteforce']['active'] and a.data[ent]['bruteforce']['hit'] + 1 or a.data[ent]['bruteforce']['hit']
        a.info[ent]['bruteforce']['hit_yaw'] = a.data[ent]['bruteforce']['active'] and m.GetPlayerBodyYaw(ent) or a.info[ent]['bruteforce']['hit_yaw']
        if j.resolver_log_hit:GetValue() then
            c.PrintInChat(ac['resolver_hit'])
            if ab ~= aa then
                c.PrintInChat(ac['wrong_hit'])
                c.print(ac['wrong_hit'])
            end
        end ;
        c.print(ac['resolver_hit'])
        a.update_resolver_stats()
    else
        if j.resolver_log_hit:GetValue() then
            c.PrintInChat(ac['hit'])
        end ;
        if ab ~= aa then
            c.print(ac['hit'])
        end
    end
end;
function a.aim_miss(a8)
    local ent = a8.target;
    local ad = a8.reason == "?" and "resolver" or a8.reason;
    local ae = {}
    ae['others'] = 'Missed shot at ' .. entity.get_player_name(ent) .. ' due to ' .. ad .. '.'
    if ad == "resolver" then
        a.data[ent] = a.data[ent] or a.set_round_data()
        a.info[ent] = a.info[ent] or a.set_match_data()
        a.set_current_resolver(ent)
        a.info[ent].missed_body_yaw = m.GetPlayerBodyYaw(ent)
        ae['resolver'] = 'Missed shot at ' .. entity.get_player_name(ent) .. ' due to ' .. a.info[ent].current .. ' Resolver.' .. ' [' .. a.data[ent].misses + 1 .. 'x]'
        if a.info[ent].current:match('MarioLua') or a.info[ent].current:match('Gamesense') then
            a.missed[a.info[ent].current:match('MarioLua') and 'MarioLua' or 'Gamesense'] = a.missed[a.info[ent].current:match('MarioLua') and 'MarioLua' or 'Gamesense'] + 1;
            a.data[ent].misses = a.data[ent].misses + 1;
            a.info[ent].misses = a.info[ent].misses + 1;
            a.set_module_stats(ent, true)
            if a.IsActive() and j.resolver_modules:IsEnabled('Desync Detection') and not a.data[ent].props['should_resolve'] then
                a.data[ent].props['should_resolve'] = true;
                a.data[ent].props['correction'] = true;
                m.SetForceBodyYawCheckbox(ent, true)
                m.SetCorrectionActive(ent, true)
            end ;
            if a.info[ent].current:match('MarioLua') then
                table.insert(a.info[ent]['missed_yaws_t'], math.abs(a.info[ent].missed_body_yaw))
                a.data[ent]['bruteforce']['miss'] = a.data[ent]['bruteforce']['active'] and a.data[ent]['bruteforce']['miss'] + 1 or a.data[ent]['bruteforce']['miss']
                a.bruteforce_handler(ent)
                a.low_delta(ent, 'miss')
            end ;
            if a.data[ent].props['is_slowwalking'] then
                a.data[ent].slowwalk_misses = a.data[ent].slowwalk_misses + 1
            end ;
            a.update_resolver_stats()
        end ;
        if j.resolver_log_miss:GetValue() then
            c.PrintInChat(ae['resolver'])
            c.print(ae['resolver'])
        end ;
        c.log('[Resolver] Missed shot player ' .. entity.get_player_name(ent) .. ' at yaw: ' .. m.GetPlayerBodyYaw(ent) .. '� [' .. a.data[ent].misses + 1 .. 'x]')
    elseif j.resolver_log_miss:GetValue() then
        c.PrintInChat(ae['others'])
        c.print(ae['others'])
    end
end;
b.t_last_layer_info = {}
b.m_flPrevAccelerating = {}
b.m_flPrevSlowingDown = {}
b.m_flPrevVelocity2D = {}
b.m_flPrevCycle = {}
b.m_flPrevWeight = {}
b.m_flPrevCycle6 = {}
b.m_flPrevWeight6 = {}
b.layer_control = {}
b.layer_control_table = { ['is_active'] = '', ['override'] = true, ['basic'] = { ['value'] = 0 }, ['onshot'] = { ['shot_fired'] = false }, ['velocity'] = {} }
a.records = {}
a.record_max_ticks = 8;
a.record_old_tickcount = {}
function a.get_player_records(ent)
    if ent ~= nil and a.records[ent] ~= nil then
        return a.records[ent]
    end
end;
function a.reset(ent)
    a.records[ent] = {}
end;
function a.update_player_record_data(ent)
    local af = a.records[ent]
    local ag = entity.get_prop(ent, "m_flSimulationTime")
    if af == nil then
        a.records[ent] = {}
        af = a.records[ent]
    end ;
    a.record_old_tickcount[ent] = a.record_old_tickcount[ent] or globals.tickcount()
    if ag > 0 and (#af == 0 or #af > 0 and af[1].simulation_time ~= ag) then
        local ah = e.get_animlayer(ent, 3)
        local ai = e.get_animlayer(ent, 6)
        local aj = e.get_animlayer(ent, 12)
        local ak = { [3] = { m_flCycle = ah.m_flCycle, m_flWeight = ah.m_flWeight, m_flPlaybackRate = ah.m_flPlaybackRate }, [6] = { m_flCycle = ai.m_flCycle, m_flWeight = ai.m_flWeight, m_flPlaybackRate = ai.m_flPlaybackRate }, [12] = { m_flCycle = aj.m_flCycle, m_flWeight = aj.m_flWeight, m_flPlaybackRate = aj.m_flPlaybackRate } }
        local al = { animlayer = ak, m_flVelocity2D = { a.data[ent].props['m_flVelocity2D'] }, m_angEyeAngles = { a.data[ent].props['m_angEyeAngles'] }, m_flLowerBodyYawTarget = a.data[ent].props['m_flLowerBodyYawTarget'], m_flLowerBodyDelta = a.data[ent].props['m_flLowerBodyDelta'], m_flLowerBodyYawMoving = a.data[ent].props['m_flLowerBodyYawMoving'], m_flLowerBodyYawStanding = a.data[ent].props['m_flLowerBodyYawStanding'], m_flEyeYaw = a.data[ent].props['m_flEyeYaw'], m_flGoalFeetYaw = a.data[ent].props['m_flGoalFeetYaw'], m_flGoalFeetDelta = a.data[ent].props['m_flGoalFeetDelta'], m_flCurrentFeetYaw = a.data[ent].props['m_flCurrentFeetYaw'], origin = { entity.get_prop(ent, "m_vecOrigin") }, m_vecMins = { entity.get_prop(ent, "m_vecMins") }, m_vecMaxs = { entity.get_prop(ent, "m_vecMaxs") }, simulation_time = entity.get_prop(ent, "m_flSimulationTime"), on_ground = entity.get_prop(ent, "m_vecVelocity[2]") ^ 2 > 0, m_iTickCount = globals.tickcount() }
        for y = a.record_max_ticks, 2, -1 do
            a.records[ent][y] = a.records[ent][y - 1]
        end ;
        a.record_old_tickcount[ent] = globals.tickcount()
        a.records[ent][1] = al
    end
end;
function a.handle_record(ent)
    a.update_player_record_data(ent)
end;
function a.log_layer_t(ent, ak, y)
    if y ~= 6 then
        return
    end ;
    local am = '[Resolver] Anim layer ' .. entity.get_player_name(ent) .. '\nLayer ' .. y .. '\nm_flWeight ' .. ak.m_flWeight .. '\nm_flPrevWeight ' .. b.m_flPrevWeight[ent] .. '\nm_flCycle ' .. ak.m_flCycle .. '\nm_flPrevCycle ' .. b.m_flPrevCycle[ent] .. '\nvelocity2d ' .. d.no_decimals(velocity2d)
    c.log(am)
end;
b.animlayer_c = {}
b.animlayer = {}
function a.animlayer_pref(ent, an)
    if ent == nil then
        return
    end ;
    local ak = e.get_animlayer(ent, an)
    local ao = e.animstate(ent)
    local ap = math.abs(ao.m_iLastClientSideAnimationUpdateFramecount - ao.m_iLastClientSideAnimationUpdateFramecount)
    local aq = { m_flCycle = 1, m_flWeight = 1, m_flPlaybackRate = 1 }
    local ar = { m_flPrevCycle = ak.m_flCycle, m_flCycle = ak.m_flCycle, m_flClientCycle = { 0, 0, 0 }, m_flPrevWeight = ak.m_flWeight, m_flWeight = ak.m_flWeight, m_flClientWeight = { 0, 0, 0 }, m_flPrevPlaybackRate = ak.m_flPlaybackRate, m_flPlaybackRate = ak.m_flPlaybackRate, m_flClientPlaybackRate = { 0, 0, 0 }, m_flWeightAdvanced = ak.m_flWeightDeltaRate * ap + ak.m_flWeight }
    b.animlayer_c[ent] = b.animlayer_c[ent] or {}
    b.animlayer_c[ent][an] = b.animlayer_c[ent][an] or aq;
    b.animlayer[ent] = b.animlayer[ent] or {}
    b.animlayer[ent][an] = b.animlayer[ent][an] or ar;
    if ak.m_flCycle ~= b.animlayer[ent][an].m_flCycle then
        b.animlayer[ent][an].m_flPrevCycle = b.animlayer[ent][an].m_flCycle;
        b.animlayer[ent][an].m_flCycle = ak.m_flCycle;
        b.animlayer[ent][an].m_flClientCycle[b.animlayer_c[ent][an].m_flCycle] = ak.m_flCycle;
        if b.animlayer_c[ent][an].m_flCycle == 3 then
            b.animlayer_c[ent][an].m_flCycle = 1
        else
            b.animlayer_c[ent][an].m_flCycle = b.animlayer_c[ent][an].m_flCycle + 1
        end
    end ;
    if ak.m_flWeight ~= b.animlayer[ent][an].m_flWeight then
        b.animlayer[ent][an].m_flPrevWeight = b.animlayer[ent][an].m_flWeight;
        b.animlayer[ent][an].m_flWeight = ak.m_flWeight;
        b.animlayer[ent][an].m_flClientWeight[b.animlayer_c[ent][an].m_flWeight] = ak.m_flWeight;
        if b.animlayer_c[ent][an].m_flWeight == 3 then
            b.animlayer_c[ent][an].m_flWeight = 1
        else
            b.animlayer_c[ent][an].m_flWeight = b.animlayer_c[ent][an].m_flWeight + 1
        end
    end ;
    if ak.m_flPlaybackRate ~= b.animlayer[ent][an].m_flPlaybackRate then
        b.animlayer[ent][an].m_flPrevPlaybackRate = b.animlayer[ent][an].m_flPlaybackRate;
        b.animlayer[ent][an].m_flPlaybackRate = ak.m_flPlaybackRate;
        b.animlayer[ent][an].m_flClientPlaybackRate[b.animlayer_c[ent][an].m_flPlaybackRate] = ak.m_flPlaybackRate;
        if b.animlayer_c[ent][an].m_flPlaybackRate == 3 then
            b.animlayer_c[ent][an].m_flPlaybackRate = 1
        else
            b.animlayer_c[ent][an].m_flPlaybackRate = b.animlayer_c[ent][an].m_flPlaybackRate + 1
        end
    end
end;
b.layer_log_t = {}
function a.record_animlayers(ent, v, as)
    if ent == nil or b.animlayer[ent] == nil then
        return
    end ;
    local ah, at = e.get_animlayer(ent, 3)
    local ai = e.get_animlayer(ent, 6)
    local aj = e.get_animlayer(ent, 12)
    local ao = e.animstate(ent)
    local ap = math.abs(ao.m_iLastClientSideAnimationUpdateFramecount - ao.m_iLastClientSideAnimationUpdateFramecount)
    local au = ah.m_flWeightDeltaRate * ap + ah.m_flWeight;
    local av = ai.m_flWeightDeltaRate * ap + ai.m_flWeight;
    local aw = aj.m_flWeightDeltaRate * ap + aj.m_flWeight;
    local ax = a.get_player_records(ent)
    local ay = { '\n', '[Layer 3]', string.format('     m_flWeightAdvanced: %f ', au), string.format('     m_flWeightDeltaRate: %f ', ah.m_flWeightDeltaRate), string.format('     m_flWeight: %f ', ah.m_flWeight), string.format('     m_flPrevWeight: %f ', b.animlayer[ent][3].m_flPrevWeight), string.format('     m_flCycle: %f ', ah.m_flCycle), string.format('     m_flPrevCycle: %f ', b.animlayer[ent][3].m_flPrevCycle), string.format('     m_flPlaybackRate: %f ', ah.m_flPlaybackRate), string.format('     m_flPrevPlaybackRate: %f ', b.animlayer[ent][3].m_flPrevPlaybackRate), string.format('     m_flWeight                 1: %f,           2: %f,           3: %f ', ax[1].animlayer[3].m_flWeight, ax[2].animlayer[3].m_flWeight, ax[3].animlayer[3].m_flWeight), string.format('     m_flCycle                  1: %f,           2: %f,           3: %f ', ax[1].animlayer[3].m_flCycle, ax[2].animlayer[3].m_flCycle, ax[3].animlayer[3].m_flCycle), string.format('     m_flPlaybackRate           1: %f,           2: %f,           3: %f ', ax[1].animlayer[3].m_flPlaybackRate, ax[2].animlayer[3].m_flPlaybackRate, ax[3].animlayer[3].m_flPlaybackRate), string.format('     Sequence Activity: %i ', at), '\n', '[Layer 6]', string.format('     m_flWeightAdvanced: %f ', av), string.format('     m_flWeightDeltaRate: %f ', ai.m_flPlaybackRate - av), string.format('     m_flWeight: %f ', ai.m_flWeight), string.format('     m_flPrevWeight: %f ', b.animlayer[ent][6].m_flPrevWeight), string.format('     m_flCycle: %f ', ai.m_flCycle), string.format('     m_flPrevCycle: %f ', b.animlayer[ent][6].m_flPrevCycle), string.format('     m_flPlaybackRate: %f ', ai.m_flPlaybackRate), string.format('     m_flWeight                 1: %f,           2: %f,           3: %f ', ax[1].animlayer[6].m_flWeight, ax[2].animlayer[6].m_flWeight, ax[3].animlayer[6].m_flWeight), string.format('     m_flCycle                  1: %f,           2: %f,           3: %f ', ax[1].animlayer[6].m_flCycle, ax[2].animlayer[6].m_flCycle, ax[3].animlayer[6].m_flCycle), string.format('     m_flPlaybackRate           1: %f,           2: %f,           3: %f ', ax[1].animlayer[6].m_flPlaybackRate, ax[2].animlayer[6].m_flPlaybackRate, ax[3].animlayer[6].m_flPlaybackRate), string.format('     m_flPrevPlaybackRate: %f ', b.animlayer[ent][6].m_flPrevPlaybackRate), '\n', '[Layer 12]', string.format('     m_flWeightAdvanced: %f ', aw), string.format('     m_flWeightDeltaRate: %f ', aj.m_flWeightDeltaRate), string.format('     m_flWeight: %f ', aj.m_flWeight), string.format('     m_flPrevWeight: %f ', b.animlayer[ent][12].m_flPrevWeight), string.format('     m_flCycle: %f ', aj.m_flCycle), string.format('     m_flPrevCycle: %f ', b.animlayer[ent][12].m_flPrevCycle), string.format('     m_flPlaybackRate: %f ', aj.m_flPlaybackRate), string.format('     m_flWeight                 1: %f,           2: %f,           3: %f ', ax[1].animlayer[12].m_flWeight, ax[2].animlayer[12].m_flWeight, ax[3].animlayer[12].m_flWeight), string.format('     m_flCycle                  1: %f,           2: %f,           3: %f ', ax[1].animlayer[12].m_flCycle, ax[2].animlayer[12].m_flCycle, ax[3].animlayer[12].m_flCycle), string.format('     m_flPlaybackRate           1: %f,           2: %f,           3: %f ', ax[1].animlayer[12].m_flPlaybackRate, ax[2].animlayer[12].m_flPlaybackRate, ax[3].animlayer[12].m_flPlaybackRate), string.format('     m_flPrevPlaybackRate: %f ', b.animlayer[ent][12].m_flPrevPlaybackRate), '----------------------------------------------------------\n', '\n' }
    local az = entity.get_player_name(ent)
    b.layer_log_t[az] = b.layer_log_t[az] or {}
    b.layer_log_t[az][1] = b.layer_log_t[az][1] or ay;
    b.layer_log_t[az][1] = ay;
    b.draw_ply_info(b.layer_log_t[az], ent == p and 0 or v - 350, ent == p and 360 or as)
end;
b.highest_weight = { [0] = 0, [1] = 0.004, [2] = 0.004, [3] = 0.004, [4] = 0.004, [5] = 0.004, [6] = 0.004, [7] = 0.004, [8] = 0.004, [9] = 0.004, [10] = 0.004, [11] = 0.004, [12] = 0.004, [13] = 0.004, [14] = 0.004, [15] = 0.004, [16] = 0.004, [17] = 0.004, [18] = 0.004, [19] = 0.004, [20] = 0.008, [21] = 0.024, [22] = 0.024, [23] = 024, [24] = 024, [25] = 024, [26] = 024, [27] = 024, [28] = 024, [29] = 024, [30] = 024, [31] = 024, [32] = 0.09, [33] = 0.141, [34] = 141, [35] = 0.141, [36] = 141, [37] = 0.141, [38] = 141, [39] = 0.141, [40] = 0.314, [41] = 0.314, [42] = 0.314, [43] = 0.314, [44] = 0.314, [45] = 0.141, [46] = 0.314, [47] = 0.373, [48] = 0.345, [49] = 0.392, [50] = 0.4, [51] = 0.4, [52] = 0.4, [53] = 0.424, [54] = 0.424, [55] = 0.424, [56] = 0.447, [57] = 0.447, [58] = 0.447, [59] = 0.447, [60] = 0.478, [61] = 0.463, [62] = 0.494, [63] = 0.478, [64] = 0.478, [65] = 0.478, [66] = 0.478, [67] = 0.478, [68] = 0.541, [69] = 0.541, [70] = 0.565, [71] = 0.596, [72] = 0.604, [73] = 0.651, [74] = 0.651, [75] = 0.651, [76] = 0.596, [77] = 0.592, [78] = 0.604, [79] = 0.682, [80] = 0.835, [81] = 0.835, [82] = 0.835, [83] = 0.835, [84] = 0.835, [85] = 0.835, [86] = 0.835, [87] = 0.835, [88] = 0.835, [89] = 0.835, [90] = 0.827, [91] = 0.827, [92] = 0.827, [93] = 0.827, [94] = 0.969, [95] = 0.969, [96] = 0.969, [97] = 0.969, [98] = 0.969, [99] = 0.969, [100] = 0.969, [101] = 0.969, [102] = 0.969, [103] = 0.969, [104] = 0.969, [105] = 0.969, [106] = 0.969, [107] = 0.969, [108] = 0.969, [109] = 0.969, [110] = 0.969, [111] = 0.969, [112] = 0.969, [113] = 0.969, [114] = 0.969, [115] = 0.969, [116] = 0.969, [117] = 0.969, [118] = 0.969, [119] = 0.969, [120] = 0.969, [121] = 0.969, [122] = 0.969, [123] = 0.969, [124] = 0.969, [125] = 0.969, [126] = 0.969, [127] = 0.969, [128] = 0.969, [129] = 0.969, [130] = 0.969, [131] = 0.969, [132] = 0.969, [133] = 0.969, [134] = 0.969, [135] = 0.937, [136] = 0.937, [137] = 0.933, [138] = 0.933, [139] = 0.937, [140] = 0.937, [141] = 0.937, [141] = 0.937, [143] = 0.933, [144] = 0.929, [145] = 0.937, [146] = 0.933, [147] = 0.933, [148] = 0.933, [149] = 0.937, [150] = 0.933, [151] = 0.922, [152] = 0.922, [153] = 0.933, [154] = 0.929, [155] = 0.922, [156] = 0.914, [157] = 0.922, [158] = 0.922, [159] = 0.929, [160] = 0.933, [161] = 0.933, [162] = 0.933, [163] = 0.933, [164] = 0.933, [165] = 0.914, [166] = 0.933, [167] = 0.933, [168] = 0.925, [169] = 0.929, [170] = 0.933, [171] = 0.922, [172] = 0.914, [173] = 0.933, [174] = 0.925, [175] = 0.918, [176] = 0.933, [177] = 0.918, [178] = 0.933, [179] = 0.933, [180] = 0.925, [181] = 0.933, [182] = 0.918, [183] = 0.918, [184] = 0.922, [185] = 0.929, [186] = 0.933, [187] = 0.91, [188] = 0.922, [189] = 0.91, [190] = 0.914, [191] = 0.914, [192] = 0.933, [193] = 0.914, [194] = 0.929, [195] = 0.914, [196] = 0.918, [197] = 0.929, [198] = 0.91, [199] = 0.914, [200] = 0.918, [201] = 0.918, [202] = 0.91, [203] = 0.922, [204] = 0.922, [205] = 0.929, [206] = 0.929, [207] = 0.929, [208] = 0.914, [209] = 0.914, [210] = 0.925, [211] = 0.929, [212] = 0.914, [213] = 0.914, [214] = 0.929, [215] = 0.914, [216] = 0.918, [217] = 0.91, [218] = 0.914, [219] = 0.922, [220] = 0.914, [221] = 0.914, [222] = 0.925, [223] = 0.914, [224] = 0.914, [225] = 0.91, [226] = 0.914, [227] = 0.914, [228] = 0.922, [229] = 0.925, [230] = 0.914, [231] = 0.914, [232] = 0.91, [233] = 0.925, [234] = 0.925, [235] = 0.914, [236] = 0.918, [237] = 0.914, [238] = 0.918, [239] = 0.922, [240] = 0.914, [241] = 0.914, [242] = 0.914, [243] = 0.922, [244] = 0.914, [245] = 0.91, [246] = 0.918, [247] = 0.914, [248] = 0.914, [249] = 0.918, [250] = 0.918 }
b.lowest_weight = { [0] = 0, [1] = 0.004, [2] = 0.004, [3] = 0.004, [4] = 0.004, [6] = 0.008, [7] = 0.008, [8] = 0.008, [9] = 0.008, [10] = 0.008, [11] = 0.008, [12] = 0.008, [13] = 0.008, [14] = 0.008, [15] = 0.008, [16] = 0.008, [17] = 0.008, [18] = 0.039, [19] = 0.039, [20] = 0.039, [21] = 0.039, [22] = 0.039, [23] = 0.039, [24] = 0.039, [25] = 0.043, [26] = 0.043, [27] = 0.043, [28] = 0.043, [29] = 0.043, [30] = 0.043, [31] = 0.043, [32] = 0.043, [33] = 0.043, [34] = 0.063, [35] = 0.063, [36] = 0.063, [37] = 0.063, [38] = 0.063, [39] = 0.063, [40] = 0.063, [41] = 0.063, [42] = 0.063, [43] = 0.063, [44] = 0.063, [45] = 0.063, [46] = 0.063, [47] = 0.098, [48] = 0.098, [49] = 0.098, [50] = 0.098, [51] = 0.098, [52] = 0.098, [53] = 0.098, [54] = 0.098, [55] = 0.098, [56] = 0.098, [57] = 0.098, [58] = 0.098, [59] = 0.118, [60] = 0.118, [61] = 0.118, [62] = 0.141, [63] = 0.141, [64] = 0.141, [65] = 0.141, [66] = 0.141, [67] = 0.141, [68] = 0.141, [69] = 0.157, [70] = 0.157, [71] = 0.192, [72] = 0.153, [73] = 0.153, [74] = 0.153, [75] = 0.153, [76] = 0.153, [77] = 0.212, [78] = 0.212, [79] = 0.212, [80] = 0.212, [81] = 0.212, [82] = 0.212, [83] = 0.212, [84] = 0.212, [85] = 0.212, [86] = 0.212, [87] = 0.290, [88] = 0.290, [89] = 0.318, [90] = 0.318, [91] = 0.318, [92] = 0.318, [93] = 0.318, [94] = 0.318, [95] = 0.318, [96] = 0.318, [97] = 0.318, [98] = 0.318, [99] = 0.388, [100] = 0.376, [101] = 0.376, [102] = 0.573, [103] = 0.569, [104] = 0.569, [105] = 0.616, [106] = 0.616, [107] = 0.682, [108] = 0.682, [109] = 0.682, [110] = 0.733, [111] = 0.733, [112] = 0.733, [113] = 0.824, [115] = 0.824, [115] = 0.855, [116] = 0.855, [117] = 0.855, [118] = 0.855, [119] = 0.900, [120] = 0.900, [121] = 0.900, [122] = 0.900, [123] = 0.900, [124] = 0.900, [125] = 0.900, [126] = 0.900, [127] = 0.900, [128] = 0.900, [129] = 0.900, [130] = 0.900, [131] = 0.900, [132] = 0.900, [133] = 0.900, [134] = 0.900, [135] = 0.900, [136] = 0.900, [137] = 0.900, [138] = 0.900, [139] = 0.900, [140] = 0.900, [141] = 0.900, [142] = 0.900, [143] = 0.900, [144] = 0.900, [145] = 0.900, [146] = 0.900, [147] = 0.900, [148] = 0.900, [149] = 0.900, [150] = 0.900, [151] = 0.900, [152] = 0.900, [153] = 0.900, [154] = 0.900, [155] = 0.900, [156] = 0.900, [157] = 0.900, [158] = 0.900, [159] = 0.900, [160] = 0.900, [161] = 0.900, [162] = 0.900, [163] = 0.900, [164] = 0.900, [165] = 0.900, [166] = 0.900, [167] = 0.900, [168] = 0.900, [169] = 0.900, [170] = 0.900, [171] = 0.900, [172] = 0.900, [173] = 0.900, [174] = 0.900, [175] = 0.900, [176] = 0.900, [177] = 0.900, [178] = 0.900, [179] = 0.900, [180] = 0.900, [181] = 0.900, [182] = 0.900, [183] = 0.900, [184] = 0.900, [185] = 0.900, [186] = 0.900, [187] = 0.900, [188] = 0.900, [189] = 0.900, [190] = 0.900, [191] = 0.900, [192] = 0.900, [193] = 0.900, [194] = 0.900, [195] = 0.900, [196] = 0.900, [197] = 0.900, [198] = 0.900, [199] = 0.900, [200] = 0.900, [201] = 0.900, [202] = 0.900, [203] = 0.900, [204] = 0.900, [205] = 0.900, [206] = 0.900, [207] = 0.900, [208] = 0.900, [209] = 0.900, [210] = 0.900, [211] = 0.900, [212] = 0.900, [213] = 0.900, [214] = 0.900, [215] = 0.900, [216] = 0.900, [217] = 0.900, [218] = 0.900, [219] = 0.900, [220] = 0.900, [221] = 0.900, [222] = 0.900, [223] = 0.900, [224] = 0.900, [225] = 0.900, [226] = 0.900, [227] = 0.900, [228] = 0.900, [229] = 0.900, [230] = 0.900, [231] = 0.900, [232] = 0.900, [233] = 0.900, [234] = 0.900, [235] = 0.900, [236] = 0.900, [237] = 0.900, [238] = 0.900, [239] = 0.900, [240] = 0.900, [241] = 0.900, [242] = 0.900, [243] = 0.900, [244] = 0.900, [245] = 0.900, [246] = 0.900, [247] = 0.900, [248] = 0.900, [249] = 0.900, [250] = 0.900 }
b.highest_switch_values = { [0] = 0, [1] = 0.004, [2] = 0.004, [3] = 0.004, [4] = 0.004, [5] = 0.004, [6] = 0.004, [7] = 0.004, [8] = 0.004, [9] = 0.004, [10] = 0.004, [11] = 0.004, [12] = 0.004, [13] = 0.004, [14] = 0.004, [15] = 0.004, [16] = 0.004, [17] = 0.004, [18] = 0.004, [19] = 0.004, [20] = 0.008, [21] = 0.024, [22] = 0.024, [23] = 0.024, [24] = 0.024, [25] = 0.070, [26] = 0.070, [27] = 0.070, [28] = 0.090, [29] = 0.090, [30] = 0.090, [31] = 0.090, [32] = 0.090, [33] = 0.141, [34] = 0.141, [35] = 0.141, [36] = 0.141, [37] = 0.141, [38] = 0.141, [39] = 0.141, [40] = 0.141, [41] = 0.141, [42] = 0.141, [43] = 0.314, [44] = 0.314, [45] = 0.314, [46] = 0.314, [47] = 0.373, [48] = 0.373, [49] = 0.392, [50] = 0.400, [51] = 0.400, [52] = 0.400, [53] = 0.424, [54] = 0.424, [55] = 0.424, [56] = 0.447, [57] = 0.447, [58] = 0.447, [59] = 0.447, [60] = 0.478, [61] = 0.478, [62] = 0.494, [63] = 0.494, [64] = 0.494, [65] = 0.494, [66] = 0.494, [67] = 0.494, [68] = 0.541, [69] = 0.541, [70] = 0.565, [71] = 0.596, [72] = 0.604, [73] = 0.651, [74] = 0.651, [75] = 0.651, [76] = 0.651, [77] = 0.651, [78] = 0.651, [79] = 0.682, [80] = 0.835, [81] = 0.835, [82] = 0.835, [83] = 0.835, [84] = 0.835, [85] = 0.835, [86] = 0.835, [87] = 0.835, [88] = 0.835, [89] = 0.835, [90] = 0.827, [91] = 0.827, [92] = 0.827, [93] = 0.827, [94] = 0.969, [95] = 1.00, [96] = 1.00, [97] = 1.00, [98] = 1.00, [99] = 1.00, [100] = 1.00, [101] = 1.00, [102] = 1.00, [103] = 1.00, [104] = 1.00, [105] = 1.00, [106] = 1.00, [107] = 1.00, [108] = 1.00, [109] = 1.00, [110] = 1.00, [111] = 1.00, [112] = 1.00, [113] = 1.00, [114] = 1.00, [115] = 1.00, [116] = 1.00, [117] = 1.00, [118] = 1.00, [119] = 1.00, [120] = 1.00, [121] = 1.00, [122] = 1.00, [123] = 1.00, [124] = 1.00, [125] = 1.00, [126] = 1.00, [127] = 1.00, [128] = 1.00, [129] = 1, [130] = 1, [131] = 1, [132] = 1, [133] = 1, [134] = 1, [135] = 1, [136] = 1, [137] = 1, [138] = 1, [139] = 1, [140] = 1, [141] = 1, [142] = 1, [143] = 1, [144] = 1, [145] = 1, [146] = 1, [147] = 1, [148] = 1, [149] = 1, [150] = 1, [151] = 1, [152] = 1, [153] = 1, [154] = 1, [155] = 1, [156] = 1, [157] = 1, [158] = 1, [159] = 1, [160] = 1, [161] = 1, [162] = 1, [163] = 1, [164] = 1, [165] = 1, [166] = 1, [167] = 1, [168] = 1, [169] = 1, [170] = 1, [171] = 1, [172] = 1, [173] = 1, [174] = 1, [175] = 1, [176] = 1, [177] = 1, [178] = 1, [179] = 1, [180] = 1, [181] = 1, [182] = 1, [183] = 1, [184] = 1, [185] = 1, [186] = 1, [187] = 1, [188] = 1, [189] = 1, [190] = 1, [191] = 1, [192] = 1, [193] = 1, [194] = 1, [195] = 1, [196] = 1, [197] = 1, [198] = 1, [199] = 1, [200] = 1, [201] = 1, [202] = 1, [203] = 1, [204] = 1, [205] = 1, [206] = 1, [207] = 1, [208] = 1, [209] = 1, [210] = 1, [211] = 1, [212] = 1, [213] = 1, [214] = 1, [215] = 1, [216] = 1, [217] = 1, [218] = 1, [219] = 1, [220] = 1, [221] = 1, [222] = 1, [223] = 1, [224] = 1, [225] = 1, [226] = 1, [227] = 1, [228] = 1, [229] = 1, [230] = 1, [231] = 1, [232] = 1, [233] = 1, [234] = 1, [235] = 1, [236] = 1, [237] = 1, [238] = 1, [239] = 1, [240] = 1, [241] = 1, [242] = 1, [243] = 1, [244] = 1, [245] = 1, [246] = 1, [247] = 1, [248] = 1, [249] = 1, [250] = 1 }
b.value_change = {}
b.val_change_t = { s_table = {}, val_on_velocity = {}, last_values = 0, last_true = 0, repeats = {} }
function a.get_changed_val(ent, ak)
    local aA = { entity.get_prop(ent, "m_vecVelocity") }
    local velocity2d = math.abs(math.sqrt(aA[1] ^ 2 + aA[2] ^ 2))
    local aB = d.no_decimals(velocity2d)
    local aC = d.no_decimals(ak.m_flWeight * 1000)
    if velocity2d < 20 then
        return
    end ;
    b.value_change[ent] = b.value_change[ent] or b.val_change_t;
    b.value_change[ent].last_true = b.value_change[ent].last_true or -1;
    b.value_change[ent].last_values = b.value_change[ent].last_values or aC;
    if d.between(b.highest_weight[d.clamp(d.no_decimals(velocity2d), 0, 250)], b.highest_switch_values[d.clamp(d.no_decimals(velocity2d), 0, 250)]) then
        b.value_change[ent].repeats[aC] = b.value_change[ent].repeats[aC] or 0;
        if aC == b.value_change[ent].last_values then
            b.value_change[ent].repeats[aC] = b.value_change[ent].repeats[aC] + 1
        elseif b.value_change[ent].repeats[aC] <= 1 and not d.between(b.value_change[ent].last_values, aC - 150, aC + 150) and not d.between(aC, b.value_change[ent].last_true - 20, b.value_change[ent].last_true + 20) then
            b.value_change[ent].last_true = aC;
            return true
        else
            b.value_change[ent].repeats[aC] = 0
        end
    end ;
    b.value_change[ent].last_values = aC
end;
function a.anim_layer_control(ent, an)
    b.layer_control[ent] = b.layer_control[ent] or b.layer_control_table;
    local ak = e.get_animlayer(ent, an)
    if b.layer_control[ent].is_active == '' or 'basic' then
        if d.between(ak.m_flWeight, 0.50, 0.60) and d.between(b.animlayer[ent][an].m_flPrevWeight, 0.60, 0.69) or b.layer_control[ent].override then
            if not b.layer_control[ent].override then
                b.layer_control[ent].override = true;
                b.layer_control[ent].is_active = 'basic'
                b.layer_control[ent]['basic'].value = d.no_decimals(ak.m_flWeight * 10)
            end ;
            if d.no_decimals(ak.m_flWeight * 10) < b.layer_control[ent]['basic'].value - 1 or d.no_decimals(ak.m_flWeight * 10) > b.layer_control[ent]['basic'].value or b.layer_control[ent]['basic'].value < 1 then
                b.layer_control[ent].override = false;
                b.layer_control[ent]['basic'].value = 0;
                b.layer_control[ent].is_active = ''
            elseif d.no_decimals(ak.m_flWeight * 10) == b.layer_control[ent]['basic'].value then
            elseif d.no_decimals(ak.m_flWeight * 10) == b.layer_control[ent]['basic'].value - 1 then
                b.layer_control[ent]['basic'].value = b.layer_control[ent]['basic'].value - 1
            end
        end
    end ;
    if b.layer_control[ent].is_active == '' or 'onshot' then
        if b.layer_control[ent]['onshot'].shot_fired then
            if ak.m_flWeight == 0 and ak.m_flCycle == 0 and b.animlayer[ent][an].m_flPrevWeight == 0 and b.animlayer[ent][an].m_flPrevCycle == 0 and b.layer_control[ent].override then
                b.layer_control[ent].override = false;
                b.layer_control[ent].is_active = ''
                b.layer_control[ent]['onshot'].shot_fired = false;
                c.log('[Resolver] Layer control for ' .. entity.get_player_name(ent) .. ' \'on shot\' is no longer active ')
            elseif not b.layer_control[ent].override then
                b.layer_control[ent].override = true;
                b.layer_control[ent].is_active = 'onshot'
            end
        end
    end ;
    if b.layer_control[ent].is_active == '' or 'velocity' then
        if b.m_flPrevSlowingDown[ent] and d.between(velocity2d, 20, 100) then
            b.layer_control[ent].override = true;
            b.layer_control[ent].is_active = 'velocity'
        elseif b.layer_control[ent].override then
            b.layer_control[ent].override = false;
            b.layer_control[ent].is_active = ''
        end
    end
end;
function a.balance_adjust(ent)
    local ak = e.get_animlayer(ent, 3)
    if ak.m_flWeight == 1 and d.between(ak.m_flCycle, 0.0, 0.7) then
        return true
    end ;
    return false
end;
function a.anim_layer_switch(ent)
    if b.layer_control[ent].override then
        return false
    end ;
    local ao = e.animstate(ent)
    local ah = e.get_animlayer(ent, 3)
    local ai = e.get_animlayer(ent, 6)
    local ax = a.get_player_records(ent)
    local aD, aE = ax[1], ax[2]
    local aF = f.normalize_as_yaw(aD.m_flGoalFeetYaw - aE.m_flGoalFeetYaw)
    local aG = math.abs(aD.m_flEyeYaw) - math.abs(aE.m_flEyeYaw)
    local aH = math.abs(aD.m_flLowerBodyDelta) - math.abs(aE.m_flLowerBodyDelta)
    local aI = math.abs(aD.m_flCurrentFeetYaw) - math.abs(aE.m_flCurrentFeetYaw)
    if not ao.m_bInHitGroundAnimation and ao.m_flTimeSinceStoppedMoving > 0.2 and (ax[1].animlayer[6].m_flWeight == 0.003922 and ax[2].animlayer[6].m_flWeight == 0.003922 and ax[3].animlayer[6].m_flWeight == 0 and ax[4].animlayer[6].m_flWeight == 0 or ax[1].animlayer[6].m_flWeight == 0 and ax[2].animlayer[6].m_flWeight == 0 and ax[3].animlayer[6].m_flWeight > 0.001 and ax[4].animlayer[6].m_flWeight > 0.001 or ai.m_flWeight ~= 0 and math.floor(ai.m_flPlaybackRate * 1000000) ~= math.floor(ax[2].animlayer[6].m_flPlaybackRate * 1000000)) then
        return true
    elseif a.data[ent].props['m_flVelocity2D'] < 1.01 and (d.between(ah.m_flWeight, 0.42, 0.44) and d.between(b.animlayer[ent][3].m_flPrevWeight, 0.60, 0.66) or ah.m_flWeight == 0 and d.between(b.animlayer[ent][3].m_flPrevWeight, 0.30, 0.33) and ah.m_flCycle == 0.037 or a.get_changed_val(ent, ah) or ah.m_flWeight == 0 and ah.m_flCycle == 0 and (d.between(b.animlayer[ent][3].m_flPrevWeight, 0.043, 0.064) and d.between(b.animlayer[ent][3].m_flPrevCycle, 0.01, 0.05)) or ah.m_flWeight == 0 and ah.m_flCycle == 0 and (d.between(b.animlayer[ent][3].m_flPrevWeight, 0.30, 0.44) and d.between(b.animlayer[ent][3].m_flPrevCycle, 0.01, 0.05))) then
        return true
    elseif not ao.m_bInHitGroundAnimation and a.data[ent].props['m_flVelocity2D'] > 1.1 and (d.between(ai.m_flWeight, 0.42, 0.61) and d.between(b.animlayer[ent][6].m_flPrevWeight, 0.60, 0.66) or a.get_changed_val(ent, ai) or ai.m_flWeight == 0 and d.between(b.animlayer[ent][6].m_flPrevWeight, 0.30, 0.33) or d.between(ai.m_flWeight, 0.50, 0.60) and d.between(b.animlayer[ent][6].m_flPrevWeight, 0.28, 0.36) or ai.m_flWeight >= 0.94 and d.between(b.animlayer[ent][6].m_flPrevWeight, 0.90, 0.92) or b.animlayer[ent][6].m_flPrevWeight == 0 and d.between(b.animlayer[ent][6].m_flPrevCycle, 0.54, 0.87) and (d.between(ai.m_flWeight, 0.0037, 0.0042) and d.between(ai.m_flCycle, 0.43, 0.48)) or d.between(ai.m_flWeight, 0.0037, 0.0042) and ai.m_flCycle >= 0.43 and (b.animlayer[ent][6].m_flPrevWeight == 0 and d.between(b.animlayer[ent][6].m_flPrevCycle, 0.43, 0.48))) then
        return true
    else
        return false
    end
end;
b.resolver_yaw_pattern_count = {}
b.resolver_last_yaw_diff = {}
b.resolver_pattern_yaw = {}
function a.get_delta_size(ent)
    if b.layer_control[ent].override or not j.resolver_modules:IsEnabled('Animlayer Low Delta') then
        return
    end ;
    local ah, aJ = e.get_animlayer(ent, 3)
    local ai = e.get_animlayer(ent, 6)
    local ax = a.get_player_records(ent)
    local aD, aE = ax[1], ax[2]
    if(aD == nil or aE == nil) then
        return;
    end
    local aF = f.normalize_as_yaw(aD.m_flGoalFeetYaw - aE.m_flGoalFeetYaw)
    local aG = math.abs(aD.m_flEyeYaw) - math.abs(aE.m_flEyeYaw)
    local aH = math.abs(aD.m_flLowerBodyDelta) - math.abs(aE.m_flLowerBodyDelta)
    local aI = math.abs(aD.m_flCurrentFeetYaw) - math.abs(aE.m_flCurrentFeetYaw)
    b.resolver_pattern_yaw[ent] = b.resolver_pattern_yaw[ent] or 0;
    b.resolver_yaw_pattern_count[ent] = b.resolver_yaw_pattern_count[ent] or 0;
    b.resolver_last_yaw_diff[ent] = b.resolver_last_yaw_diff[ent] or 0;
    if math.abs(aF) > 0 and (aD.m_flVelocity2D[1] < 1.01 and aE.m_flVelocity2D[1] < 1.01) then
        local aK = a.data[ent]['animlayer']['eye_yaw'] and 1 or 3;
        if math.abs(aF) == b.resolver_last_yaw_diff[ent] then
            b.resolver_yaw_pattern_count[ent] = b.resolver_yaw_pattern_count[ent] + 1
        elseif b.resolver_yaw_pattern_count[ent] >= aK then
            b.resolver_pattern_yaw[ent] = math.abs(aF)
            b.resolver_yaw_pattern_count[ent] = 0
        else
            b.resolver_yaw_pattern_count[ent] = 0
        end ;
        b.resolver_last_yaw_diff[ent] = math.abs(aF)
    end ;
    if a.data[ent].props['m_flVelocity2D'] <= 1.01 then
        if not a.data[ent]['animlayer']['eye_yaw'] then
            if a.data[ent].props['highdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 60
            elseif d.between(ai.m_flCycle, 0.500090, 0.500100) and a.data[ent].props['lowdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 45;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using lower than 45� fake yaw desync.')
            elseif (d.between(ai.m_flCycle, 0.350050, 0.350150) and d.between(b.animlayer[ent][6].m_flPrefCycle, 0.500050, 0.591000) or d.between(ai.m_flCycle, 0.350050, 0.591000) and d.between(b.animlayer[ent][6].m_flPrefCycle, 0.350050, 0.350150) or d.between(b.resolver_pattern_yaw[ent], 10.78, 10.82)) and a.data[ent].props['lowdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 26;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using lower than 26� fake yaw desync.')
            elseif d.between(b.resolver_pattern_yaw[ent], 9.0, 9.4) and a.data[ent].props['lowdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 5;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using 5� fake yaw desync.')
            elseif (math.abs(a.data[ent].props['m_flGoalFeetDelta'], 40, 43) or math.abs(a.data[ent].props['m_flGoalFeetDelta'], 30, 35)) and a.data[ent].props['lowdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 45;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using lower than 55� fake yaw desync.')
            end
        elseif a.data[ent]['animlayer']['eye_yaw'] then
            if a.data[ent].props['highdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 60
            elseif d.between(ai.m_flCycle, 0.500090, 0.500100) and d.between(b.resolver_pattern_yaw[ent], 103.7, 103.8) and a.data[ent].props['lowdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 45;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using lower than 45� fake yaw desync.')
            elseif (d.between(ai.m_flCycle, 0.350050, 0.350150) and d.between(b.animlayer[ent][6].m_flPrefCycle, 0.500050, 0.591000) or d.between(ai.m_flCycle, 0.350050, 0.591000) and d.between(b.animlayer[ent][6].m_flPrefCycle, 0.350050, 0.350150)) and d.between(b.resolver_pattern_yaw[ent], 2.700, 2.999) and a.data[ent].props['lowdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 26;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using lower than 26� fake yaw desync.')
            elseif (math.abs(a.data[ent].props['m_flGoalFeetDelta'], 40, 43) or math.abs(a.data[ent].props['m_flGoalFeetDelta'], 30, 35) or d.between(b.resolver_pattern_yaw[ent], 103.7, 103.8)) and a.data[ent].props['lowdelta'] then
                a.data[ent]['animlayer']['fake_yaw'] = 45;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using lower than 55� fake yaw desync.')
            end
        end ;
        if ah.m_flWeightDeltaRate == 0 and ah.m_flWeight == 0 and (d.between(ah.m_flCycle, 0.00, 0.02) or d.between(ah.m_flCycle, 0.998, 1) or d.between(ah.m_flCycle, 0.5548, 0.5558)) then
            a.data[ent]['animlayer']['eye_yaw'] = true;
            a.data[ent]['animlayer']['is_desync'] = true;
            a.data[ent].antiaim['eye_yaw'] = true;
            c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', is using eye yaw desync')
            if d.between(ai.m_flWeight, 0.003, 0.020) and d.between(ai.m_flCycle, 0, 1) and ai.m_flPlaybackRate * 1000 > 0.000 or d.between(b.resolver_pattern_yaw[ent], 109.5, 109.8) then
                a.data[ent].props['highdelta'] = true;
                a.data[ent].props['lowdelta'] = false;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using 60� fake yaw desync.')
            elseif not a.balance_adjust(ent) and not d.between(ai.m_flWeight, 0.003, 0.004) and ai.m_flPlaybackRate * 1000 > 0.000 then
                a.data[ent].props['highdelta'] = false;
                a.data[ent].props['lowdelta'] = true;
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using lower than 60� fake yaw desync.')
            else
                a.data[ent].props['highdelta'] = false;
                a.data[ent].props['lowdelta'] = false
            end
        elseif a.data[ent]['animlayer']['eye_yaw'] then
            c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', is not using eye yaw desync')
            a.data[ent]['animlayer']['eye_yaw'] = false;
            a.data[ent].antiaim['eye_yaw'] = false
        end ;
        if (d.between(ah.m_flWeight, 0.042, 0.044) and d.between(ah.m_flCycle, 0.005, 0.020) or b.animlayer[ent][3].m_flPrevCycle > 0.92 and ah.m_flCycle > 0.92 and ah.m_flWeight == 0 and d.between(ah.m_flWeightDeltaRate, 2.68, 2.69) or d.between(b.resolver_pattern_yaw[ent], 108.0, 108.5)) and not a.data[ent]['animlayer']['eye_yaw'] then
            if not a.data[ent].props['lowdelta'] then
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using less than 60� fake yaw desync.')
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', extended desync detected.')
            end ;
            a.data[ent].antiaim['extended'] = true;
            a.data[ent].props['highdelta'] = false;
            a.data[ent].props['lowdelta'] = true;
            a.data[ent]['animlayer']['is_desync'] = true
        elseif ah.m_flWeight == 0 and ah.m_flCycle == 0 or (d.between(ai.m_flWeight, 0.0039, 0.004) or d.between(b.resolver_pattern_yaw[ent], 111.0, 111.6)) and (d.between(ah.m_flWeightDeltaRate, 2.68, 2.69) and not a.data[ent]['animlayer']['eye_yaw']) then
            if not a.data[ent].props['highdelta'] then
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', using 60� fake yaw desync.')
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', extended desync detected.')
            end ;
            a.data[ent].antiaim['extended'] = true;
            a.data[ent].props['highdelta'] = true;
            a.data[ent].props['lowdelta'] = false;
            a.data[ent]['animlayer']['is_desync'] = true
        elseif ah.m_flWeight == 0 and d.between(ah.m_flCycle, 0, 1) and ah.m_flWeightDeltaRate == 0 and not a.data[ent]['animlayer']['eye_yaw'] then
            if a.data[ent]['animlayer']['is_desync'] then
                c.log('[Resolver] Anim layer | ' .. entity.get_player_name(ent) .. ', no desync?')
            end ;
            a.data[ent].antiaim['extended'] = false;
            a.data[ent]['animlayer']['is_desync'] = false;
            a.data[ent].props['highdelta'] = false;
            a.data[ent].props['lowdelta'] = false
        elseif d.between(ah.m_flWeight, 0.042, 0.044) and d.between(ah.m_flCycle, 0.012, 0.013) and not a.data[ent]['animlayer']['eye_yaw'] then
            a.data[ent]['animlayer']['is_desync'] = true
        end
    end
end;
local function aL(aM)
    local aC = {}
    for a6, a7 in pairs(aM) do
        if type(a6) == "number" and type(a7) == "number" then
            aC[#aC + 1] = a7
        end
    end ;
    table.sort(aC)
    return aC[#aC]
end;
local function aN(ent)
    local ao = e.animstate(ent)
    local ah, aJ = e.get_animlayer(ent, 3)
    local ai = e.get_animlayer(ent, 6)
    local aO = e.get_animlayer(ent, 7)
    local aj, aJ = e.get_animlayer(ent, 12)
    local aP = a.data[ent].props['m_flVelocity2D'] / aj.m_flPlaybackRate / globals.tickinterval()
    local aQ = aP or -1.0;
    local aR = entity.get_prop(ent, "m_flPoseParameter", 7) or 0;
    local aS;
    if seq_dur <= 0.0 then
        aS = 10.0
    else
        aS = 1.0 / seq_dur
    end ;
    local aT = 1.0 / (1.0 / aS)
    local aU = aQ;
    if aQ == -1.0 then
    end ;
    if aU * aT <= 0.001 then
        aU = 0.001
    else
        aU = aU * aT
    end ;
    entity.set_prop(ent, "m_flPoseParameter", 7, aR)
    local aV = a.data[ent].props['m_flVelocity2D']
    local aW = (1.0 - ao.m_flStopToFullRunningFraction * 0.15) * aV / aU * aS;
    local aX = globals.tickinterval() * aW;
    return aX
end;
b.last_delta1 = {}
b.last_delta2 = {}
b.last_velocity = {}
b.last_velocity2 = {}
b.last_delta_t = {}
b.last_delta_t2 = {}
function a.animlayer_get_side(ent)
    if not j.resolver_modules:IsEnabled('Animlayer Side') then
        a.info[ent]['modules']['animlayer']['side'] = ''
        a.info[ent]['modules']['animlayer']['angle'] = 0;
        return
    end ;
    local ao = e.animstate(ent)
    local ah, aJ = e.get_animlayer(ent, 3)
    local ai = e.get_animlayer(ent, 6)
    local aO = e.get_animlayer(ent, 7)
    local aj, aJ = e.get_animlayer(ent, 12)
    local ap = math.abs(ao.m_iLastClientSideAnimationUpdateFramecount - globals.framecount())
    local a5 = ''
    local ax = a.get_player_records(ent)
    if not ax[#ax] then
        return
    end ;
    if(not ax[3]) then
        return
    end
    a.data[ent].old_body_yaw = a.data[ent].old_body_yaw or 0;
    a.data[ent].old_goalfeet = a.data[ent].old_goalfeet or 0;
    a.data[ent].old_lby = a.data[ent].old_lby or 0;
    a.data[ent].old_eye_yaw = a.data[ent].old_eye_yaw or a.data[ent].props['m_flEyeYaw']
    a.data[ent].old_cycle = a.data[ent].old_cycle or 0;
    a.data[ent].old_weight = a.data[ent].old_weight or 0;
    a.data[ent].old_playback_rate = a.data[ent].old_playback_rate or 0;
    a.data[ent].prev_goalfeet = a.data[ent].prev_goalfeet or 0;
    a.data[ent].prev_eye_yaw = a.data[ent].prev_eye_yaw or a.data[ent].props['m_flEyeYaw']
    local aY = a.data[ent].old_lby > 0 and true or false;
    local aZ = a.data[ent].props['m_flLowerBodyDelta'] > 0 and true or false;
    local a_ = aZ and aY and d.between(a.data[ent].old_lby, a.data[ent].props['m_flLowerBodyDelta'] - 2, a.data[ent].props['m_flLowerBodyDelta'] + 2) or (not aZ and not aY and d.between(math.abs(a.data[ent].old_lby), math.abs(a.data[ent].props['m_flLowerBodyDelta']) - 2, math.abs(a.data[ent].props['m_flLowerBodyDelta']) + 2) or false)
    local b0 = a.data[ent].prev_goalfeet > 0 and true or false;
    local b1 = a.data[ent].props['m_flGoalFeetDelta'] > 0 and true or false;
    local b2 = ax[3].m_flGoalFeetDelta > 0 and true or false;
    local b3 = ax[3].m_flGoalFeetDelta > 0 and true or false;
    local b4 = a.data[ent].prev_goalfeet;
    local b5 = a.data[ent].prev_eye_yaw or a.data[ent].props['m_flEyeYaw']
    a.data[ent].prev_eye_yaw = a.data[ent].prev_eye_yaw ~= a.data[ent].props['m_flEyeYaw'] and a.data[ent].props['m_flEyeYaw'] or a.data[ent].prev_eye_yaw;
    if a.data[ent].props['m_flVelocity2D'] < 1.1 then
        if ax[1].m_flEyeYaw == ax[3].m_flEyeYaw and ax[1].m_flEyeYaw == a.data[ent].props['m_flEyeYaw'] and (a.data[ent].old_goalfeet ~= a.data[ent].props['m_flGoalFeetDelta'] or a.data[ent].prev_goalfeet ~= a.data[ent].props['m_flGoalFeetDelta']) and not a_ then
            if a.info[ent]['modules']['animlayer']['side'] ~= 'left' then
                local b6 = false;
                if a.data[ent].props['m_flGoalFeetDelta'] > 0 and a.data[ent].prev_goalfeet > 0 or a.data[ent].props['m_flGoalFeetDelta'] < 0 and a.data[ent].prev_goalfeet < 0 then
                    if math.abs(a.data[ent].props['m_flGoalFeetDelta']) > math.abs(a.data[ent].prev_goalfeet) then
                        b6 = true
                    elseif math.abs(a.data[ent].props['m_flGoalFeetDelta']) < math.abs(a.data[ent].prev_goalfeet) then
                        b6 = false
                    end
                else
                    b6 = false
                end ;
                local b7 = ''
                if (d.between(ai.m_flCycle, 0.50001, 0.50013) or b6) and (ax[1].m_flGoalFeetDelta > ax[3].m_flGoalFeetDelta and (d.IsNumberNegative(ax[1].m_flGoalFeetDelta) and d.IsNumberNegative(ax[3].m_flGoalFeetDelta) or not d.IsNumberNegative(ax[1].m_flGoalFeetDelta) and not d.IsNumberNegative(ax[3].m_flGoalFeetDelta)) or a.data[ent].props['m_flLowerBodyDelta'] > 0 and a.data[ent].props['m_flGoalFeetDelta'] > 0 or math.abs(a.data[ent].props['m_flGoalFeetDelta']) > math.abs(ax[3].m_flGoalFeetDelta)) then
                    b7 = 'left'
                else
                    if not (ax[1].animlayer[6].m_flCycle < ax[2].animlayer[6].m_flCycle and ax[2].animlayer[6].m_flCycle < ax[3].animlayer[6].m_flCycle and ax[3].animlayer[6].m_flCycle < ax[4].animlayer[6].m_flCycle and ax[4].animlayer[6].m_flCycle < ax[5].animlayer[6].m_flCycle and ax[5].animlayer[6].m_flCycle < ax[6].animlayer[6].m_flCycle and ax[6].animlayer[6].m_flCycle < ax[7].animlayer[6].m_flCycle and ax[7].animlayer[6].m_flCycle < ax[8].animlayer[6].m_flCycle) and (d.between(b.animlayer[ent][6].m_flPrevCycle, 0.5900, 0.5903) and (d.between(ai.m_flCycle, 0.470100, 0.470220) or d.between(ai.m_flCycle, 0.250000, 0.250300))) or d.between(b.animlayer[ent][6].m_flPrevCycle, 0.430100, 0.430210) and d.between(ai.m_flCycle, 0.250000, 0.250300) or d.between(b.animlayer[ent][6].m_flPrevCycle, 0.250000, 0.250300) and d.between(ai.m_flCycle, 0.350000, 0.350170) or d.between(ai.m_flCycle, 0.250000, 0.250300) or d.between(b.animlayer[ent][6].m_flPrevCycle, 0.50001, 0.50013) and not (d.between(b.animlayer[ent][6].m_flPrevCycle, 0.350000, 0.350170) and d.between(b.animlayer[ent][6].m_flPrevCycle, 0.5900, 0.5903)) and (d.between(ai.m_flCycle, 0.430100, 0.430210) or d.between(ai.m_flCycle, 0.470100, 0.470220)) then
                        b7 = 'left'
                    else
                        b7 = 'right'
                    end ;
                    if a.data[ent]['animlayer']['eye_yaw'] or d.between(ah.m_flWeight, 0.42, 0.44) and d.between(b.animlayer[ent][3].m_flPrevWeight, 0.60, 0.66) then
                        if d.between(b.resolver_pattern_yaw[ent], 109, 110) or d.between(ai.m_flPlaybackRate * 1000, 0.060, 0.065) or d.between(ai.m_flPlaybackRate * 1000, 0.0579, 0.0590) then
                            b7 = 'left'
                        else
                            b7 = 'right'
                        end
                    end
                end ;
                a.info[ent]['modules']['animlayer']['side'] = b7 == 'left' and 'left' or a.info[ent]['modules']['animlayer']['side']
                if b7 == 'left' then
                    a.data[ent].old_cycle = ai.m_flCycle;
                    a.data[ent].old_weight = ai.m_flWeight;
                    a.data[ent].old_playback_rate = ai.m_flPlaybackRate;
                    a.data[ent].old_body_yaw = m.GetPlayerBodyYaw(ent)
                    a.data[ent].old_lby = a.data[ent].props['m_flLowerBodyDelta']
                    a.data[ent].old_eye_yaw = a.data[ent].props['m_flEyeYaw']
                    a.data[ent].old_goalfeet = a.data[ent].props['m_flGoalFeetDelta']
                    a.data[ent].prev_eye_yaw = a.data[ent].props['m_flEyeYaw']
                    return
                end
            end ;
            if a.info[ent]['modules']['animlayer']['side'] ~= 'right' then
                local b6 = false;
                if a.data[ent].props['m_flGoalFeetDelta'] > 0 and a.data[ent].prev_goalfeet > 0 or a.data[ent].props['m_flGoalFeetDelta'] < 0 and a.data[ent].prev_goalfeet < 0 then
                    if math.abs(a.data[ent].props['m_flGoalFeetDelta']) < math.abs(a.data[ent].prev_goalfeet) then
                        b6 = true
                    elseif math.abs(a.data[ent].props['m_flGoalFeetDelta']) > math.abs(a.data[ent].prev_goalfeet) then
                        b6 = false
                    end
                else
                    b6 = false
                end ;
                local b7 = ''
                if (d.between(ai.m_flCycle, 0.50001, 0.50013) or b6) and (ax[1].m_flGoalFeetDelta < ax[3].m_flGoalFeetDelta and (d.IsNumberNegative(ax[1].m_flGoalFeetDelta) and d.IsNumberNegative(ax[3].m_flGoalFeetDelta) or not d.IsNumberNegative(ax[1].m_flGoalFeetDelta) and not d.IsNumberNegative(ax[3].m_flGoalFeetDelta)) or a.data[ent].props['m_flLowerBodyDelta'] < 0 and a.data[ent].props['m_flGoalFeetDelta'] < 0 or b6 or math.abs(a.data[ent].props['m_flGoalFeetDelta']) < math.abs(ax[3].m_flGoalFeetDelta)) then
                    b7 = 'right'
                else
                    if not (ax[1].animlayer[6].m_flCycle < ax[2].animlayer[6].m_flCycle and ax[2].animlayer[6].m_flCycle < ax[3].animlayer[6].m_flCycle and ax[3].animlayer[6].m_flCycle < ax[4].animlayer[6].m_flCycle and ax[4].animlayer[6].m_flCycle < ax[5].animlayer[6].m_flCycle and ax[5].animlayer[6].m_flCycle < ax[6].animlayer[6].m_flCycle and ax[6].animlayer[6].m_flCycle < ax[7].animlayer[6].m_flCycle and ax[7].animlayer[6].m_flCycle < ax[8].animlayer[6].m_flCycle) and (not (d.between(b.animlayer[ent][6].m_flPrevCycle, 0.50001, 0.50013) and d.between(b.animlayer[ent][6].m_flPrevCycle, 0.350000, 0.350170) and d.between(b.animlayer[ent][6].m_flPrevCycle, 0.5900, 0.5903)) and (d.between(ai.m_flCycle, 0.430100, 0.430210) or d.between(ai.m_flCycle, 0.470100, 0.470220))) or d.between(b.animlayer[ent][6].m_flPrevCycle, 0.250000, 0.250300) and d.between(ai.m_flCycle, 0.5900, 0.5903) or d.between(b.animlayer[ent][6].m_flPrevCycle, 0.350000, 0.350170) and d.between(ai.m_flCycle, 0.250000, 0.250300) or d.between(b.animlayer[ent][6].m_flPrevCycle, 0.50001, 0.50013) and not (d.between(b.animlayer[ent][6].m_flPrevCycle, 0.430100, 0.430210) and d.between(b.animlayer[ent][6].m_flPrevCycle, 0.470100, 0.470220)) and (d.between(ai.m_flCycle, 0.350000, 0.350170) or d.between(ai.m_flCycle, 0.5900, 0.5903)) then
                        b7 = 'right'
                    else
                        b7 = 'left'
                    end ;
                    if a.data[ent]['animlayer']['eye_yaw'] or d.between(ah.m_flWeight, 0.42, 0.44) and d.between(b.animlayer[ent][3].m_flPrevWeight, 0.60, 0.66) then
                        if d.between(b.resolver_pattern_yaw[ent], 103, 104) or d.between(ai.m_flPlaybackRate * 1000, 0.0539, 0.0550) or d.between(ai.m_flPlaybackRate * 1000, 0.0649, 0.0660) then
                            b7 = 'right'
                        else
                            b7 = 'left'
                        end
                    end
                end ;
                a.info[ent]['modules']['animlayer']['side'] = b7 == 'right' and 'right' or a.info[ent]['modules']['animlayer']['side']
                if b7 == 'right' then
                    a.data[ent].old_cycle = ai.m_flCycle;
                    a.data[ent].old_weight = ai.m_flWeight;
                    a.data[ent].old_playback_rate = ai.m_flPlaybackRate;
                    a.data[ent].old_body_yaw = m.GetPlayerBodyYaw(ent)
                    a.data[ent].old_lby = a.data[ent].props['m_flLowerBodyDelta']
                    a.data[ent].old_eye_yaw = a.data[ent].props['m_flEyeYaw']
                    a.data[ent].old_goalfeet = a.data[ent].props['m_flGoalFeetDelta']
                    a.data[ent].prev_eye_yaw = a.data[ent].props['m_flEyeYaw']
                    return
                end
            end
        end
    end
end;
function a.lby_controller(ent)
    local b8 = globals.curtime()
    local an = e.get_animlayer(ent, 3)
    if an.m_pOwner ~= nil then
        if a.data[ent].props['m_flChokedPackets'] == 0 then
            a.data[ent].lby_can_update = e.on_ground(ent) and a.data[ent].props['m_flVelocity2D'] <= 1.0
        end ;
        if not a.data[ent].lby_can_update then
            a.data[ent].lby_next_think = b8 + 0.22
        elseif a.balance_adjust(ent) then
            if an.m_flWeight >= 0.0 and an.m_flCycle <= 0.070000 then
                if a.data[ent].lby_next_think < b8 then
                    a.data[ent].lby_next_think = b8 + 1.1
                end
            elseif an.m_flWeight == 0 and an.m_flCycle <= 0.070000 then
                a.data[ent].lby_can_update = false
            end
        end
    end
end;
function a.lowerbody(ent)
    if not j.resolver_modules:IsEnabled('Lby') then
        a.info[ent]['modules']['lby']['side'] = ''
        a.info[ent]['modules']['lby']['angle'] = 0;
        return
    end ;
    local b9, ba = 'right', 'left'
    local ak, aJ = e.get_animlayer(ent, 3)
    if a.data[ent].props['m_flVelocity2D'] == 0 and aJ == 979 then
        a.data[ent].props['m_flLowerBodyYawSequenceAct'] = a.data[ent].props['m_flLowerBodyDelta']
        if d.between(a.data[ent].props['m_flLowerBodyYawSequenceAct'], -30, 30) then
            a.info[ent]['modules']['lby']['side'] = a.info[ent]['modules']['lby']['side'] or ''
        else
            a.info[ent]['modules']['lby']['side'] = a.data[ent].props['m_flLowerBodyYawSequenceAct'] > 0 and ba or b9
        end
    end
end;
function a.max_wep_speed(ent)
    local bb = entity.get_prop(ent, "m_hActiveWeapon")
    if bb ~= nil then
        local bc = entity.get_prop(bb, "m_iItemDefinitionIndex")
        if bc ~= nil then
            bc = bit.band(bc, 0xFFFF)
            local maxspeed = maxspeed or 250;
            if i[bc] == nil then
                return
            end ;
            if i[bc].name == 'Knife' then
                maxspeed = 250
            else
                maxspeed = i[bc].max_speed
            end ;
            local bd = i[bc].console_name;
            local be = entity.get_prop(ent, "m_bIsScoped") == 1;
            if bd == "weapon_scar20" or bd == "weapon_g3sg1" then
                if be then
                    maxspeed = maxspeed - 95
                end
            else
                if bd == "weapon_awp" then
                    if be then
                        maxspeed = maxspeed - 100
                    end
                end
            end ;
            maxspeed = maxspeed / 100 * 33;
            return maxspeed
        end
    end
end;
a.lp_is_slowwalking = false;
function a.is_slow_walking(ent)
    local bf = a.max_wep_speed(ent) or 250;
    local bg, bh = entity.get_prop(ent, 'm_vecVelocity')
    local bi = math.floor(math.min(10000, math.sqrt(bg * bg + bh * bh) + 0.5))
    if math.abs(bi) >= 1 and math.abs(math.abs(bi) - bf) < 34 then
        if ent == p then
            if not a.lp_is_slowwalking then
                client.delay_call(1, function()
                    local bf = a.max_wep_speed(p) or 250;
                    local bg, bh = entity.get_prop(p, 'm_vecVelocity')
                    local bi = math.floor(math.min(10000, math.sqrt(bg * bg + bh * bh) + 0.5))
                    if math.abs(bi) > 0 and math.abs(math.abs(bi) - bf) < 34 then
                        a.lp_is_slowwalking = true
                    end
                end)
            else
                a.lp_is_slowwalking = true
            end
        else
            if not a.data[ent].props['is_slowwalking'] then
                client.delay_call(0.5, function()
                    if entity.is_alive(ent) then
                        local bf = a.max_wep_speed(ent) or 250;
                        local bg, bh = entity.get_prop(ent, 'm_vecVelocity')
                        local bi = math.floor(math.min(10000, math.sqrt(bg * bg + bh * bh) + 0.5))
                        if math.abs(bi) > 0 and math.abs(math.abs(bi) - bf) < 34 then
                            if a.data[ent] ~= nil then
                                a.data[ent].props['is_slowwalking'] = true
                            end
                        elseif a.data[ent] ~= nil then
                            a.data[ent].props['is_slowwalking'] = false;
                            a.data[ent]['animlayer']['switch_count'] = 0;
                            a.data[ent]['animlayer']['switch_state'] = false;
                            a.data[ent]['animlayer']['switched'] = false
                        end
                    end
                end)
            else
                a.data[ent].props['is_slowwalking'] = true
            end
        end
    elseif a.data[ent].props['is_slowwalking'] and entity.is_alive(ent) then
        client.delay_call(1, function()
            if ent == nil and p == nil then
                return
            end ;
            if not entity.is_alive(ent) or a.data[ent] == nil then
                return
            end ;
            if ent == p then
                a.lp_is_slowwalking = false
            elseif a.data[ent].props['m_flVelocity2D'] < 30 then
                a.data[ent].props['is_slowwalking'] = false
            end
        end)
    end
end;
function a.IsBreakingLBY(ent)
    local bj = entity.get_prop(ent, "m_flPoseParameter", 11) or 0;
    return math.abs(bj - 0.5) > 0.302
end;
function a.condition(ent)
    if not j.resolver_modules:IsEnabled('Condition') then
        a.data[ent].force_zero = false;
        return
    end ;
    local bg, bh = entity.get_prop(ent, 'm_vecVelocity')
    local bi = math.floor(math.min(10000, math.sqrt(bg * bg + bh * bh) + 0.5))
    local bf = a.max_wep_speed(ent) or 250;
    if a.info[ent]['low_delta']['active'] then
        if a.data[ent].props['is_slowwalking'] then
            a.data[ent]['condition_active'] = true;
            a.data[ent].force_zero = true;
            c.log('[Resolver] Condition forced ' .. entity.get_player_name(ent) .. '\'s yaw to 0. Slowwalking')
        elseif math.abs(bi) > 200 and not a.data[ent].props['highdelta'] then
            a.data[ent]['condition_active'] = true;
            a.data[ent].force_zero = true;
            c.log('[Resolver] Condition forced ' .. entity.get_player_name(ent) .. '\'s yaw to 0. Velocity > 200')
        end
    elseif a.data[ent].force_zero then
        a.data[ent]['condition_active'] = false;
        a.data[ent].force_zero = false
    end ;
    if j.resolver_modules:IsEnabled('Condition') then
        local bk = d.clamp(f.GetMaxFeetYaw(ent), 0, a.info[ent].fake_limit)
        local bg, bh = entity.get_prop(ent, 'm_vecVelocity')
        local bi = math.floor(math.min(10000, math.sqrt(bg * bg + bh * bh) + 0.5))
        local bf = a.max_wep_speed(ent) or 250;
        if math.abs(bi) > 180 then
            a.data[ent]['slowwalk_limit'] = true;
            a.data[ent]['condition_active'] = true;
            a.data[ent]['condition_yaw_store'] = a.info[ent].fake_limit;
            a.info[ent].fake_limit = bk
        elseif a.data[ent]['condition_active'] then
            a.info[ent].fake_limit = a.data[ent]['condition_yaw_store']
            a.data[ent]['slowwalk_limit'] = false;
            a.data[ent]['condition_active'] = false
        end
    end
end;
b.crouched_ticks = {}
b.storedTick = 0;
function a.fakeduck_detection(ent)
    local bl = entity.get_prop(ent, "m_flDuckAmount")
    local bm = entity.get_prop(ent, "m_flDuckSpeed")
    local bn = entity.get_prop(ent, "m_fFlags")
    local bo = j.resolver_fakeduck_ticks:GetValue()
    if b.crouched_ticks[ent] == nil then
        b.crouched_ticks[ent] = 0
    end ;
    if bm ~= nil and bl ~= nil then
        if bm == 8 and bl <= 0.9 and bl > 0.01 and d.toBits(bn)[1] == 1 then
            if b.storedTick ~= globals.tickcount() then
                b.crouched_ticks[ent] = b.crouched_ticks[ent] + 1;
                b.storedTick = globals.tickcount()
            end ;
            if b.crouched_ticks[ent] >= bo and a.data[ent].props['is_fakeduck'] ~= true then
                a.data[ent].props['m_flLowerBodyFakeDuck'] = a.data[ent].props['m_flLowerBodyDelta']
                a.data[ent].props['is_fakeduck'] = true;
                c.log('[Resolver] Player: "' .. entity.get_player_name(ent) .. '"' .. ' is fake ducking')
            end
        elseif a.data[ent].props['is_fakeduck'] then
            a.data[ent].props['is_fakeduck'] = false;
            b.crouched_ticks[ent] = 0;
            c.log('[Resolver] Player: "' .. entity.get_player_name(ent) .. '"' .. ' stopped fake ducking')
        end
    end
end;
function a.ResolverToggle()
    if not j.resolver_toggle:IsKeyToggle() and j.resolver_toggle:IsKeyDown() then
        ui.set(b.ref.rage.resolver_ref, false)
        a.force_off = true;
        a.OffResolverAll()
    elseif j.resolver_toggle:IsKeyReleased() and j.resolver_toggle:IsKeyDown() then
        ui.set(b.ref.rage.resolver_ref, true)
        a.force_off = false
    end
end;
function a.onshot_shutdown()
    if not j.resolver_modules:IsEnabled('On Shot') then
        return
    end ;
    local F = entity.get_players(true)
    if not F then
        return
    end ;
    for y = 1, #F do
        local ent = F[y]
        m.SetForceBodyYawCheckbox(ent, false)
        m.SetPlayerBodyYaw(ent, 0)
    end
end;
function a.get_side(ent)
    local bp = o(client.eye_position())
    local bq = 1;
    local br = false;
    local bs = bp:angle_to(l.eye_position(ent))[2]
    local bt, bu = 0, 0;
    local bv, bw = 0, 0;
    for y = -90, 90, 30 do
        if y == 0 then
            return
        end ;
        local bx, by, bz = l.angle_vector(0, bs + y, 0)
        bx, by, bz = l.multiplyvalues(bx, by, bz, 60)
        local bA, bB = renderer.world_to_screen(bp.x, bp.y, bp.z)
        local bC, bD = renderer.world_to_screen(bx, by, bz)
        renderer.line(bA, bB, bC, bD, 15, 150, 90, 170)
        local bE = client.trace_line(ent, bp.x, bp.y, bp.z, bp.x + bx, bp.y + by, bp.z + bz)
        if y > 0 then
            bt = bt + bE;
            bv = bv + 1
        else
            bu = bu + bE;
            bw = bw + 1
        end
    end ;
    local bF, bG = bt / bv, bu / bw;
    if bF < bG then
        return 1
    end ;
    return 2
end;
b.resolver = { dmg_pos = {}, get_dmg_pos = {} }
function a.render_best_damage(ent)
    if not j.resolver_modules:IsEnabled('Damage') or not c.debug.draw['dmg_trace'] or b.resolver.dmg_pos == nil then
        return
    end ;
    a.get_side(ent)
    b.resolver.dmg_pos['l'] = b.resolver.dmg_pos['l'] or { 0, 0, 0 }
    b.resolver.dmg_pos['r'] = b.resolver.dmg_pos['r'] or { 0, 0, 0 }
    b.resolver.dmg_pos['dmg_l'] = b.resolver.dmg_pos['dmg_l'] or 0;
    b.resolver.dmg_pos['dmg_r'] = b.resolver.dmg_pos['dmg_r'] or 0;
    local bH, bI, bJ = b.resolver.dmg_pos['l'][1], b.resolver.dmg_pos['l'][2], b.resolver.dmg_pos['l'][3]
    local bK, bL, bM = b.resolver.dmg_pos['r'][1], b.resolver.dmg_pos['r'][2], b.resolver.dmg_pos['r'][3]
    bH = bH or 0;
    bI = bI or 0;
    bJ = bJ or 0;
    bK = bK or 0;
    bL = bL or 0;
    bM = bM or 0;
    local bN, bO, bP = {}, {}, {}
    bN[0], bO[0], bP[0] = entity.hitbox_position(ent, 0)
    bN[0], bO[0], bP[0] = e.ExtrapolatePosition(bN[0], bO[0], bP[0], j.resolver_predict_local_ticks:GetValue(), ent)
    bN[1], bO[1], bP[1] = bN[0] + 40, bO[0], bP[0]
    bN[2], bO[2], bP[2] = bN[0], bO[0] + 40, bP[0]
    bN[3], bO[3], bP[3] = bN[0] - 40, bO[0], bP[0]
    bN[4], bO[4], bP[4] = bN[0], bO[0] - 40, bP[0]
    bN[5], bO[5], bP[5] = bN[0], bO[0], bP[0] + 40;
    bN[6], bO[6], bP[6] = bN[0], bO[0], bP[0] - 40;
    for bQ = 0, 6 do
        bN[bQ] = bN[bQ] or 0;
        bO[bQ] = bO[bQ] or 0;
        bP[bQ] = bP[bQ] or 0;
        local bA, bB = renderer.world_to_screen(bN[bQ], bO[bQ], bP[bQ])
        local bR, bS = renderer.world_to_screen(bH, bI, bJ)
        local bT, bU = renderer.world_to_screen(bK, bL, bM)
        bT = bT or 0;
        bR = bR or 0;
        bU = bU or 0;
        bS = bS or 0;
        renderer.line(bA, bB, bR, bS, 220, 15, 90, 150)
        renderer.line(bA, bB, bT, bU, 180, 150, 90, 150)
        renderer.text(bT, bU, 255, 100, 0, 255, 'c', 0, 'dmg r: ' .. b.resolver.dmg_pos['dmg_r'])
        renderer.text(bR, bS, 255, 100, 0, 255, 'c', 0, 'dmg l: ' .. b.resolver.dmg_pos['dmg_l'])
    end
end;
b.resolver = { dmg_pos2 = {}, get_dmg_pos = {} }
function a.render_best_damage2(ent)
    if not j.resolver_modules:IsEnabled('Damage2') or not c.debug.draw['dmg_trace'] or b.resolver.dmg_pos2 == nil then
        return
    end ;
    a.get_side(ent)
    b.resolver.dmg_pos2['l'] = b.resolver.dmg_pos2['l'] or { 0, 0, 0 }
    b.resolver.dmg_pos2['r'] = b.resolver.dmg_pos2['r'] or { 0, 0, 0 }
    b.resolver.dmg_pos2['dmg_l'] = b.resolver.dmg_pos2['dmg_l'] or 0;
    b.resolver.dmg_pos2['dmg_r'] = b.resolver.dmg_pos2['dmg_r'] or 0;
    local bH, bI, bJ = b.resolver.dmg_pos2['l'][1], b.resolver.dmg_pos2['l'][2], b.resolver.dmg_pos2['l'][3]
    local bK, bL, bM = b.resolver.dmg_pos2['r'][1], b.resolver.dmg_pos2['r'][2], b.resolver.dmg_pos2['r'][3]
    bH = bH or 0;
    bI = bI or 0;
    bJ = bJ or 0;
    bK = bK or 0;
    bL = bL or 0;
    bM = bM or 0;
    if j.resolver_predict_local_ticks == nil then
        return
    end ;
    local bN, bO, bP = {}, {}, {}
    bN[0], bO[0], bP[0] = entity.hitbox_position(ent, 0)
    bN[0], bO[0], bP[0] = e.ExtrapolatePosition(bN[0], bO[0], bP[0], j.resolver_predict_local_ticks:GetValue(), ent)
    bN[1], bO[1], bP[1] = bN[0] + 40, bO[0], bP[0]
    bN[2], bO[2], bP[2] = bN[0], bO[0] + 40, bP[0]
    bN[3], bO[3], bP[3] = bN[0] - 40, bO[0], bP[0]
    bN[4], bO[4], bP[4] = bN[0], bO[0] - 40, bP[0]
    bN[5], bO[5], bP[5] = bN[0], bO[0], bP[0] + 40;
    bN[6], bO[6], bP[6] = bN[0], bO[0], bP[0] - 40;
    for bQ = 0, 6 do
        bN[bQ] = bN[bQ] or 0;
        bO[bQ] = bO[bQ] or 0;
        bP[bQ] = bP[bQ] or 0;
        local bA, bB = renderer.world_to_screen(bN[bQ], bO[bQ], bP[bQ])
        local bR, bS = renderer.world_to_screen(bH, bI, bJ)
        local bT, bU = renderer.world_to_screen(bK, bL, bM)
        bT = bT or 0;
        bR = bR or 0;
        bU = bU or 0;
        bS = bS or 0;
        renderer.line(bA, bB, bR, bS, 220, 15, 90, 150)
        renderer.line(bA, bB, bT, bU, 180, 150, 90, 150)
        renderer.text(bT, bU + 15, 255, 100, 0, 255, 'c', 0, 'dmg2 r: ' .. b.resolver.dmg_pos2['dmg_r'])
        renderer.text(bR, bS + 15, 255, 100, 0, 255, 'c', 0, 'dmg2 l: ' .. b.resolver.dmg_pos2['dmg_l'])
    end
end;
b.resolver = { frac_pos = {}, get_frac_pos = {} }
function a.render_best_fraction(ent)
    if not j.resolver_modules:IsEnabled('Fraction') or not c.debug.draw['dmg_trace'] or b.resolver.frac_pos == nil then
        return
    end ;
    a.get_side(ent)
    b.resolver.frac_pos['l'] = b.resolver.frac_pos['l'] or { 0, 0, 0 }
    b.resolver.frac_pos['r'] = b.resolver.frac_pos['r'] or { 0, 0, 0 }
    b.resolver.frac_pos['frac_l'] = b.resolver.frac_pos['frac_l'] or 0;
    b.resolver.frac_pos['frac_r'] = b.resolver.frac_pos['frac_r'] or 0;
    local bH, bI, bJ = b.resolver.frac_pos['l'][1], b.resolver.frac_pos['l'][2], b.resolver.frac_pos['l'][3]
    local bK, bL, bM = b.resolver.frac_pos['r'][1], b.resolver.frac_pos['r'][2], b.resolver.frac_pos['r'][3]
    bH = bH or 0;
    bI = bI or 0;
    bJ = bJ or 0;
    bK = bK or 0;
    bL = bL or 0;
    bM = bM or 0;
    local bN, bO, bP = {}, {}, {}
    bN[0], bO[0], bP[0] = entity.hitbox_position(ent, 0)
    bN[1], bO[1], bP[1] = bN[0] + 40, bO[0], bP[0]
    bN[2], bO[2], bP[2] = bN[0], bO[0] + 40, bP[0]
    bN[3], bO[3], bP[3] = bN[0] - 40, bO[0], bP[0]
    bN[4], bO[4], bP[4] = bN[0], bO[0] - 40, bP[0]
    bN[5], bO[5], bP[5] = bN[0], bO[0], bP[0] + 40;
    bN[6], bO[6], bP[6] = bN[0], bO[0], bP[0] - 40;
    for bQ = 0, 6 do
        bN[bQ] = bN[bQ] or 0;
        bO[bQ] = bO[bQ] or 0;
        bP[bQ] = bP[bQ] or 0;
        local bA, bB = renderer.world_to_screen(bN[bQ], bO[bQ], bP[bQ])
        local bR, bS = renderer.world_to_screen(bH, bI, bJ)
        local bT, bU = renderer.world_to_screen(bK, bL, bM)
        bT = bT or 0;
        bR = bR or 0;
        bU = bU or 0;
        bS = bS or 0;
        renderer.line(bA, bB, bR, bS, 90, 15, 150, 150)
        renderer.line(bA, bB, bT, bU, 15, 90, 90, 150)
        renderer.text(bT, bU + 30, 255, 100, 0, 255, 'c', 0, 'frac r: ' .. b.resolver.frac_pos['frac_r'])
        renderer.text(bR, bS + 30, 255, 100, 0, 255, 'c', 0, 'frac l: ' .. b.resolver.frac_pos['frac_l'])
    end
end;
b.resolver = { frac_pos2 = {}, get_frac_pos = {} }
function a.render_best_fraction2(ent)
    if not j.resolver_modules:IsEnabled('Fraction2') or not c.debug.draw['dmg_trace'] or b.resolver.frac_pos2 == nil then
        return
    end ;
    a.get_side(ent)
    b.resolver.frac_pos2['l'] = b.resolver.frac_pos2['l'] or { 0, 0, 0 }
    b.resolver.frac_pos2['r'] = b.resolver.frac_pos2['r'] or { 0, 0, 0 }
    b.resolver.frac_pos2['frac_l'] = b.resolver.frac_pos2['frac_l'] or 0;
    b.resolver.frac_pos2['frac_r'] = b.resolver.frac_pos2['frac_r'] or 0;
    local bH, bI, bJ = b.resolver.frac_pos2['l'][1], b.resolver.frac_pos2['l'][2], b.resolver.frac_pos2['l'][3]
    local bK, bL, bM = b.resolver.frac_pos2['r'][1], b.resolver.frac_pos2['r'][2], b.resolver.frac_pos2['r'][3]
    bH = bH or 0;
    bI = bI or 0;
    bJ = bJ or 0;
    bK = bK or 0;
    bL = bL or 0;
    bM = bM or 0;
    local bN, bO, bP = {}, {}, {}
    bN[0], bO[0], bP[0] = entity.hitbox_position(ent, 0)
    bN[1], bO[1], bP[1] = bN[0] + 40, bO[0], bP[0]
    bN[2], bO[2], bP[2] = bN[0], bO[0] + 40, bP[0]
    bN[3], bO[3], bP[3] = bN[0] - 40, bO[0], bP[0]
    bN[4], bO[4], bP[4] = bN[0], bO[0] - 40, bP[0]
    bN[5], bO[5], bP[5] = bN[0], bO[0], bP[0] + 40;
    bN[6], bO[6], bP[6] = bN[0], bO[0], bP[0] - 40;
    for bQ = 0, 6 do
        bN[bQ] = bN[bQ] or 0;
        bO[bQ] = bO[bQ] or 0;
        bP[bQ] = bP[bQ] or 0;
        local bA, bB = renderer.world_to_screen(bN[bQ], bO[bQ], bP[bQ])
        local bR, bS = renderer.world_to_screen(bH, bI, bJ)
        local bT, bU = renderer.world_to_screen(bK, bL, bM)
        bT = bT or 0;
        bR = bR or 0;
        bU = bU or 0;
        bS = bS or 0;
        renderer.line(bA, bB, bR, bS, 90, 15, 150, 150)
        renderer.line(bA, bB, bT, bU, 15, 90, 90, 150)
        renderer.text(bT, bU + 45, 255, 100, 0, 255, 'c', 0, 'frac2 r: ' .. b.resolver.frac_pos2['frac_r'])
        renderer.text(bR, bS + 45, 255, 100, 0, 255, 'c', 0, 'frac2 l: ' .. b.resolver.frac_pos2['frac_l'])
    end
end;
b.stored_bullet_trace = {}
b.stored_line_trace = {}
function a.render_test()
    if b.stored_bullet_trace == nil then
        return
    end ;
    for y, a7 in pairs(b.stored_bullet_trace) do
        if a7 == nil then
            return
        end ;
        local bV = a7[1]
        local bW = a7[2]
        local bX, bY = renderer.world_to_screen(bV.x, bV.y, bV.z)
        local bZ, b_ = renderer.world_to_screen(bW.x, bW.y, bW.z)
        if not bX then
            return
        end ;
        renderer.rectangle(bZ, b_, 15, 15, 255, 255, 255, 250)
        renderer.line(bX, bY, bZ, b_, 255, 0, 0, 250)
    end
end;
function a.render_test2(ent)
    if b.stored_line_trace[ent] == nil then
        return
    end ;
    for y = 1, #b.stored_line_trace[ent] do
        if b.stored_line_trace[ent][y] == nil then
            return
        end ;
        local bV = b.stored_line_trace[ent][y][1]
        local bW = b.stored_line_trace[ent][y][2]
        local bX, bY = renderer.world_to_screen(bV.x, bV.y, bV.z)
        local bZ, b_ = renderer.world_to_screen(bW.x, bW.y, bW.z)
        if not (bZ or bZ) then
            return
        end ;
        local w, c0, s, aM = unpack(b.stored_line_trace[ent][0][y])
        local a5 = { 'right', 'left', 'right 2', 'left 2', 'mid' }
        renderer.rectangle(bZ - 5, b_ - 5, 10, 10, 255, 255, 255, 100)
        renderer.line(bX, bY, bZ, b_, w, c0, s, aM)
    end
end;
function a.debug_drawings()
    if not c.debug.draw['dmg_trace'] then
        return
    end ;
    local F = entity.get_players(true)
    for y = 1, #F do
        local ent = F[y]
        if not entity.is_alive(ent) then
            return
        end ;
        a.render_best_damage(ent)
        a.render_best_damage2(ent)
        a.render_best_fraction(ent)
        a.render_test2(ent)
    end
end;
function a.set_position_body_yaw(ent, D)
    local c1 = e.get_side(ent)
    local b9, ba = 'right', 'left'
    if c1 == 'BACKWARDS' then
        b9, ba = 'left', 'right'
    elseif c1 == 'BACKWARDS_LEFT' then
        b9, ba = 'left', 'right'
    elseif c1 == 'BACKWARDS_RIGHT' then
        b9, ba = 'right', 'left'
    elseif c1 == 'LEFT' or 'FORWARD_LEFT' then
        b9, ba = 'right', 'left'
    elseif c1 == 'RIGHT' or 'FORWARD_RIGHT' then
        b9, ba = 'left', 'right'
    else
        b9, ba = 'right', 'left'
    end ;
    if D < 0 then
        a.info[ent]['modules']['position']['side'] = ba
    elseif D > 0 then
        a.info[ent]['modules']['position']['side'] = b9
    else
        a.info[ent]['modules']['position']['side'] = a.info[ent]['modules']['position']['side'] or ''
    end
end;
function a.get_weakest_hitbox(ent)
    local c2, c3, c4 = client.eye_position()
    local v, as, c5 = entity.get_origin(p)
    local c6 = 0;
    local c7 = nil;
    for y = 0, 4 do
        local c8, c9, ca = entity.hitbox_position(ent, y)
        local bE, cb = client.trace_line(ent, v, as, c4, c8, c9, ca)
        if bE < 1 then
            local cc, cd = client.trace_bullet(p, v, as, c4, c8, c9, ca)
            if cc ~= nil then
                ent_exists = true
            end ;
            if c6 < cd then
                c6 = cd;
                c7 = y
            end
        end
    end ;
    return c7
end;
b.stored_weakest_hitbox = {}
function a.logic_position(ent)
    if not j.resolver_modules:IsEnabled('Position') then
        return
    end ;
    b.stored_weakest_hitbox[ent] = b.stored_weakest_hitbox[ent] or 3;
    b.stored_weakest_hitbox[ent] = a.get_weakest_hitbox(ent) or b.stored_weakest_hitbox[ent]
    local c7 = o(entity.hitbox_position(ent, b.stored_weakest_hitbox[ent]))
    if not j.resolver_predict_ticks then
        return
    end ;
    local ce = j.resolver_predict_ticks:GetValue() or 1;
    local cf = o(func.ExtrapolatePosition(c7.x, c7.y, c7.z, ce, ent))
    if e.is_peeking_other(ent, ce, p) and ce >= 1 then
        c7 = cf
    end ;
    local cg = o(c7.x, c7.y, c7.z)
    local ch = o(entity.get_origin(p))
    local ci = ch.z + 36.7;
    local cj = f.calculate_angle(ch.x, ch.y, cg.x, cg.y)
    local ck = o(l.angle_vector(0, cj - 90))
    local cl = cg.x + ck.x * 55;
    local cm = cg.y + ck.y * 55;
    local cn = cg.z + 60;
    local co = o(l.angle_vector(0, cj - 90))
    local cp = cg.x + co.x * 25;
    local cq = cg.y + co.y * 25;
    local cr = cg.z + 60;
    local cs = o(l.angle_vector(0, cj + 90))
    local ct = cg.x + cs.x * 55;
    local cu = cg.y + cs.y * 55;
    local cv = cg.z + 60;
    local cw = o(l.angle_vector(0, cj + 90))
    local cx = cg.x + cw.x * 25;
    local cy = cg.y + cw.y * 25;
    local cz = cg.z + 60;
    local cA, cB = 0, a.info[ent].fake_limit;
    main_lean = main_lean or 0;
    local cC = { [1] = client.trace_line(p, ch.x, ch.y, ci, cl, cm, cg.z), [2] = client.trace_line(p, ch.x, ch.y, ci, ct, cu, cg.z), [3] = client.trace_line(p, ch.x, ch.y, ci, cp, cq, cg.z), [4] = client.trace_line(p, ch.x, ch.y, ci, cx, cy, cg.z), [5] = client.trace_line(p, ch.x, ch.y, ci, cg.z, cg.y, cg.z) }
    b.stored_line_trace[ent] = b.stored_line_trace[ent] or {}
    b.stored_line_trace[ent][1] = { o(ch.x, ch.y, ci), o(cl, cm, cg.z) }
    b.stored_line_trace[ent][2] = { o(ch.x, ch.y, ci), o(ct, cu, cg.z) }
    b.stored_line_trace[ent][3] = { o(ch.x, ch.y, ci), o(cp, cq, cg.z) }
    b.stored_line_trace[ent][4] = { o(ch.x, ch.y, ci), o(cx, cy, cg.z) }
    b.stored_line_trace[ent][5] = { o(ch.x, ch.y, ci), o(cg.x, cg.y, cg.z) }
    b.stored_line_trace[ent][0] = { [2] = { 0, 255, 0, 255 }, [4] = { 0, 200, 0, 255 }, [1] = { 255, 0, 0, 255 }, [3] = { 200, 0, 0, 255 }, [5] = { 255, 255, 255, 255 } }
    local cD = { 0, 0, 255, 255 }
    if cC[1] > cC[2] and cC[5] < 0.98 then
        b.stored_line_trace[ent][0][4] = cD;
        b.stored_line_trace[ent][0][2] = cD;
        main_lean = -cB;
        ref_yaw_val = main_lean;
        a.data[ent]['modules']['position']['angle'] = main_lean;
        a.set_position_body_yaw(ent, main_lean)
        return
    end ;
    if cC[1] < cC[2] and cC[5] < 0.98 then
        b.stored_line_trace[ent][0][3] = cD;
        b.stored_line_trace[ent][0][1] = cD;
        main_lean = cB;
        ref_yaw_val = main_lean;
        a.data[ent]['modules']['position']['angle'] = main_lean;
        a.set_position_body_yaw(ent, main_lean)
        return
    end ;
    if cC[4] > cC[3] and cC[5] < 0.98 then
        b.stored_line_trace[ent][0][3] = cD;
        b.stored_line_trace[ent][0][1] = cD;
        main_lean = cB;
        ref_yaw_val = main_lean;
        a.data[ent]['modules']['position']['angle'] = main_lean;
        a.set_position_body_yaw(ent, main_lean)
        return
    end ;
    if cC[1] > 0.98 and cC[5] < 0.98 then
        cA = -cB / 2;
        main_lean = -cB / 2;
        ref_yaw_val = main_lean;
        a.data[ent]['modules']['position']['angle'] = main_lean;
        return
    end ;
    if cC[4] > 0.98 and cC[5] < 0.98 then
        cA = cB / 2;
        main_lean = cB / 2;
        ref_yaw_val = main_lean;
        a.data[ent]['modules']['position']['angle'] = main_lean;
        a.set_position_body_yaw(ent, main_lean)
        return
    end ;
    if cC[5] > 0.98 then
        main_lean = 0;
        ref_yaw_val = main_lean;
        a.data[ent]['modules']['position']['angle'] = main_lean;
        a.set_position_body_yaw(ent, main_lean)
        return
    end
end;
function a.logic_simple(ent)
    if not j.resolver_modules:IsEnabled('Simple') then
        a.info[ent]['modules']['simple']['side'] = ''
        a.info[ent]['modules']['simple']['angle'] = 0;
        return
    end ;
    local b9, ba = 'left', 'right'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'right', 'left'
    end ;
    local bp = o(entity.get_origin(p))
    local cE = l.eye_position(ent)
    local cF = cE:angle_to(bp)[2]
    local cG = { left = 0, right = 0 }
    for y = cF - 90, cF + 90, 25 do
        if y ~= cF then
            local cH = math.rad(y)
            local cI = o(cE.x + 50 * math.cos(cH), cE.y + 50 * math.sin(cH), cE.z)
            local cJ = o(cE.x + 256 * math.cos(cH), cE.y + 256 * math.sin(cH), cE.z)
            local bE, cK, cL = cI:trace_line_impact(cJ, p)
            local a5 = y < cF and "left" or "right"
            cG[a5] = cG[a5] + bE
        end
    end ;
    if cG.left == cG.right then
        a.info[ent]['modules']['simple']['side'] = a.info[ent]['modules']['simple']['side'] or ''
    else
        a.info[ent]['modules']['simple']['side'] = cG.left < cG.right and ba or b9
    end
end;
function a.logic_damage(ent)
    if not j.resolver_modules:IsEnabled('Damage') then
        a.info[ent]['modules']['damage']['side'] = ''
        a.info[ent]['modules']['damage']['angle'] = 0;
        return
    end ;
    local b9, ba = 'right', 'left'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'left', 'right'
    end ;
    local cM = a.get_weakest_hitbox(ent)
    local cN = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
    local cO = o(entity.hitbox_position(ent, cM or 0))
    local c2, c3, c4 = client.eye_position()
    local ce = j.resolver_predict_enemy_ticks:GetValue()
    if e.is_peeking_other(ent, ce, p) and ce >= 1 then
        cO = o(e.ExtrapolatePosition(cO.x, cO.y, cO.z, ce, ent))
    end ;
    local cP = f.calculate_angle(cN.x, cN.y, cO.x, cO.y)
    local ck = o(l.angle_vector(0, cP + 90))
    local cl = cN.x + ck.x * 15;
    local cm = cN.y + ck.y * 15;
    local cn = cN.z + 30;
    local cs = o(l.angle_vector(0, cP - 90))
    local ct = cN.x + cs.x * 15;
    local cu = cN.y + cs.y * 15;
    local cv = cN.z + 30;
    local cQ = o(l.angle_vector(0, cP + 90))
    local cR = cN.x + cQ.x * 100;
    local cS = cN.y + cQ.y * 100;
    local cT = cN.z + 60;
    local cU = o(l.angle_vector(0, cP - 90))
    local cV = cN.x + cU.x * 100;
    local cW = cN.y + cU.y * 100;
    local cX = cN.z + 60;
    local cY, cZ = client.trace_line(ent, cN.x, cN.y, c4, cR, cS, cT)
    local c_, cZ = client.trace_line(ent, cN.x, cN.y, c4, cV, cW, cX)
    if cY < 0.9 or c_ < 0.9 then
        a.info[ent]['modules']['damage']['damage_left'] = e.best_damage(ent, cR, cS, cT)
        a.info[ent]['modules']['damage']['damage_right'] = e.best_damage(ent, cV, cW, cX)
        b.resolver.dmg_pos = { ['l'] = { ct, cu, cv }, ['r'] = { cl, cm, cn }, ['l2'] = { cV, cW, cX }, ['r2'] = { cR, cS, cT }, ['dmg_l'] = a.info[ent]['modules']['damage']['damage_left'], ['dmg_r'] = a.info[ent]['modules']['damage']['damage_right'] }
        if a.info[ent]['modules']['damage']['damage_left'] == a.info[ent]['modules']['damage']['damage_right'] then
            a.info[ent]['modules']['damage']['side'] = a.info[ent]['modules']['damage']['side'] or ''
        else
            a.info[ent]['modules']['damage']['side'] = a.info[ent]['modules']['damage']['damage_right'] > a.info[ent]['modules']['damage']['damage_left'] and b9 or ba
        end
    end
end;
function a.logic_damage2(ent)
    if not j.resolver_modules:IsEnabled('Damage2') then
        a.info[ent]['modules']['damage2']['side'] = ''
        a.info[ent]['modules']['damage2']['angle'] = 0;
        return
    end ;
    local b9, ba = 'left', 'right'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'right', 'left'
    end ;
    local cM = a.get_weakest_hitbox(ent)
    local d0 = o(entity.hitbox_position(ent, cM or 0))
    local ce = j.resolver_predict_enemy_ticks:GetValue()
    if e.is_peeking_other(ent, ce, p) and ce >= 1 then
        d0 = o(e.ExtrapolatePosition(d0.x, d0.y, d0.z, ce, ent))
    end ;
    local d1 = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
    local c2, c3, c4 = client.eye_position()
    local cP = f.calculate_angle(d1.x, d1.y, d0.x, d0.y)
    local cs = o(l.angle_vector(0, cP - 90, 0))
    local ck = o(l.angle_vector(0, cP + 90, 0))
    local d2 = d0.x + cs.x * 90;
    local d3 = d0.y + cs.y * 90;
    local d4 = d0.x + ck.x * 90;
    local d5 = d0.y + ck.y * 90;
    local cY, d6 = client.trace_line(ent, d1.x, d1.y, c4, d4, d5, d0.z)
    local c_, d6 = client.trace_line(ent, d1.x, d1.y, c4, d2, d3, d0.z)
    if cY < 1 or c_ < 1 then
        if d0.y ~= nil then
            leftent, a.info[ent]['modules']['damage2']['damage_left'] = client.trace_bullet(p, d1.x, d1.y, c4, d2, d3, d0.z)
            rightent, a.info[ent]['modules']['damage2']['damage_right'] = client.trace_bullet(p, d1.x, d1.y, c4, d4, d5, d0.z)
            b.resolver.dmg_pos2 = { ['l'] = { d2, d3, d0.z }, ['r'] = { d4, d5, d0.z }, ['dmg_l'] = a.info[ent]['modules']['damage2']['damage_left'], ['dmg_r'] = a.info[ent]['modules']['damage2']['damage_right'] }
            if a.info[ent]['modules']['damage2']['damage_left'] == a.info[ent]['modules']['damage2']['damage_right'] then
                a.info[ent]['modules']['damage2']['side'] = a.info[ent]['modules']['damage2']['side'] or ''
            else
                a.info[ent]['modules']['damage2']['side'] = a.info[ent]['modules']['damage2']['damage_right'] > a.info[ent]['modules']['damage2']['damage_left'] and b9 or ba
            end
        end
    end
end;
function a.logic_fraction(ent)
    if not j.resolver_modules:IsEnabled('Fraction') then
        a.info[ent]['modules']['fraction']['side'] = ''
        a.info[ent]['modules']['fraction']['angle'] = 0;
        return
    end ;
    local b9, ba = 'left', 'right'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'right', 'left'
    end ;
    local cN = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
    local cO = l.eye_position(ent)
    local ce = j.resolver_predict_enemy_ticks:GetValue()
    if e.is_peeking_other(ent, ce, p) and ce >= 1 then
        cO = o(e.ExtrapolatePosition(cO.x, cO.y, cO.z, ce, ent))
    end ;
    local cP = f.calculate_angle(cN.x, cN.y, cO.x, cO.y)
    local ck = o(l.angle_vector(0, cP + 90))
    local cl = cN.x + ck.x * 15;
    local cm = cN.y + ck.y * 15;
    local cn = cN.z + 40;
    local cs = o(l.angle_vector(0, cP - 90))
    local ct = cN.x + cs.x * 15;
    local cu = cN.y + cs.y * 15;
    local cv = cN.z + 40;
    local cQ = o(l.angle_vector(0, cP + 90))
    local cR = cN.x + cQ.x * 100;
    local cS = cN.y + cQ.y * 100;
    local cT = cN.z + 60;
    local cU = o(l.angle_vector(0, cP - 90))
    local cV = cN.x + cU.x * 100;
    local cW = cN.y + cU.y * 100;
    local cX = cN.z + 60;
    a.info[ent]['modules']['fraction']['fraction_left'] = e.best_fraction(ent, cl, cm, cn, j.resolver_predict_enemy_ticks:GetValue())
    a.info[ent]['modules']['fraction']['fraction_right'] = e.best_fraction(ent, ct, cu, cv, j.resolver_predict_enemy_ticks:GetValue())
    a.info[ent]['modules']['fraction']['fraction_left2'] = e.best_fraction(ent, cR, cS, cT, j.resolver_predict_enemy_ticks:GetValue())
    a.info[ent]['modules']['fraction']['fraction_right2'] = e.best_fraction(ent, cV, cW, cX, j.resolver_predict_enemy_ticks:GetValue())
    b.resolver.frac_pos = { ['l'] = { ct, cu, cv }, ['r'] = { cl, cm, cn }, ['l2'] = { cV, cW, cX }, ['r2'] = { cR, cS, cT }, ['frac_l'] = a.info[ent]['modules']['fraction']['fraction_left'], ['frac_r'] = a.info[ent]['modules']['fraction']['fraction_right'] }
    if a.info[ent]['modules']['fraction']['fraction_left'] >= 0.98 and a.info[ent]['modules']['fraction']['fraction_right'] >= 0.98 and (a.info[ent]['modules']['fraction']['fraction_left2'] >= 0.98 and a.info[ent]['modules']['fraction']['fraction_right2'] >= 0.98) then
        a.info[ent]['modules']['fraction']['side'] = a.info[ent]['modules']['fraction']['side'] or ''
    elseif a.info[ent]['modules']['fraction']['fraction_left'] == a.info[ent]['modules']['fraction']['fraction_right'] or a.info[ent]['modules']['fraction']['fraction_left'] < 0.49 and a.info[ent]['modules']['fraction']['fraction_right'] < 0.49 then
        a.info[ent]['modules']['fraction']['side'] = a.info[ent]['modules']['fraction']['side'] or ''
    else
        a.info[ent]['modules']['fraction']['side'] = (a.info[ent]['modules']['fraction']['fraction_left'] > a.info[ent]['modules']['fraction']['fraction_right'] or a.info[ent]['modules']['fraction']['fraction_left2'] > a.info[ent]['modules']['fraction']['fraction_right2']) and b9 or ba
    end
end;
function a.logic_fraction2(ent)
    if not j.resolver_modules:IsEnabled('Fraction2') then
        a.info[ent]['modules']['fraction2']['side'] = ''
        a.info[ent]['modules']['fraction2']['angle'] = 0;
        return
    end ;
    local b9, ba = 'left', 'right'
    local d7 = o(entity.hitbox_position(ent, 0))
    local d8 = o(client.eye_position()).z;
    local d9 = l.eye_position(ent)
    d9.z = d7.z;
    local d6, da = entity.get_prop(ent, "m_angEyeAngles")
    local db = f.normalize_angle(da - 60)
    d9.x = d9.x + math.cos(math.rad(db)) * 20;
    d9.y = d9.y + math.sin(math.rad(db)) * 12;
    local dc = o(entity.get_origin(p))
    local dd = o(entity.get_prop(p, "m_vecViewOffset"))
    dc = dc:__add(dd)
    local de = f.normalize_angle(db - 60)
    local df = f.normalize_angle(db - -60)
    local d2 = d9.x + math.cos(math.rad(de)) * 20;
    local d3 = d9.y + math.sin(math.rad(de)) * 15;
    local d4 = d9.x + math.cos(math.rad(df)) * 20;
    local d5 = d9.y + math.sin(math.rad(df)) * 15;
    local cY, d6 = client.trace_line(ent, dc.x, dc.y, d8, d4, d5, d9.z)
    local c_, d6 = client.trace_line(ent, dc.x, dc.y, d8, d2, d3, d9.z)
    if cY < 1 or c_ < 1 then
        local dg, dh = client.trace_bullet(p, dc.x, dc.y, dc.z, d2, d3, d9.z, true)
        local di, damage2 = client.trace_bullet(p, dc.x, dc.y, dc.z, d4, d5, d9.z, true)
        if dh > damage2 then
            a.info[ent]['modules']['fraction2']['side'] = ba
        elseif damage2 > dh then
            a.info[ent]['modules']['fraction2']['side'] = b9
        else
            a.info[ent]['modules']['fraction2']['side'] = a.info[ent]['modules']['fraction2']['side'] or ''
        end
    end
end;
function a.logic_predict(ent)
    if not j.resolver_modules:IsEnabled('Predict') then
        a.info[ent]['modules']['predict']['side'] = ''
        a.info[ent]['modules']['predict']['angle'] = 0;
        return
    end ;
    local b9, ba = 'left', 'right'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'right', 'left'
    end ;
    local dj = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
    local dk = nil;
    local dl = math.huge;
    local dm = o(client.eye_position())
    local lp_stored_eyepos = lp_stored_eyepos or {}
    local dn = 0;
    local cN = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
    local dp = o(client.camera_angles())
    local dq = l.eye_position(ent)
    local ce = j.resolver_predict_enemy_ticks:GetValue()
    if e.is_peeking_other(ent, ce, p) and ce >= 1 then
        dq = o(e.ExtrapolatePosition(dq.x, dq.y, dq.z, ce, ent))
    end ;
    local stored_eyepos = stored_eyepos or {}
    local dr = 0;
    local cj = f.calculate_angle(cN.x, cN.y, dq.x, dq.y)
    local cG = { left = 0, right = 0 }
    for y = cj - 90, cj + 90, 20 do
        local br = o(f.Angle_Vector(0, cj + y))
        local ds = o(dj.x + br.x * 55, dj.y + br.y * 55, dj.z + y)
        local bE, cZ = client.trace_line(ent, dj.x, dj.y, dm.z, ds.x, ds.y, ds.z)
        if bE < 1 then
            local d6, damage = client.trace_bullet(p, dj.x, dj.y, dm.z, ds.x, ds.y, ds.z + y, true)
            local index2, damage2 = client.trace_bullet(p, dq.x, dq.y, dq.z + 70, ds.x + 12, ds.y, ds.z, true)
            local index3, damage3 = client.trace_bullet(p, stored_eyepos.x or dq.x, stored_eyepos.y or dq.y, stored_eyepos.z or dq.z + 70, lp_stored_eyepos.x or ds.x - 12, lp_stored_eyepos.y or ds.y, lp_stored_eyepos.z or ds.z, true)
            if damage < dl then
                dl = damage;
                if damage2 > damage then
                    dl = damage2
                end ;
                if damage3 > damage then
                    dl = damage3
                end ;
                if dm.x - dq.x > 0 then
                    dk = y
                else
                    dk = y * -1
                end
            elseif damage == dl then
                if dk < 0 then
                    a.info[ent]['modules']['predict']['side'] = ba
                elseif dk > 0 then
                    a.info[ent]['modules']['predict']['side'] = b9
                else
                    a.info[ent]['modules']['predict']['side'] = a.info[ent]['modules']['predict']['side'] or ''
                end ;
                a.info[ent]['modules']['predict']['angle'] = dk
            end
        end
    end
end;
function a.logic_trace(ent)
    if not j.resolver_modules:IsEnabled('Trace') then
        a.info[ent]['modules']['trace']['side'] = ''
        a.info[ent]['modules']['trace']['angle'] = 0;
        return
    end ;
    local b9, ba = 'right', 'left'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'left', 'right'
    end ;
    local dk = nil;
    local dl = math.huge;
    local dm = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
    local dp = o(client.camera_angles())
    local dq = l.eye_position(ent)
    local ce = j.resolver_predict_enemy_ticks:GetValue()
    if e.is_peeking_other(ent, ce, p) and ce >= 1 then
        dq = o(e.ExtrapolatePosition(dq.x, dq.y, dq.z, ce, ent))
    end ;
    local stored_eyepos = stored_eyepos or {}
    local lp_stored_eyepos = lp_stored_eyepos or {}
    local cj = f.calculate_angle(dm.x, dm.y, dq.x, dq.y)
    local cG = { left = 0, right = 0 }
    for y = cj - 90, cj + 90, 20 do
        local dir_x, dir_y, dt = f.Angle_Vector(0, cj + y)
        local ds = o(dm.x + dir_x * 55, dm.y + dir_y * 55, dm.z + y)
        local index, damage = client.trace_bullet(p, dq.x, dq.y, dq.z + y, ds.x, ds.x, ds.z, true)
        local index2, damage2 = client.trace_bullet(p, dq.x, dq.y, dq.z + 70, ds.x + 12, ds.x, ds.z, true)
        local index3, damage3 = client.trace_bullet(p, stored_eyepos.x or dq.x, stored_eyepos.y or dq.y, stored_eyepos.z or dq.z + 70, lp_stored_eyepos.x or ds.x - 12, lp_stored_eyepos.y or ds.x, lp_stored_eyepos.z or ds.z, true)
        if damage < dl then
            dl = damage;
            if damage2 > damage then
                dl = damage2
            end ;
            if damage3 > damage then
                dl = damage3
            end ;
            if dm.x - dq.x > 0 then
                dk = y
            else
                dk = y * -1
            end
        elseif damage == dl then
            if dk < 0 then
                a.info[ent]['modules']['trace']['side'] = b9
            elseif dk > 0 then
                a.info[ent]['modules']['trace']['side'] = ba
            else
                a.info[ent]['modules']['trace']['side'] = a.info[ent]['modules']['trace']['side'] or ''
            end ;
            a.info[ent]['modules']['trace']['angle'] = dk
        end
    end
end;
a.dmg3_lowest = {}
function a.logic_trace2(ent)
    if not j.resolver_modules:IsEnabled('Trace2') then
        a.info[ent]['modules']['trace2']['side'] = ''
        a.info[ent]['modules']['trace2']['angle'] = 0;
        return
    end ;
    local b9, ba = 'left', 'right'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'right', 'left'
    end ;
    a.dmg3_lowest[ent] = a.dmg3_lowest[ent] or 2;
    local dj = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
    local du = o(entity.get_prop(ent, "m_vecOrigin"))
    local ce = j.resolver_predict_enemy_ticks:GetValue()
    if e.is_peeking_other(ent, ce, p) and ce >= 1 then
        du = o(e.ExtrapolatePosition(du.x, du.y, du.z, ce, ent))
    end ;
    local cj = f.CalcAngle(dj.x, dj.y, du.x, du.y)
    for y, a7 in pairs({ -60, 60 }) do
        dir_x, dir_y = math.cos(math.rad(cj + a7)), math.sin(math.rad(cj + a7)), 0;
        local ds = o(dj.x + dir_x * 55, dj.y + dir_y * 55, dj.z + 80)
        index, damage = client.trace_bullet(p, dj.x, dj.y, dj.z + 70, ds.x, ds.y, ds.z)
        index2, damage2 = client.trace_bullet(p, dj.x, dj.y, dj.z + 70, ds.x + 12, ds.y, ds.z)
        index3, damage3 = client.trace_bullet(p, dj.x, dj.y, dj.z + 70, ds.x - 12, ds.y, ds.z)
        if damage < a.dmg3_lowest[ent] then
            a.dmg3_lowest[ent] = a.dmg3_lowest[ent]
            if damage2 > damage then
                a.dmg3_lowest[ent] = damage2
            end ;
            if damage3 > damage then
                a.dmg3_lowest[ent] = damage3
            end ;
            if dj.x - du.x < 0 then
                a.info[ent]['modules']['trace2']['angle'] = a7
            else
                a.info[ent]['modules']['trace2']['angle'] = a7 * -1
            end ;
            a.info[ent]['modules']['trace2']['side'] = a.info[ent]['modules']['trace2']['angle'] < 0 and ba or b9
        elseif damage == a.dmg3_lowest[ent] then
            if a.info[ent]['modules']['trace2']['angle'] < 0 then
                a.info[ent]['modules']['trace2']['side'] = ba
            elseif a.info[ent]['modules']['trace2']['angle'] > 0 then
                a.info[ent]['modules']['trace2']['side'] = b9
            else
                a.info[ent]['modules']['trace2']['side'] = a.info[ent]['modules']['trace2']['side'] or ''
            end
        end
    end
end;
function a.logic_edge(ent)
    if not j.resolver_modules:IsEnabled('Edge') then
        return
    end ;
    local b9, ba = 'left', 'right'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'right', 'left'
    end ;
    local v, as, c5 = entity.hitbox_position(ent, 1)
    local cj = entity.get_prop(ent, 'm_angEyeAngles[1]')
    local cG = { left = 0, right = 0 }
    for y = cj - 90, cj + 90, 30 do
        local cH = math.rad(y)
        local G, H, I = v + 256 * math.cos(cH), as + 256 * math.sin(cH), c5;
        local bE = client.trace_line(ent, v, as, c5, G, H, I)
        a.data[ent].logic.fraction = bE;
        a.data[ent].lby_side = y < cj and b9 or ba;
        cG[a.data[ent].lby_side] = cG[a.data[ent].lby_side] + bE
    end ;
    a.data[ent].logic.edge_trace_right = cG.right;
    a.data[ent].logic.edge_trace_left = cG.left;
    if cG.right == cG.left then
        a.info[ent]['modules']['edge']['side'] = a.info[ent]['modules']['edge']['side'] or ''
    elseif cG.left < cG.right then
        a.info[ent]['modules']['edge']['side'] = b9
    elseif cG.left > cG.right then
        a.info[ent]['modules']['edge']['side'] = ba
    end
end;
function a.logic_edge2(ent)
    if not j.resolver_modules:IsEnabled('Edge2') then
        a.info[ent]['modules']['edge2']['side'] = ''
        a.info[ent]['modules']['edge2']['angle'] = 0;
        return
    end ;
    local dv = 90;
    local b9, ba = 'left', 'right'
    if a.data[ent].antiaim['is_backwards'] then
        b9, ba = 'right', 'left'
    end ;
    local dw = {}
    local dx = 0;
    local dy = 0;
    local dz = {}
    local dA = 1;
    for y = 0, 2, 1 do
        if dz[y] == nil then
            dz[y] = 0
        end ;
        if y == 1 then
            dw[y] = dv
        else
            dw[y] = -dv
        end ;
        if invert == 0 then
            if y == 1 then
                dw[y] = -dv
            else
                dw[y] = dv
            end
        end ;
        local dB = o(entity.hitbox_position(ent, 0))
        local dj = e.get_origin_extrapolated(p, j.resolver_predict_local_ticks:GetValue())
        local dC = o(dj.x, dj.y, dj.z)
        local dD = dB:__sub(dC):normalized()
        local dE = o(0, 0, 1)
        local dF = l.angle_forward(dD)
        local dG = l.cross_product(dF, dE)
        local dH = o(-dG.x, -dG.y, dG.z)
        local v = 2;
        if y == 0 then
            local dI = dG:__mul(v * 2)
            dB = dB:__add(dI)
        elseif y == 1 then
            local dJ = dH:__mul(v * 2)
            dB = dB:__add(dJ)
        end ;
        if dB.x then
            return
        end ;
        local bE = client.trace_line(ent, dB.x, dB.y, dB.z, dC.x, dC.y, dC.z)
        if bE >= 0.90 then
            return
        end ;
        if bE < 0.90 and bE < dA then
            dA = bE;
            dz[y] = dz[y] + 1
        end ;
        local cb, damage = client.trace_bullet(p, dC.x, dC.y, dC.z, dB.x, dB.y, dB.z)
        if damage <= dx then
            dx = damage;
            dz[y] = dz[y] + 1
        end
    end ;
    if dz[0] > dz[1] then
        a.info[ent]['modules']['edge2']['angle'] = dw[0]
    elseif dz[0] < dz[1] then
        a.info[ent]['modules']['edge2']['angle'] = dw[1]
    end ;
    if a.info[ent]['modules']['edge2']['angle'] > 0 then
        a.info[ent]['modules']['edge2']['side'] = ba
    elseif a.info[ent]['modules']['edge2']['angle'] < 0 then
        a.info[ent]['modules']['edge2']['side'] = b9
    else
        a.info[ent]['modules']['edge2']['side'] = a.info[ent]['modules']['edge2']['side'] or ''
    end
end;
function a.handle_module_stats(ent)
    if not j.resolver_modules:IsEnabled('Module Accuracy') then
        return
    end ;
    for a6, a7 in pairs(a.info[ent]['modules']) do
        local dK = a7['failed'] + a7['success']
        a7['accuracy'] = d.percentof(a7['success'], dK)
    end
end;
function a.choose_side(ent)
    local dL = { ['left'] = 0, ['right'] = 0, ['mid'] = 0, [''] = 0 }
    if j.resolver_prefer_animlayer:GetValue() and a.data[ent].props['m_flVelocity2D'] <= 1.01 and (a.info[ent]['modules']['animlayer']['side'] == 'left' or a.info[ent]['modules']['animlayer']['side'] == 'right') then
        return a.info[ent]['modules']['animlayer']['side']
    elseif j.resolver_prefer_lby:GetValue() and a.data[ent].props['m_flVelocity2D'] <= 1.01 then
        return a.info[ent]['modules']['lby']['side']
    end ;
    for a6, a7 in pairs(a.info[ent]['modules']) do
        dL[a7['side'] or ''] = dL[a7['side'] or ''] + a7['accuracy']
    end ;
    if dL['left'] ~= dL['right'] then
        if dL['mid'] > dL['left'] and dL['mid'] > dL['right'] then
            if j.resolver_middle:GetValue() then
                return 'mid'
            else
                return dL['left'] > dL['right'] and 'left' or 'right'
            end
        else
            return dL['left'] > dL['right'] and 'left' or 'right'
        end
    end ;
    return ''
end;
function a.run_modules(ent)
    a.condition(ent)
    a.logic_edge(ent)
    a.logic_edge2(ent)
    a.logic_predict(ent)
    a.logic_trace(ent)
    a.logic_trace2(ent)
    a.logic_damage(ent)
    a.logic_damage2(ent)
    a.logic_fraction(ent)
    a.logic_fraction2(ent)
    a.logic_position(ent)
    a.logic_simple(ent)
    a.lowerbody(ent)
    a.animlayer_get_side(ent)
    a.get_delta_size(ent)
end;
function a.set_body_yaw(ent)
    if a.data[ent].cur_hit_pattern > 0 then
        return
    end ;
    if j.resolver_force_lowdelta:GetValue() or a.info[ent]['low_delta']['active'] then
        a.info[ent].fake_limit = d.clamp(math.abs(a.info[ent].hit_yaw), 0, a.info[ent]['low_delta']['yaw'])
    else
        a.info[ent].fake_limit = d.clamp(math.abs(a.info[ent].hit_yaw), 0, 60)
    end ;
    if a.data[ent].logic.side == 'mid' then
        cur_lby = 0
    else
        cur_lby = a.data[ent].logic.side == 'left' and a.info[ent].fake_limit or -a.info[ent].fake_limit
    end ;
    local a0 = j.resolver_yawlimit:GetValue()
    local dM = a0;
    if a.data[ent].props['highdelta'] and not a.data[ent].props['lowdelta'] then
        dM = d.clamp(60, -a0, a0)
    elseif a.data[ent].props['lowdelta'] and not a.data[ent].props['highdelta'] then
        dM = d.clamp(a.data[ent]['animlayer']['fake_yaw'], -a0, a0)
    else
        dM = d.clamp(45, -a0, a0)
    end ;
    cur_lby = a.info[ent].real == 'Show' and cur_lby * -1 or cur_lby;
    cur_lby = d.clamp(cur_lby, -dM, dM)
    if a.data[ent].resolved_yaw == cur_lby then
        return
    end ;
    a.data[ent].resolved_yaw = cur_lby;
    m.SetForceBodyYawCheckbox(ent, true)
    m.SetPlayerBodyYaw(ent, cur_lby)
    if a.data[ent].prev_goalfeet ~= a.data[ent].props['m_flGoalFeetDelta'] then
        a.data[ent].prev_goalfeet = a.data[ent].props['m_flGoalFeetDelta']
    end ;
    c.log("[Resolver] Set " .. entity.get_player_name(ent) .. "'s body yaw to: " .. cur_lby)
end;
function a.count_packets(ent)
    if not j.resolver_modules:IsEnabled('Desync Detection') then
        return
    end ;
    local dN = a.data[ent].props['m_flChokedPackets'] or 0;
    if a.data[ent].misses >= 1 then
        a.data[ent].props['clean_packets'] = 0;
        a.data[ent].props['bad_packets'] = 0;
        a.data[ent].props['pref_packet'] = 0;
        a.data[ent].props['should_resolve'] = true;
        return
    end ;
    if a.data[ent].props['m_flVelocity2D'] > 0 and a.data[ent].props['should_resolve'] then
        return
    end ;
    if dN == a.data[ent].props['pref_packet'] then
        a.data[ent].props['clean_packets'] = a.data[ent].props['clean_packets'] + 1
    else
        a.data[ent].props['bad_packets'] = a.data[ent].props['bad_packets'] + 1
    end ;
    a.data[ent].props['pref_packet'] = dN;
    if a.data[ent].props['clean_packets'] > 3 and not a.data[ent]['animlayer']['is_desync'] or a.data[ent].props['clean_packets'] > 4 then
        a.data[ent].props['clean_packets'] = 0;
        a.data[ent].props['bad_packets'] = 0;
        a.data[ent].props['should_resolve'] = false
    elseif a.data[ent].props['bad_packets'] > 10 and a.data[ent]['animlayer']['is_desync'] or (a.data[ent].antiaim['mode'] == 'Rage' or a.data[ent].props['is_slowwalking'] or a.balance_adjust(ent)) and a.data[ent].props['bad_packets'] > 10 or a.data[ent].props['bad_packets'] > 17 then
        a.data[ent].props['bad_packets'] = 0;
        a.data[ent].props['clean_packets'] = 0;
        a.data[ent].props['should_resolve'] = true
    end
end;
function a.logic(ent)
    if a.info[ent].force_off then
        a.OffResolver(ent)
        return
    end ;
    a.run_modules(ent)
    a.handle_module_stats(ent)
    a.data[ent].logic.side = a.choose_side(ent)
    a.info[ent].logic.side = a.data[ent].logic.side;
    a.set_body_yaw(ent)
end;
function a.get_props(ent)
    local aA = { entity.get_prop(ent, "m_vecVelocity") }
    local dO = e.animstate(ent)
    local d1 = o(entity.get_origin(p))
    local Y = o(entity.get_origin(ent))
    local B = l.get_FOV(o(0, entity.get_prop(ent, "m_angEyeAngles[1]"), 0), Y, d1)
    a.data[ent].props['m_flVelocity2D'] = math.abs(math.sqrt(aA[1] ^ 2 + aA[2] ^ 2))
    a.data[ent].props['m_flChokedPackets'] = e.GetChokedPackets(ent)
    a.data[ent].props['m_angEyeAngles'] = n(entity.get_prop(ent, "m_angEyeAngles[0]"), entity.get_prop(ent, "m_angEyeAngles[1]"), 0)
    a.data[ent].props['m_flLowerBodyYawTarget'] = entity.get_prop(ent, "m_flLowerBodyYawTarget")
    a.data[ent].props['m_flLowerBodyDelta'] = f.normalize_yaw(a.data[ent].props['m_flLowerBodyYawTarget'] - a.data[ent].props['m_angEyeAngles'].yaw)
    a.data[ent].props['m_flLowerBodyYawMoving'] = a.data[ent].props['m_flVelocity2D'] > 0 and a.data[ent].props['m_flLowerBodyYawTarget'] or a.data[ent].props['m_flLowerBodyYawMoving']
    a.data[ent].props['m_flLowerBodyYawStanding'] = a.data[ent].props['m_flVelocity2D'] == 0 and a.data[ent].props['m_flLowerBodyYawTarget'] or a.data[ent].props['m_flLowerBodyYawStanding']
    a.data[ent].props['m_flEyeYaw'] = f.normalize_as_yaw(dO.m_flEyeYaw)
    a.data[ent].props['m_flGoalFeetYaw'] = f.normalize_as_yaw(dO.m_flGoalFeetYaw)
    a.data[ent].props['m_flGoalFeetDelta'] = f.normalize_as_yaw(a.data[ent].props['m_flGoalFeetYaw'] - a.data[ent].props['m_flEyeYaw'])
    a.data[ent].props['m_flCurrentFeetYaw'] = f.normalize_as_yaw(dO.m_flCurrentFeetYaw)
    a.data[ent].antiaim['yaw_base'] = e.get_side(ent)
    a.data[ent].antiaim['mode'] = math.abs(a.data[ent].props['m_angEyeAngles'].pitch) >= 85 and 'Rage' or 'Legit'
    a.data[ent].antiaim['is_backwards'] = math.abs(B) >= 0 and math.abs(B) <= 90 and true or false;
    a.info[ent]['average_hit_yaw'] = d.average(a.info[ent]['hit_yaws_t'])
    a.info[ent]['average_missed_yaw'] = d.average(a.info[ent]['missed_yaws_t'])
end;
function a.get_entity_data(ent)
    a.data[ent] = a.data[ent] or a.set_round_data()
    a.info[ent] = a.info[ent] or a.set_match_data()
    a.set_current_resolver(ent)
    a.animlayer_pref(ent, 3)
    a.animlayer_pref(ent, 6)
    a.animlayer_pref(ent, 12)
    a.anim_layer_control(ent, 3)
    a.anim_layer_control(ent, 6)
    a.get_props(ent)
    a.is_slow_walking(ent)
    a.fakeduck_detection(ent)
    a.match_info_pattern(ent)
    a.handle_record(ent)
end;
function a.fakeduck_resolver(ent)
    if not j.resolver_modules:IsEnabled('Fakeduck') then
        return
    end ;
    local bo = j.resolver_fakeduck_ticks:GetValue()
    local dP = j.resolver_fakeduck_lby:GetValue()
    if math.abs(a.data[ent].props['m_flLowerBodyFakeDuck']) <= dP and a.data[ent].props['is_fakeduck'] and b.crouched_ticks[ent] >= bo then
        a.data[ent].props['no_fake'] = true;
        m.SetForceBodyYawCheckbox(ent, true)
        m.SetPlayerBodyYaw(ent, a.data[ent].props['m_flLowerBodyFakeDuck'] * -1)
        c.log("[Resolver] Fakeduck set " .. entity.get_player_name(ent) .. "'s body yaw to: " .. a.data[ent].props['m_flLowerBodyFakeDuck'] * -1 .. " (Fakeducking)")
    elseif a.data[ent].props['no_fake'] then
        c.log("[Resolver] Fakeduck restored " .. entity.get_player_name(ent) .. "'s body yaw back to: " .. a.data[ent].resolved_yaw .. " (Fakeducking)")
        m.SetPlayerBodyYaw(ent, a.data[ent].resolved_yaw)
        a.data[ent].props['no_fake'] = false
    end
end;
local function dQ(dR, dS)
    local dR = dR ~= nil and dR or false;
    local dS = dS ~= nil and dS or true;
    local dT = {}
    local dU = entity.get_all("CCSPlayerResource")[1]
    for dV = 1, globals.maxplayers() do
        if entity.get_prop(dU, "m_bConnected", dV) == 1 then
            local dW;
            if dR then
                dW = entity.get_prop(entity.get_local_player(), "m_iTeamNum")
            end ;
            local dX = true;
            if dR and entity.get_prop(dV, "m_iTeamNum") == dW then
                dX = false
            end ;
            if dX then
                local dY = true;
                if dS and entity.get_prop(dU, "m_bAlive", dV) ~= 1 then
                    dY = false
                end ;
                if dY then
                    table.insert(dT, dV)
                end
            end
        end
    end ;
    return dT
end;
function a.handle()
    p = entity.get_local_player()
    if a.IsActive() then
        if not ui.get(b.ref.rage.resolver_ref) then
            ui.set(b.ref.rage.resolver_ref, true)
        end ;
        local dZ = dQ(true, true)
        for y = 1, #dZ do
            local d_ = dZ[y]
            a.reset_bruteforce_on_dormancy(d_)
        end ;
        local F = entity.get_players(true)
        for y = 1, #F do
            local ent = F[y]
            if not entity.is_alive(ent) then
                return
            end ;
            a.handle_resolver_indicator(ent)
            a.get_entity_data(ent)
            a.count_packets(ent)
            if j.resolver_modules:IsEnabled('Desync Detection') and (a.data[ent].props['should_resolve'] and not a.data[ent].props['correction']) then
                a.data[ent].props['correction'] = true;
                m.SetForceBodyYawCheckbox(ent, true)
                m.SetCorrectionActive(ent, true)
            end ;
            if m.IsCorrectionActive(ent) then
                if a.data[ent]['bruteforce']['active'] then
                    return
                end ;
                if j.resolver_modules:IsEnabled('Desync Detection') and not a.data[ent].props['should_resolve'] then
                    a.data[ent].props['correction'] = false;
                    m.SetForceBodyYawCheckbox(ent, false)
                    m.SetCorrectionActive(ent, false)
                    return
                end ;
                a.fakeduck_resolver(ent)
                if a.data[ent].props['no_fake'] then
                    return
                end ;
                client.update_player_list()
                a.logic(ent)
            end
        end
    elseif not a.data_off then
        a.data_off = true;
        a.OffResolverAll()
    end
end;
function a.get_info_for_player(ent, v, as)
    g.draw_text(v, as, b.color[1], b.color[2], b.color[3], b.color[4], b.debug_font, entity.get_player_name(ent))
    g.draw_line(v + 50, as + 35, v + 200, as + 15, b.color[1], b.color[2], b.color[3], b.color[4])
    a.data[ent] = a.data[ent] or a.set_round_data()
    a.info[ent] = a.info[ent] or a.set_match_data()
    local ah, at = e.get_animlayer(ent, 3)
    local ai = e.get_animlayer(ent, 6)
    local e0 = e.get_animlayer(ent, 8)
    local aj = e.get_animlayer(ent, 12)
    local e1 = {}
    e1[1] = ent == p and { '' } or { '[ Resolver Modules ]', string.format(' Edge: %s', a.info[ent]['modules']['edge']['side']), string.format(' Edge2: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['edge2']['side'], a.info[ent]['modules']['edge2']['success'], a.info[ent]['modules']['edge2']['accuracy']), string.format(' Trace: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['trace']['side'], a.info[ent]['modules']['trace']['success'], a.info[ent]['modules']['trace']['accuracy']), string.format(' Trace2: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['trace2']['side'], a.info[ent]['modules']['trace2']['success'], a.info[ent]['modules']['trace2']['accuracy']), string.format(' Fraction: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['fraction']['side'], a.info[ent]['modules']['fraction']['success'], a.info[ent]['modules']['fraction']['accuracy']), string.format(' Fraction2: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['fraction2']['side'], a.info[ent]['modules']['fraction2']['success'], a.info[ent]['modules']['fraction2']['accuracy']), string.format(' Predict: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['predict']['side'], a.info[ent]['modules']['predict']['success'], a.info[ent]['modules']['predict']['accuracy']), string.format(' Damage: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['damage']['side'], a.info[ent]['modules']['damage']['success'], a.info[ent]['modules']['damage']['accuracy']), string.format(' Damage2: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['damage2']['side'], a.info[ent]['modules']['damage2']['success'], a.info[ent]['modules']['damage2']['accuracy']), string.format(' Position: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['position']['side'], a.info[ent]['modules']['position']['success'], a.info[ent]['modules']['position']['accuracy']), string.format(' Simple: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['simple']['side'], a.info[ent]['modules']['simple']['success'], a.info[ent]['modules']['simple']['accuracy']), string.format(' Lby: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['lby']['side'], a.info[ent]['modules']['lby']['success'], a.info[ent]['modules']['lby']['accuracy']), string.format(' Animlayer: %s | Success: %i | Accuracy: %i', a.info[ent]['modules']['animlayer']['side'], a.info[ent]['modules']['animlayer']['success'], a.info[ent]['modules']['animlayer']['accuracy']) }
    e1[2] = { '[ Player Details ]', string.format(' Eye Angles: %i | is fakeducking: %s | is slowwalking: %s | yaw_base: %s | lby_break: %s | Choked Packets: %i', a.data[ent].props['m_angEyeAngles'].yaw or 0, tostring(a.data[ent].props['is_fakeduck'] or false), tostring(a.data[ent].props['is_slowwalking'] or false), a.data[ent].antiaim['yaw_base'], tostring(a.data[ent].lby_can_update or false), a.data[ent].props['m_flChokedPackets'] or 0), string.format(' Misses: %i | Hits: %i | Missed Body Yaw: %i | Hit Body Yaw: %i | Average Missed Yaw: %i | Average Hit Body Yaw: %i', a.info[ent].misses or 0, a.info[ent].hits or 0, a.info[ent].missed_body_yaw or 0, a.info[ent].hit_yaw or 0, a.info[ent]['average_missed_yaw'] or 0, a.info[ent]['average_hit_yaw'] or 0), string.format('m_flEyeYaw: %s | m_flGoalFeetYaw: %s | m_flGoalFeetDelta: %s | m_flCurrentFeetYaw: %s | lowerbody delta: %s', a.data[ent].props['m_flEyeYaw'], a.data[ent].props['m_flGoalFeetYaw'], a.data[ent].props['m_flGoalFeetDelta'], a.data[ent].props['m_flCurrentFeetYaw'], a.data[ent].props['m_flLowerBodyDelta']) }
    b.draw_ply_info(e1, v, as)
end;
function a.on_round_start()
    if a.IsActive() then
        for y = 1, #a.data do
            a.data[y] = a.set_round_data()
            a.set_current_resolver(y)
            c.log('[Resolver] Set \'' .. entity.get_player_name(y) .. '\'s data table.')
            m.SetForceBodyYawCheckbox(y, false)
        end ;
        a.data = {}
    end ;
    b.stored_bullet_trace = {}
    b.stored_line_trace = {}
    b.stored_weakest_hitbox = {}
end;
function a.on_round_end()
    if a.IsActive() then
        for y = 1, #a.data do
            a.data[y] = a.set_round_data()
            a.set_current_resolver(y)
            c.log('[Resolver] Set \'' .. entity.get_player_name(y) .. '\'s data table.')
            m.SetForceBodyYawCheckbox(y, false)
        end ;
        a.data = {}
    end ;
    b.stored_weakest_hitbox = {}
end;
function a.on_player_death(ent)
    if a.IsActive() then
        if ent == p then
            a.data = {}
        elseif a.data ~= nil and entity.is_enemy(ent) then
            a.data[ent] = a.set_round_data()
            a.set_current_resolver(ent)
            c.log('[Resolver] Set \'' .. entity.get_player_name(ent) .. '\'s data table.')
            m.SetForceBodyYawCheckbox(ent, false)
        end
    end
end;
function a.on_cs_game_disconnected()
    ui.set(b.ref.plist_resetall_ref, true)
    a.full_reset()
    b.stored_weakest_hitbox = {}
end;
function a.on_game_start()
    ui.set(b.ref.plist_resetall_ref, true)
    a.full_reset()
    b.stored_weakest_hitbox = {}
end;
function a.on_game_end()
    ui.set(b.ref.plist_resetall_ref, true)
    a.full_reset()
    b.stored_weakest_hitbox = {}
end;
function a.on_weapon_fire(ent)
    if b.layer_control[ent] ~= nil then
        if b.layer_control[ent].is_active == '' or 'onshot' then
            b.layer_control[ent]['onshot'].shot_fired = true;
            b.layer_control[ent].override = true;
            b.layer_control[ent].is_active = 'onshot'
            c.log('[Resolver] Layer control for ' .. entity.get_player_name(ent) .. ' \'on shot\' is active ')
        end
    end
end;
client.set_event_callback('aim_fire', function(a8)
    a.aim_fire(a8)
end)
client.set_event_callback('aim_hit', function(a8)
    a.aim_hit(a8)
end)
client.set_event_callback('aim_miss', function(a8)
    a.aim_miss(a8)
end)
return { resolver = a, cache = b, bindings = k, refs = j, cmath = d, centity = e, crender = g, cangle = f, Angle = n, Vector3 = o, vector = l, mariolua = c }