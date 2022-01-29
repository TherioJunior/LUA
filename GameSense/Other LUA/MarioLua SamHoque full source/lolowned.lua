local mariolua = {}
mariolua.userdata = { name = '%username%', permissions = 'Helper' }
local ffi = require('ffi')
local b = require('bit')
local d = false;
mariolua = mariolua or {}
mariolua.name = 'MarioLua'
mariolua.version = '12.9'
mariolua.debug = { enable = false, print = {}, draw = {} }
mariolua.console = nil;
mariolua.module = {}
mariolua.lib = {}
mariolua.cmd = {}
mariolua.userdata = mariolua.userdata or {}
mariolua.userdata.permissions = mariolua.userdata.permissions or 'Developer'
mariolua.userdata.uuid = mariolua.userdata.uuid or 'Dev'
mariolua.userdata.name = mariolua.userdata.name or 'Unknown'
mariolua.userdata.token = database.read('mariolua_db_token') or ''
mariolua.userdata.backup = database.read('mariolua_db_backup') or false;
ffi_cdef = ffi.cdef;
local local_player = entity.get_local_player()
local bit = { arshift = b.arshift, band = b.band, bnot = b.bnot, bor = b.bor, bswap = b.bswap, bxor = b.bxor, lshift = b.lshift, rol = b.rol, ror = b.ror, rshift = b.rshift, tobit = b.tobit, tohex = b.tohex }
local f = panorama.open()
local g = f.LobbyAPI;
local h = f.GameStateAPI;
local k = f.PartyListAPI;
local l = f.MyPersonaAPI;
local m = database.read('mariolua_db') or {}
local n = {}
local o = {}
local p = {}
local q = {}
local r = {}
local s = {}
local t = {}
local u = {}
local v = {}
local w = {}
local x = {}
local y = {}
local function z()
end;
local function A()
end;
local B = {}
local C = {}
function mariolua.prefix()
    return { client.color_log(3, 161, 252, '[\0'), client.color_log(3, 161, 252, 'Mario\0'), client.color_log(247, 247, 247, 'Lua\0'), client.color_log(3, 161, 252, ']\0') }
end;
function u.exists(D, E)
    local F;
    for _, F in pairs(D) do
        if F == E then
            return true
        elseif type(F) == "table" then
            return u.exists(F, E)
        end
    end ;
    return false
end;
function u.Contains(G, H)
    if G == nil or H == nil then
        return false
    end ;
    for I = 1, #G do
        if G[I] == H then
            return true
        end
    end ;
    return false
end;
n = { windows = {}, reference = {}, cobject = {}, active_tabs = {}, mouse1_key_state = false, config = { can_save = true, can_load = true }, clipboard = '', moving_gui_object = false, used_Object = '', lock_input = { ['attack'] = false, ['move'] = false }, block_moving_indicator = false, gs_menu_w = 0, gs_menu_h = 0, gs_menu_x = 0, gs_menu_y = 0, config_string = ui.new_string('mariolua_cfg'), config_names_string = ui.new_string('mariolua_namespam_names'), config_bg_string = ui.new_string('mariolua_background'), gui_style = 'Gamesense', print_to_chat = {}, indicator = { real_yaw = 0, fake_yaw = 0, old_size = 0, old_font = 0, container = nil }, antiaim = { real = '', state = '' }, report = { next_report_time = 0, should_report = false, idx = 1, total_reports = 0 }, closest_enemy = nil, closest_distance = 999999999, dynamicfov_new_fov = 1, legitautowall = { enabled_hitboxes = {} }, getFrametimes = {}, fps_prev = 0, icon_alpha = 150, thirdperson = { dist = 0 }, wep_tab = 1, loaded_string = "", clantag_off = nil, antiresolver = { updates = 0, targeted = 0 }, hitscan2 = { { 0, 1 }, { 3, 4, 5, 6 }, { 2 }, { 15, 16, 17, 18 }, { 11, 12, 13, 14 }, { 7, 8 }, { 9, 10 } }, hitgroup_names2 = { 'Head', 'Chest', 'Stomach', 'Arms', 'Hands', 'Legs', 'Feet' }, hitgroups = { ['head'] = 0, ['chest'] = 1, ['stomach'] = 2, ['arms'] = 3, ['hands'] = 4, ['legs'] = 5, ['feet'] = 6 }, hitboxes2 = { ['Head'] = 0, ['Neck'] = 1, ['Pelvis'] = 2, ['Stomach'] = 3, ['Chest'] = 4, ['Upper chest'] = 5, ['Shoulders'] = 6, ['Right thigh'] = 7, ['Left thigh'] = 8, ['Right leg'] = 9, ['Left leg'] = 10, ['Right foot'] = 11, ['Left foot'] = 12, ['Right hand'] = 13, ['Left hand'] = 14, ['Right arm'] = 15, ['Right forearm'] = 16, ['Left arm'] = 17, ['Left forearm'] = 18 }, hitboxes = { [0] = 'Head', [1] = 'Neck', [2] = 'Pelvis', [3] = 'Spine 4', [4] = 'Spine 3', [5] = 'Spine 2', [6] = 'Spine 1', [7] = 'Leg Upper L', [8] = 'Leg Upper R', [9] = 'Leg Lower L', [10] = 'Leg Lower R', [11] = 'Foot L', [12] = 'Foot R', [13] = 'Hand L', [14] = 'Hand R', [15] = 'Arm Upper L', [17] = 'Arm Upper R', [16] = 'Arm Lower L', [18] = 'Arm Lower R' }, hitgroups2 = { [0] = 'Body', 'Head', 'Chest', 'Stomach', 'Left Arm', 'Right Arm', 'Left Leg', 'Right Leg', 'Neck', '?', 'Gear' }, weapon_tabs = { [1] = 'Pistols', [2] = 'H. Pistols', [3] = 'SMGs', [4] = 'Rifles', [5] = 'Scout', [6] = 'AWP', [7] = 'A. Sniper', [8] = 'LMGs' }, weapons = { [1] = 'Desert Eagle', [2] = 'Dual Berettas', [3] = 'Five-SeveN', [4] = 'Glock-18', [7] = 'AK-47', [8] = 'AUG', [9] = 'AWP', [10] = 'FAMAS', [11] = 'G3SG1', [13] = 'Galil AR', [14] = 'M249', [16] = 'M4A4', [17] = 'MAC-10', [19] = 'P90', [23] = 'MP5-SD', [24] = 'UMP-45', [25] = 'XM1014', [26] = 'PP-Bizon', [27] = 'MAG-7', [28] = 'Negev', [29] = 'Sawed-Off', [30] = 'Tec-9', [31] = 'Zeus x23', [32] = 'P2000', [33] = 'MP7', [34] = 'MP9', [35] = 'Nova', [36] = 'P250', [38] = 'SCAR-20', [39] = 'SG 553', [40] = 'SSG 08', [41] = 'Knife', [42] = 'Knife', [43] = 'Flashbang', [44] = 'Grenade', [45] = 'Smoke', [46] = 'Molotov', [47] = 'Decoy', [48] = 'Incendiary', [59] = 'Knife', [60] = 'M4A1-S', [61] = 'USP-S', [63] = 'CZ75-Auto', [64] = 'R8 Revolver', [500] = 'Bayonet', [505] = 'Flip Knife', [506] = 'Gut Knife', [507] = 'Karambit', [507] = 'Karambit', [508] = 'M9 Bayonet', [509] = 'Huntsman Knife', [512] = 'Falchion Knife', [514] = 'Bowie Knife', [515] = 'Butterfly Knife', [516] = 'Shadow Daggers', [519] = 'Ursus Knife', [520] = 'Navaja Knife', [522] = 'Siletto Knife', [523] = 'Talon Knife' }, wepcfg_wepgroups = { [1] = { 'Dual Berettas', 'Five-SeveN', 'Glock-18', 'Tec-9', 'P2000', 'P250', 'USP-S', 'CZ75-Auto' }, [2] = { 'Desert Eagle', 'R8 Revolver' }, [3] = { 'MAC-10', 'P90', 'MP5-SD', 'UMP-45', 'PP-Bizon', 'MP7', 'MP9' }, [4] = { 'AK-47', 'AUG', 'FAMAS', 'Galil AR', 'M4A4', 'SG 553', 'M4A1-S' }, [5] = { 'SSG 08' }, [6] = { 'AWP' }, [7] = { 'G3SG1', 'SCAR-20' }, [8] = { 'M249', 'XM1014', 'MAG-7', 'Negev', 'Sawed-Off', 'Nova' }, [9] = { 'Zeus x23', 'Knife', 'Bayonet', 'Flip Knife', 'Gut Knife', 'Karambit', 'M9 Bayonet', 'Huntsman Knife', 'Falchion Knife', 'Bowie Knife', 'Butterfly Knife', 'Shadow Daggers', 'Ursus Knife', 'Navaja Knife', 'Siletto Knife', 'Talon Knife' } }, vote_reveal = { team_name = '', vote_option = {}, vote_type = '', vote_issue = '' } }
cache_log = {}
cache_log.index = 0;
cache_log.last_log_time = 0;
cache_log.last_con_log = {}
cache_log.last_log_print = ''
function mariolua.log(J)
    if not mariolua.debug.print then
        return
    end ;
    if globals.realtime() >= cache_log.last_log_time + 5 and #cache_log.last_con_log >= 2 then
        cache_log.last_log_time = globals.realtime()
    end ;
    if not u.Contains(cache_log.last_con_log, J) then
        local K, L, M = client.system_time()
        client.color_log(255, 50, 1870, '[' .. K .. ':' .. L .. ':' .. M .. '] [' .. mariolua.name .. ' Debug]\0')
        client.color_log(195, 195, 195, ' ', J, '\0')
        client.color_log(126, 215, 135, ' ')
        table.insert(cache_log.last_con_log, J)
        if mariolua.console ~= nil then
            mariolua.console.add_log(J)
        end ;
        local N = #cache_log.last_con_log;
        client.delay_call(5, function()
            cache_log.last_con_log[N] = nil
        end)
    end
end;
function mariolua.print(J)
    while not (J == cache_log.last_log_print) do
        mariolua.prefix()
        client.color_log(195, 195, 195, ' ', J, '\0')
        cache_log.last_log_print = J;
        client.color_log(126, 215, 135, ' ')
        if mariolua.console ~= nil then
            mariolua.console.add_log(J)
        end
    end
end;
function u.merge(O, P)
    for Q, F in pairs(P) do
        if type(F) == "table" then
            if type(O[Q] or false) == "table" then
                u.merge(O[Q] or {}, P[Q] or {})
            else
                O[Q] = F
            end
        else
            O[Q] = F
        end
    end ;
    return O
end;
function string:split(R, S, T)
    assert(R ~= '')
    assert(S == nil or S >= 1)
    local U = {}
    if self:len() > 0 then
        local V = not T;
        S = S or -1;
        local W, X = 1, 1;
        local Y, Z = self:find(R, X, V)
        while Y and S ~= 0 do
            U[W] = self:sub(X, Y - 1)
            W = W + 1;
            X = Z + 1;
            Y, Z = self:find(R, X, V)
            S = S - 1
        end ;
        U[W] = self:sub(X)
    end ;
    return U
end;
function string:starts_with(J)
    return self:sub(1, J:len()) == J
end;
function t.stripchars(J, a0)
    local a1 = J:gsub("[" .. a0:gsub("%W", "%%%1") .. "]", '')
    return a1
end;
function u.spairs(a2, a3)
    local a4 = {}
    for Q in pairs(a2) do
        a4[#a4 + 1] = Q
    end ;
    if a3 then
        table.sort(a4, function(G, a5)
            return a3(a2, G, a5)
        end)
    else
        table.sort(a4)
    end ;
    local I = 0;
    return function()
        I = I + 1;
        if a4[I] then
            return a4[I], a2[a4[I]]
        end
    end
end;
function u.table_to_string3(a6, a7)
    local a8 = "{"
    if type(a6) == 'string' then
        return a6
    end ;
    for Q, F in u.spairs(a6) do
        if type(Q) == "string" and tonumber(Q) ~= nil then
            if math.abs(tonumber(Q)) >= 0 then
                a8 = a8 .. "[" .. Q .. "]" .. "="
            end
        elseif type(Q) == "string" then
            a8 = a8 .. "[\'" .. Q .. "\']" .. "="
        end ;
        if type(F) == "table" then
            a8 = a8 .. u.table_to_string3(F)
        elseif type(F) == "boolean" then
            a8 = a8 .. tostring(F)
        elseif type(F) == "string" then
            a8 = a8 .. "\'" .. F .. "\'"
        elseif type(F) ~= 'function' then
            a8 = a8 .. F
        end ;
        a8 = a8 .. ","
    end ;
    if a8 ~= "" then
        a8 = a8:sub(1, a8:len() - 1)
    end ;
    if a8:len() <= 1 then
        a8 = "{"
    end ;
    return a8 .. "}"
end;
n.intersect_t = {}
function s.inBounds(a9, aa, ab, ac, G)
    G = G or 50;
    n.intersect_t = n.intersect_t or {}
    n.intersect_t[a9 .. aa .. ab - a9 .. ac - aa] = { a9, aa, ab - a9, ac - aa, G }
    return (n.mouse_x or 0) >= a9 and (n.mouse_x or 0) <= ab and (n.mouse_y or 0) >= aa and (n.mouse_y or 0) <= ac
end;
function s.intersect(ad, ae, af, ag, ah, ai, G)
    G = G or 50;
    n.intersect_t = n.intersect_t or {}
    n.intersect_t[af .. ag .. ah .. ai] = { af, ag, ah, ai, G }
    return ad >= af and ad <= af + ah and ae >= ag and ae <= ag + ai
end;
function s.clamp(a9, aj, ak)
    a9 = a9 or 0;
    ak = ak or 0;
    aj = aj or 0;
    return math.min(math.max(aj, a9), ak)
end;
function s.round(al, am)
    al = al or 0;
    local an = 10 ^ (am or 0)
    return math.floor(al * an + 0.5) / an
end;
t.b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function t.decode(ao)
    local ao = string.gsub(ao, '[^' .. t.b .. '=]', '')
    return ao:gsub('.', function(a9)
        if a9 == '=' then
            return ''
        end ;
        local ap, aq = '', t.b:find(a9) - 1;
        for I = 6, 1, -1 do
            ap = ap .. (aq % 2 ^ I - aq % 2 ^ (I - 1) > 0 and '1' or '0')
        end ;
        return ap
    end)     :gsub('%d%d%d?%d?%d?%d?%d?%d?', function(a9)
        if #a9 ~= 8 then
            return ''
        end ;
        local ar = 0;
        for I = 1, 8 do
            ar = ar + (a9:sub(I, I) == '1' and 2 ^ (8 - I) or 0)
        end ;
        return string.char(ar)
    end)
end;
mariolua.logo = 'iVBORw0KGgoAAAANSUhEUgAAALQAAACyCAMAAADcShUdAAAA+VBMVEUAAAAAAQMAAQIAAAAAAgUACxQAEh8APGUAaK4AToMANlsAaK4AGisAZKYAFycASXkAJT4AER0AZ64ALk0AKEIAMlQASXkAZ6wAZ6wAbbcAQ3EAYqIAOV8AT4QAGisAMlIAZ60AQGoAWJMAXp0AVpEAaKwAY6wAZawAZK0AS30AQ3AAX6AAVo8AaKwAZqwASXkALUsAZqsAYaPj4+MAWZEBX5jS1NXKy8vb3Nzp6egAU4gAa7NunblMi66Fq8AUaJa1x9FZkrGXtcWlvswndKDJ0tY4faTD0Naeucd4pLxjl7QXb6AFZ56/y9Egb5uPsMMufKpEhKetws3DYSeQAAAAMXRSTlMAKR0QFDxUzen2uNZst2PggUlFppQ9tGj29JaUjH95UsVw5tO/ei8iEOvb9PSmWMlhAvE5dAAAEGBJREFUeNrU1tFqgzAYBeC/rReBkJtAZ0ootdvUQFF2BK+ym+127/8+k8LYVpiNMybxewA9hOMx5JupKynb/KptpaxqQ+kylSy14Iwp/KQYLxqdy5oSY6pcFwyjFBdlOsmrvOEKbhjXbfTgRmquMA0TZUXxDInxL6qIlLsuOWZQojUUmGwU5mI65HGbnMMPISkMU3L4U7S0PFMy+FUsftq/i7GKksgCy2hqWkjdYDGspEXkDDeSr3YtsDBVruyYcVVU5FHWIAh1JG/2HIFYkZEfZ4tgLN+TD9oipMPJQ52FRVh2drG3HMFZPfMTZIjAit2czAdEMG9ETgdEYp+2q8t8Tb2qbnylzlaXeSBosg3DRPFTZxzxaZqmsEjAMeX7xp9eEr3XjVJ79+FIJTPgPHxZ/OH49kBuRDoHPTiTi2NSmXHZrOFPeOvZZaGRmuPayoHB5d7ubVIrh0tBBBLUjS/IyeKeru86f3H63uV5j9uRzDt+/y0fr+9vvZ/YXf9Jm5n1Og0DUVhik1jE8gAPgIQEPCKBPONhHLK2SdMWusD//zHMjA1hKTcOiAO3V7pN4y/Hx+PxveirfeVxFvvpP/Qczn0sD8y8a/DfsZ0wf9xCgPUZZ9y2Yr18/05zWbVM9J6g/Ywz2DnJ+NQNwABA5ce52z1ZWu6mUUqm9yaGL/0c9SzzuQ1A75nFhENVXH07d/MPzNfmjK7ImPWVYTyi+yfofgxB7gQgd2SqZoL9ZLHRaZgVkDKD+gOwt2H+HroEAI1aUGpaoXMu1+r8jtT5bYI2canD/AP0iciCBoHfvx9W3l15O/dkudE2zJpjnqNKjMMsRE+Xu091jDOo1UQCPVHnF5C7s6MZNEPSrpBxENF79C6/zKmcQTMACbQmm1igr6Z2T5dvhgYd0xEgaDy2KCqKarvucrGdx74+nfVy92kPrFab0cAn72aoX95Y3HXYQmQCFleYQxBoIS6wBCaue0SXg/xpPxLR7ohid8UAMR/EQLV3SRkdSH575/yGAwDpWlfoSpCrNdgcUwa2Q1+1oPYCVYi4EV6ZOZ00COMG3Qy1e714GZpRHQksEYnTMm7RrCCkSAJ1iHPMJTMRmDqhLgGs5DPAF91hZ6kfL1uGJieYpwA6CLSbArG2qQ1xZ6fNzJ6GFQQ2RqYAQoldC0GzMVYocpPml2L+rzpQArEfGMLQYSH/vlhYAKJdJxn2SugTWB5sXYRaF4TfEwDXTRGhJ+UtxWcZ0B98Idq0Q30sbJg1W8ABBAJgq8NeBb0mChousLVbmI67VYcm72ap3YuF6bBhRQXWJzSXEL/w+2lbV+irqH0zCrTGmDTZtd5Lp6uPd3W/aCYfuelwqKBYDkNZFDZeO0FThBa7roBmUGj5iEEb7GY1rjZYILoc6gfXl57BnRbX8xZCgNXGsA3aqBkU+tJO7EwGfWAGhVaxOY2llelOzcjx2t1c+Jsw69pLFma1q2wEWhsokz5IKBU6jT6tg7RvO4uHIrJ9xpzerOLjQlthltfuYXYnPR0PV5FZNUjNqjhRs/5UtxcsjlXVC+R3m/2nc1V5fQvXzKCyuamaJtZpAhHvFHqe+klu3zFB75jYmDlR7xnYKkgIYp2WlG6kw3qvkHFu0FfbcdhuUI0dgMlyDWOHWFlUEvShQ5dB/fLaokhbP03fS4XAlrqOtjbhAG1XiPq0TZ+OWg40FefTOIwEvPqoV39hMFll3kVmDhrrw8q7DGr3aIJ+nQX9aUvf0qBml5qG4vMBgmZSmXWXNwXaNVp6tf1ksir+5ahLt2p1jirrZ2tgmyObOhLoDGr3MD/SJncegdO6+34IwAK7WpD1AUoFMMn3tVLXwT7BQakbq5hVXdo0OF/bpGnroiET6BzqO9+hb37Igu4oQlOYoBW7MAg8EpAoQjN3kpYhHgAhxK5Qr1IZH3apvhMl6BzqBwv/LuT2pFNNxhAitFfLEkQ/clpYBAItO1DT2tTb9elMGZOeoO1Ub+JBoHOo33w/dD3Ngz4frAkFJpVBGLWhiNPD1A8Rg0FHIvVeq5r7ESwuRAKIma7R5VBPK/F1HjSWxMxpTyPaJOf0v1enB3Pajqv2TNjb5Ef7DfpH4Wdmqx6gao/ocqjdvcR8/VUmNHZjADPSCitGWpde/BdjpjgTvNPCHISLlJvTGpikVZ4pmk21Ls4s6uf5xcOEWDR7ZWLrgeMwE7ZP514pBxqjXYHVIUAq7cRs2/wkj7hpAUiLeI+FvJlFfWfhn4acNpObtSCve6sZk9MqrIEStDJWBfbxBGnOA21+g8amHAFoLzdzoizqt/mbuOmDUWO117pcfPMmvSrEyRZdYDW3TBs3sD2Cov0cAG/t1cdaO9MCBSuP+kE6vbwT6DypO0Wvo3gs0gpMr7bPfG4hFrlhj6ZKqVnj1F/qiBDx3PkCRT7T69vXUpleAu1L4q200wr9s9POGmQW6rE8YtNZk9TXpLXh86V1ZhvkqFlDfTuPGlOhfp4JrVN6Xgeh4n2Mx+R0wtAWajj1EtYWoO66zx6r0+HUXGDSi/va4lQ2iC5DsVBn7y0m7z+WFMgS0Op5/BenfXRPCKSdS/vml0p/4C/a3NQ6LXpVu/FZ2Ap9ayF0rAbqjbzsEI31J6djUPsRDBqIAtT+Io4wrw05nYTyvJ6gn+RBW1/GRMyx+H7GH0h/ikptLFbulOcijramJruSaY8ui9rdXwbdD8zvo4jV6sSYuKeobIEZEhIP6+YitN8yMCTRsP1P0OcBbPuQLxCVf3BaoSkebphE7UVo5+Oplq09p2GFLk/3lkF/Whs0w3s26MtOGw6LKM3JH6BxB6roAB1O/wn6Y5saPOtP/+w0noAjr6XkMrTHNYg4GsDjyf8f6LMGw8TA/GenbTsnO7CAaIV/cFrf1RWdzoj/y2kmYmuKBOkKp2sAuyLWj90foDuIiSZKh4A83V9Ypys7ZyRzvvJyrrtNA0EUbq4oCAEVCAHiF/CHiwTezhjLceI0dpM4N0jf/2HYPbuu1bqb3bAiU3MTqvPp6Hg8MzuwK61Ko07SBWoc70oLtGrGklrpYv+/oGmxQs+qUtmuTC1KK55KzmVUoFa2QFM5Q2rE+5VTT2genlh7UCqx8T5YYpZnyx4SKJeVk4zZhG0FHBPtpzeQucqJt8Iv6PLEKg913DqRVRxLZLIqjTr1MMPLmdkKzYSWolgQcTQeezFH3wen1dOmAl5kG0yPtmxTGr8SL3I9lbFAsy7BJznKafZCFtGoc1rnwlCQJlkJ5q2wK62xyUVCRIesRBPgWzC96KIXvxi8828BaFHIxDFRPmE6qrQ7KE3zaSzNlnszC/GjfwHqjnc3zpvKzPFyNLY2pX2Z1UgiUed7XtCRup5q5ovup7En9GSGtjWRYlf5kezhE0ylKmFxuzhjYj+lX5tZTe+zJ/Qh1ieBqCmKPEhpvIJwxo5isGJyAkPpl5rZe5Yn5pIZyqAZuLYo7Rk8T+pZ5q8Yd/NxBw3rsZjn1HR7Kz+mmUCu+FGl/aHVdDqJ9ZApXjV/0fq50VmMBob54tIbWn0OfIi1kiClKVPAd0VjxV5Kf0XG800fqPKwdKS7P2s97RlMFU4V68J7TUd5a6Wf9mvo/uexX7uFj9D+aHUuJwZJeyhf/DLUjnraMMvnsFenj/d+0Dt5e0CjomwrfSo0xsCgxuKVW+eIhhIXzJ7Vh9hW8d1hpfwxCVS6Qt+rpVaDYIfOuL50erU9fE29neo2CtXpnIKUFmo5NpG+APMyY3LojOtJH9Cg7vqZmlmeFGrqZEppkNKCKTdtWYKjUbYnoKixdK9RuvfBzx+UlnNk6tmBHtYep0MTXauOC2fO97+f2zobS4PZYHv9y9Sx/L40ncx2sjsiSkOVRoMzXc50eR65/IwsDUvXOa/zycseIqKU8jJXynDj6X8Pov2eEJHDz7hewdIm+v33flsq6lOq9YbS5ukL4SYqs2t0vhy5dRb0HJauTd336V6Y5NdElsDLNcHQgUoz0Vp2tjfZliQ3O3UWLzr31sWkP8Y+0H/mpufHGT7j69+ZywJ3kz37461L9EDp130DbUzd98gfKuPpAk+dyuVpoKdJ3S1JcHZebFrQjcpN7tCWbqgHb92exnp9XSzMchIhSnO9WQMRCqaWlR+CP+lq6MbU7veL2NzGiRmbyiuZkggITLGNAGp0OqEHQrcuelm7o8kfP8fuJZW6AMaeZsFh6e62hkYbkJHdzfrPXwYQuokeUrULWs8V67p9xWFKF0ntNXWsVPFRmZGkW1vfeBQd0PEdMx5FFkGhoWOzqVKwg3l02YKWpu58dG7WmO0NjHCTFQVCX5lRN6hXLqWfdrv33YFKzyW1WNyoBGXMEV+FPojK02bl5QrQtlyHKx223dG76HcH3xxSVxiuQGn5m0MQNM4LEBr6mmzPIK620KDudbsOqYn0UEz35BlxGPSmADNyB851DbOv0MbVg4+u8XRZ4IAVu+qB0IJ4cou2Xq0tELEV2QgtoduhpHZvfWdLtcP4G9VpYLBaGAJynhIB2XaNhvpt2HY1EogLO91PUbYLDobGZk2m7pY6hOZXFqHh6mfulY/WADwomPQNrVnDvAwfF9rk6jdOamFBDg67O+ilEdri6stvkRMbcS5klHcdm9BwNZ7F81K7mUdDI7TV1Z0f56V2M9NrMB+lHn5zUp+TGebAy9BOrQwinNTnY3aYw0DDIOelBp6NGpnD9T/RSerBx7NSA86mN/9t1m5WIwWiMAxzuimLKsQf7LWL2SkDQ6TceP8XNvGo8zl2UqfkgLHagMuHly+akHhhHJx6bl2MV6o/Yql7Ex8HXuaYtU6tN7tMGgfei+SvUsP3lXpqH4RxiOo/F6k/Itf8hKbPcUAdf1g/THmBGjz+vJkbwvtbOjzr7NcFamzjq87+jPm5qH9r1PrOozWEQaeqC4Va0xlmDDptILM6P6nWd4Z6M6ef5+elUCs6w4zOpwYyL8SlqvWd96XDYgY5Vf2c1VmXqNZ33qmDF8zx3wioLtPU+s6gh4YEs7AQMnaQ2frOu9LTK2KW2aymJiSo9Z03vGtls9yaqoSHiL7zco19tpojavmna6JHUcoT0T6f8S0odZZbs5qMDwq11Bl6x3PGO0XVmqhyYuxzZuTFv6/Z7GhWDru2YuyTZqiRmc2HOWseIlR1UuxT5sNdsAW9zVk/bKrFZUtimA/Nx27JjMeGnr3Fzq2KfZCi9NTU9D5n/bCX2FSVcXZ6adxNthAya2ObVzmKbLkzrmBz2jJHzJrYzI7XTlv0VhlkAayMTaaKbluIjHmMzhcbWcisiM1sPrl346BTh7LJiFLWrN/Ixs5efRiGqHqE+Jg5ONsaOr0MPdsUTfmNO1aaxa85MsjJaj2b3f00DjH14Zl8EF9BxrbhzipfTnPxiJq/GNy0Ne3JF4hRG7kZ3jaW5W/q9SYE1/tXPieG+Hxlfe01N+R51Xhbdi6EMGx/251c11vftEVtCOdyMdhw7+2mzoo8b+eT50VWm0ULMM9CS9b3fpB8AJ7FOrCezcFl+YPB6yp+/DyXpaxy4IFdvVz4DuL/4Ez/pwd28d4KfKAzH4fr3qtwTM6feyz4Fucvi0/xEgmUKwkAAAAASUVORK5CYII='
mariolua.logo = t.decode(mariolua.logo)
mariolua.notify = (function(as, J)
    local G = { callback_registered = false, maximum_count = 7, data = {} }
    function G:register_callback()
        if self.callback_registered then
            return
        end ;
        client.set_event_callback("paint_ui", function()
            local a5 = { client.screen_size() }
            local ar = { 0, 132, 235 }
            local at = 5;
            local au = self.data;
            for aq = #au, 1, -1 do
                self.data[aq].time = self.data[aq].time - globals.frametime()
                local av, aw = 180, 0;
                local I = au[aq]
                if I.time < 0 then
                    table.remove(self.data, aq)
                else
                    local ax = I.def_time - I.time;
                    local ax = ax > 1 and 1 or ax;
                    if I.time < 0.5 or ax < 0.5 then
                        aw = (ax < 1 and ax or I.time) / 0.5;
                        av = aw * 255;
                        if aw < 0.2 then
                            at = at + 15 * (1.0 - aw / 0.2)
                        end
                    end ;
                    local Q = { renderer.measure_text('c', I.draw) }
                    local ay = { a5[1] / 2 - Q[1] / 2 + 3, a5[2] - a5[2] / 100 * 17.4 + at }
                    renderer.circle(ay[1] - 30, ay[2], ar[1], ar[2], ar[3], av, 20, 180, 0.5)
                    renderer.circle(ay[1] + Q[1], ay[2], ar[1], ar[2], ar[3], av, 20, 0, 0.5)
                    renderer.rectangle(ay[1] - 30, ay[2] - 20, Q[1] + 30, 40, ar[1], ar[2], ar[3], av)
                    local az = renderer.load_png(mariolua.logo, 180, 180)
                    renderer.texture(az, ay[1] - 50, ay[2] - 20, 40, 40, 255, 255, 255, av, 'f')
                    renderer.text(ay[1] + Q[1] / 2, ay[2], 255, 255, 255, av, "c", nil, I.draw)
                    at = at - 50
                end
            end ;
            self.callback_registered = true
        end)
    end;
    function G:paint(aA, aB)
        local aC = tonumber(aA) + 1;
        for aq = self.maximum_count, 2, -1 do
            self.data[aq] = self.data[aq - 1]
        end ;
        self.data[1] = { time = aC, def_time = aC, draw = aB }
        self:register_callback()
    end;
    local aD = function(as, J)
        return G:paint(as, J)
    end;
    return aD
end)()
mariolua.notify(5, 'Welcome ' .. mariolua.userdata.name or 'Unknown' .. '!')
n.active_events = {}
n.event_callback = {}
n.ui_callback = {}
n.old_client_set_event_callback = client.set_event_callback;
n.old_client_unset_event_callback = client.unset_event_callback;
n.old_ui_set_callback = ui.set_callback;
function q.IsEventActive(aE)
    return u.Contains(n.active_events, aE)
end;
function ui.set_callback(aF, callback, aG)
    if mariolua.is_library then
        n.old_ui_set_callback(aF, function()
            if n.ui_callback[aF] == nil then
                aG = aG or ''
                n.ui_callback[aF] = n.ui_callback[aF] or {}
                n.ui_callback[aF]['last_update'] = n.ui_callback[aF]['last_update'] or globals.realtime()
                n.ui_callback[aF]['module'] = aG;
                n.ui_callback[aF]['callback'] = callback
            else
                n.ui_callback[aF]['last_update'] = globals.realtime()
            end
        end)
        n.old_ui_set_callback(aF, callback)
    else
        client.delay_call(.5, function()
            ui.set_callback(aF, callback)
        end)
    end
end;
function client.set_event_callback(aE, callback, aG)
    if mariolua.is_library then
        n.old_client_set_event_callback(aE, function()
            if n.event_callback[aE] == nil then
                aG = aG or ''
                n.event_callback[aE] = n.event_callback[aE] or {}
                n.event_callback[aE]['last_update'] = n.event_callback[aE]['last_update'] or globals.realtime()
                n.event_callback[aE]['module'] = aG;
                n.event_callback[aE]['callback'] = callback;
                if not u.Contains(n.active_events, aE) then
                    table.insert(n.active_events, aE)
                end
            else
                n.event_callback[aE]['last_update'] = globals.realtime()
            end
        end)
        n.old_client_set_event_callback(aE, callback)
    else
        client.delay_call(.5, function()
            client.set_event_callback(aE, callback)
        end)
    end
end;
function client.unset_event_callback(aE, callback, aG)
    aG = aG or ''
    n.old_client_unset_event_callback(aE, function()
        n.event_callback[aE]['active'] = false;
        n.event_callback[aE]['module'] = aG;
        if u.Contains(n.active_events, aE) then
            n.active_events[aE] = nil
        end
    end)
    n.old_client_unset_event_callback(aE, callback)
end;

mariolua.env = getfenv(1)
function mariolua.findloader(aU)
    local aV;
    local aW;

    for _, a1 in ipairs(package.searchers) do
        aV, aW = a1(aU)
        if type(aV) == "function" then
            return aV, aW
        end
    end ;
    -- mariolua.log("Could not find loader for module '" .. aU .. "'.")
    return package.loaders[aU]
end;

---TODO: ALRADY DUMPED

function mariolua.add_module(aU)
    mariolua.module[aU] = { ['loaded'] = false, ['data'] = nil, ['loadstring'] = nil }
    if aU == 'library' then
        mariolua.notify(5, 'Loading library. Please wait...')
    end ;
    mariolua.log('Adding module \'' .. aU .. '\'...')
    local debug = true;

    local code = debug and readfile("modules/" .. aU .. ".lua") or _G['mario']['getModule'](aU);
    if (code ~= '') then
        mariolua.module[aU].data = code;
        mariolua.module[aU].added = true;
        mariolua.log('Module \'' .. aU .. '\' pre-loaded.')
    end
end;

function mariolua.load_module(aU)
    if mariolua.module[aU] == nil then
        return mariolua.print('Could not run module \'' .. aU .. '\'')
    end ;
    if mariolua.module[aU].data then
        if not mariolua.module[aU].loaded then
            if not package.preload[aU] then
                mariolua.module[aU].loadstring = loadstring(mariolua.module[aU].data)()
                package.preload[aU] = not package.preload[aU] and mariolua.module[aU].loadstring or package.preload[aU]
            end ;
            if not package.loaded[aU] then
                local aV = mariolua.findloader(aU)
                if aV == nil then
                    mariolua.log("Unable to load module " .. aU)
                end ;
                package.loaded[aU] = true;
                mariolua.module[aU].loaded = true;
                local aX = aV;
                if aX ~= nil then
                    package.loaded[aU] = aX
                end
            end ;
            mariolua.log('Running module \'' .. aU .. '\'.')
        end ;
        package.preload[aU].client = package.preload[aU].client or {}
        package.preload[aU].client.set_event_callback = function(aE, callback, aU)
            return client.set_event_callback(aE, callback, aU)
        end;
        package.preload[aU].client.unset_event_callback = function(aE, callback, aU)
            return client.unset_event_callback(aE, callback, aU)
        end;
        local aY = mariolua.module[aU].loadstring;
        if aY == nil then
            return mariolua.log('Error while running module \'' .. aU .. '\'')
        end ;
        package.loaded[aU] = package.preload[aU]
        return package.loaded[aU]
    elseif mariolua.module[aU].loadstring then
        package.loaded[aU] = true;
        mariolua.module[aU].loaded = true;
        package.preload[aU] = not package.preload[aU] and mariolua.module[aU].loadstring or package.preload[aU]
        package.loaded[aU] = package.preload[aU]
        return package.loaded[aU]
    else
        client.delay_call(1, function()
            mariolua.load_module(aU)
        end)
    end
end;

function mariolua.unload_module(aU)
    if(not mariolua.module[aU]) then
        return;
    end
    if not mariolua.module[aU].loaded then
        return
    end ;
    mariolua.module[aU].loaded = false;
    mariolua.module[aU].data = nil;
    for Q, F in pairs(n.event_callback) do
        if F['module'] == aU then
            client.unset_event_callback(Q, F['callback'], F['module'])
            mariolua.log('Module "' .. aU .. '" unset callback "' .. Q .. '".')
        end
    end ;
    package.loaded[aU] = nil;
    setfenv(1, mariolua.env)
    mariolua.log('Module "' .. aU .. '" unloaded.')
end;

mariolua.add_module('library' .. (d and '_dev' or ''))
mariolua.add_module('svg');

function q.load_library()
    local aZ = mariolua.load_module('library' .. (d and '_dev' or ''))
    if aZ then
        s = u.merge(s, aZ.cmath)
        Vector2 = aZ.Vector2;
        A = aZ.Vector3;
        B = u.merge(B, aZ.vector)
        w = u.merge(w, aZ.crender)
        z = aZ.Angle;
        v = u.merge(v, aZ.cangle)
        x = u.merge(x, aZ.centity)
        t = u.merge(t, aZ.cstring)
        u = u.merge(u, aZ.ctable)
        y = aZ.cweapon;
        mariolua.is_library = true;
        mariolua.notify(5, 'Done!')
        return
    else
        client.delay_call(0.7, q.load_library)
    end
end;
q.load_library()
function q.load_svg()
    local a_ = mariolua.load_module('svg')
    if a_ then
        w.gpx = w.gpx or {}
        w.gpx.svg = mariolua.load_module('svg')
    else
        client.delay_call(1, q.load_svg)
    end
end;
q.load_svg()
mariolua.add_module('dormant_aim' .. (d and '_dev' or ''))
mariolua.add_module('resolver' .. (d and '_dev' or ''))
mariolua.add_module('angle_indicator')
mariolua.add_module('force_onshot')
mariolua.add_module('sv_pure_fix')
mariolua.add_module('freezetime_antiaim' .. (d and '_dev' or ''))
mariolua.add_module('e_peek' .. (d and '_dev' or ''))
mariolua.add_module('antibruteforce')
mariolua.add_module('bodyaim_if_lethal')
mariolua.add_module('penetration_damage')
mariolua.add_module('antiaim' .. (d and '_dev' or ''))
local b0 = {}
b0.__index = b0;
b0.new_charbuffer = ffi.typeof("char[?]")
b0.new_intptr = ffi.typeof("int[1]")
b0.new_widebuffer = ffi.typeof("wchar_t[?]")
b0.native_Surface_CreateFont = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 71, "unsigned int(__thiscall*)(void*)")
b0.native_Surface_SetFontGlyph = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 72, "void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)")
b0.play_sound = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 82, "void(__thiscall*)(void*, const char*)")
local b1 = ui.reference("PLAYERS", "Players", "Player list")
function q.steam_64(b2)
    if not b2 then
        return
    end ;
    local aa = 0;
    local b3 = 0;
    if b2 % 2 == 0 then
        aa = 0;
        b3 = b2 / 2
    else
        aa = 1;
        b3 = (b2 - 1) / 2
    end ;
    return '7656119' .. b3 * 2 + 7960265728 + aa
end;
n.ref = { removerecoil = ui.reference('RAGE', 'Other', 'Remove recoil'), targethitbox = ui.reference('RAGE', 'Aimbot', 'Target hitbox'), multipoint = ui.reference('RAGE', 'Aimbot', 'Multi-Point'), multipoint_scale = ui.reference('RAGE', 'Aimbot', 'Multi-Point scale'), prefer_safepoint = ui.reference('RAGE', 'Aimbot', 'Prefer safe point'), avoid_hitbox = ui.reference('RAGE', 'Aimbot', 'Avoid unsafe hitboxes'), automatic_fire = ui.reference('RAGE', 'Aimbot', 'Automatic fire'), silentaim = ui.reference('RAGE', 'Aimbot', 'Silent aim'), hitchance = ui.reference('RAGE', 'Aimbot', 'Minimum hit chance'), min_dmg = ui.reference('RAGE', 'Aimbot', 'Minimum damage'), automatic_scope = ui.reference('RAGE', 'Aimbot', 'Automatic scope'), quickstop = ui.reference('RAGE', 'Other', 'Quick stop'), quickstop_options = ui.reference('RAGE', 'Other', 'Quick stop options'), prefer_bodyaim = ui.reference('RAGE', 'Other', 'Prefer body aim'), prefer_bodyaim_disablers = ui.reference('RAGE', 'Other', 'Prefer body aim disablers'), double_tap = { ui.reference('RAGE', 'Other', 'Double tap') }, double_tap_mode = ui.reference('RAGE', 'Other', 'Double tap mode'), double_tap_hitchance = ui.reference('RAGE', 'Other', 'Double tap hit chance'), double_tap_fakelaglimit = ui.reference('RAGE', 'Other', 'Double tap fake lag limit'), double_tap_quick_stop = ui.reference('RAGE', 'Other', 'Double tap quick stop'), double_tap_hit_chance = ui.reference('RAGE', 'Other', 'Double tap hit chance'), double_tap_fake_lag_limit = ui.reference('RAGE', 'Other', 'Double tap fake lag limit'), correction_active_ref = ui.reference('PLAYERS', 'Adjustments', 'Correction active'), plist_resetall_ref = ui.reference('PLAYERS', 'Players', 'Reset all'), fakelag_limit = ui.reference('AA', 'Fake lag', 'Limit'), thirdperson_death_ref = ui.reference('Visuals', 'Effects', 'Force third person (dead)'), slidewalk = ui.reference('AA', 'other', 'leg movement') }
n.ref.misc = { infinite_duck = ui.reference('MISC', 'Movement', 'Infinite duck'), namesteal = ui.reference('MISC', 'Miscellaneous', 'Steal player name'), sv_maxusrcmdprocessticks_holdaim = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks_holdaim"), sv_maxusrcmdprocessticks = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks") }
n.ref.rage = { fakeduck = ui.reference('RAGE', 'Other', 'Duck peek assist'), autowall = ui.reference('RAGE', 'Aimbot', 'Automatic Penetration'), force_baim_key = ui.reference('RAGE', 'Other', 'Force body aim'), aimbot_enabled = { ui.reference('RAGE', 'Aimbot', 'Enabled') }, rage_fov = ui.reference('RAGE', 'Aimbot', 'Maximum FOV'), accuracyboost = ui.reference('RAGE', 'Other', 'Accuracy boost'), delay_shot = ui.reference('RAGE', 'Other', 'Delay shot'), forcesafepoint = ui.reference('RAGE', 'Aimbot', 'Force safe point'), override_ref = ui.reference('RAGE', 'Other', 'Anti-aim correction override'), resolver_ref = ui.reference('RAGE', 'Other', 'Anti-aim correction') }
n.ref.aa = { enabled = ui.reference('aa', 'anti-aimbot angles', 'enabled'), pitch = ui.reference('aa', 'anti-aimbot angles', 'pitch'), yaw_base = ui.reference('aa', 'anti-aimbot angles', 'yaw base'), yaw = { ui.reference('aa', 'anti-aimbot angles', 'yaw') }, jitter = { ui.reference('aa', 'anti-aimbot angles', 'yaw jitter') }, body_yaw = { ui.reference('aa', 'anti-aimbot angles', 'body yaw') }, freestanding_body_yaw = ui.reference('aa', 'anti-aimbot angles', 'freestanding body yaw'), freestanding = { ui.reference('aa', 'anti-aimbot angles', 'freestanding') }, fake = ui.reference('aa', 'anti-aimbot angles', 'fake yaw limit'), edge = ui.reference('aa', 'anti-aimbot angles', 'edge yaw'), onshot_aa = { ui.reference('AA', 'Other', 'On shot anti-aim') }, slow_motion = { ui.reference('AA', 'other', 'slow motion') }, fakelag = { amount = ui.reference('AA', 'fake lag', 'amount'), limit = ui.reference('AA', 'fake lag', 'limit'), variance = ui.reference('AA', 'fake lag', 'variance') } }
n.TRUE = { ['1'] = true, ['t'] = true, ['T'] = true, ['true'] = true, ['TRUE'] = true, ['True'] = true }
n.FALSE = { ['0'] = false, ['f'] = false, ['F'] = false, ['false'] = false, ['FALSE'] = false, ['False'] = false }
local function b4(J)
    if type(J) == 'boolean' then
        return J
    end ;
    assert(type(J) == 'string', 'str must be string')
    if n.TRUE[J] == true then
        return true
    elseif n.FALSE[J] == false then
        return false
    else
        return false, string.format('cannot convert %q to boolean', J)
    end
end;
n.old_key_state = client.key_state;
n.block_key_state = {}
function client.key_state(H, b5)
    b5 = b5 or false;
    n.block_key_state[H] = n.block_key_state[H] or false;
    if b5 then
        return n.old_key_state(H)
    else
        return n.block_key_state[H] and 'false' or n.old_key_state(H)
    end
end;
n.event_list_x, n.event_list_y, n.event_list_w = 1200, 15, 100;
function q.draw_event_list()
    local aw = 24 + #n.active_events * 10;
    w.watermark_container(n.event_list_x, n.event_list_y, n.event_list_w, aw + 5, 230, true, 'Active Events')
    for I = 1, #n.active_events do
        local ap, av, a5 = 255, 255, 255;
        local aE = n.active_events[I]
        renderer.text(n.event_list_x + 5, n.event_list_y + 13 + I * 10, ap, av, a5, 250, nil, 0, aE)
    end ;
    if ui.is_menu_open() then
        if n.mouse1_key_state then
            local b6, b7 = ui.mouse_position()
            if b6 > n.event_list_x and b6 < n.event_list_x + n.event_list_w and (b7 > n.event_list_y and b7 < n.event_list_y + aw) then
                n.event_list_x = b6 - n.event_list_w / 2;
                n.event_list_y = b7 - aw / 2;
                database.write("mariolua.debug.event_list", { n.event_list_x, n.event_list_y })
            end
        end
    end
end;
function q.debug_event_infos()
    for I = 1, #n.active_events do
        local aE = n.active_events[I]
        if n.event_callback[aE] == nil then
            return
        end ;
        n.event_callback[aE] = n.event_callback[aE] or {}
        if n.event_callback[aE]['last_update'] == globals.realtime() - 1 then
            n.event_callback[aE]['last_update'] = globals.realtime()
            n.event_callback[aE]['active'] = true;
            if not u.Contains(n.active_events, aE) then
                table.insert(n.active_events, I)
                mariolua.log('Event "' .. aE .. '" added!')
            end
        elseif n.event_callback[aE]['last_update'] < globals.realtime() - 1 then
            n.event_callback[aE]['active'] = false;
            if u.Contains(n.active_events, aE) then
                table.remove(n.active_events, I)
                n.event_callback[aE] = nil;
                mariolua.log('Event "' .. aE .. '" removed!')
            end
        end
    end ;
    n.event_list_x, n.event_list_y = unpack(database.read("mariolua.debug.event_list") or { 1200, 15 })
    if mariolua.debug.draw['event_infos'] then
        q.draw_event_list()
    end
end;
n.color = {}
n.color[1], n.color[2], n.color[3], n.color[4] = ui.get(ui.reference('MISC', 'Settings', 'Menu color'))
function draw_tracers()
    if not tracer_enable:GetValue() then
        return
    end ;
    for I, F in ipairs(tracers) do
        if globals.CurTime() < F.time + tracer_duration:GetValue() then
            local a9, aa = client.WorldToScreen(F.hit_pos)
            local b8, b9 = client.WorldToScreen(F.lp_pos)
            if a9 and b8 and aa and b9 then
                draw.Color(unpack(F.color))
                draw.Line(a9, aa, b8, b9)
            end
        else
            table.remove(tracers, I)
        end
    end
end;
local ba = {}
function w.create_font(bb, bc, bd, be)
    local bf = 0;
    local a2 = type(be)
    if a2 == "number" then
        bf = be
    elseif a2 == "table" then
        for I = 1, #be do
            bf = bf + be[I]
        end
    else
        error("invalid flags type, has to be number or table", 2)
    end ;
    if bc == nil then
        bc = 0;
        bd = 0;
        bf = 0
    end ;
    local bg = string.format("%s\0%d\0%d\0%d", bb, bc, bd, bf)
    if ba[bg] == nil then
        ba[bg] = b0.native_Surface_CreateFont()
        b0.native_Surface_SetFontGlyph(ba[bg], bb, bc, bd, 0, 0, bit.bor(bf), 0, 0)
    end ;
    return ba[bg]
end;
n.get_report_req = {}
n.report_delay = false;
n.retry_count = 0;
function q.do_request()
    if n.get_report_req.finished then
        local bh = json.parse(n.get_report_req.code).success and 'Success' or 'Failed'
        local bi = json.parse(n.get_report_req.code).message or ''
        local bj = '[Reportbot] ' .. bh .. '! ' .. bi;
        mariolua.print(bj)
        mariolua.PrintInChat(bj)
    else
        n.retry_count = n.retry_count + 1;
        client.delay_call(n.retry_count == 1 and 0.5 or 3, q.do_request)
        if n.retry_count == 1 then
        elseif n.retry_count <= 10 then
        else
            return
        end
    end
end;
function q.community_report_all_enemies(ent)
    if n.report_delay then
        return
    end ;
    n.report_delay = true;
    mariolua.userdata.token = database.read('mariolua_db_token')
    if mariolua.userdata.token == '' then
        mariolua.print('[Reportbot] API Token not set!')
        mariolua.PrintInChat('[Reportbot] API Token not set!')
        return
    end ;
    if ent then
        if x.is_bot(ent) then
            return
        end ;
        local bk = q.steam_64(entity.get_steam64(ent))
        local bl = '[Reportbot] Reporting Player: \'' .. entity.get_player_name(ent) .. '\' | Steam64: \'' .. bk .. '\''
        mariolua.print(bl)
        mariolua.PrintInChat(bl)
        local bm = t.decode('aHR0cHM6Ly9hcGkubWFyaW9sdWEuY2YvcmVwb3J0P3N0ZWFtX2lkPQ==') .. bk .. '&token=' .. mariolua.userdata.token;
        n.get_report_req = panorama.loadstring([[
			let Status = {
				finished: false
			};
			$.AsyncWebRequest("]] .. bm .. [[", {
					type:"GET",
					complete:function(e){
						Status.finished = true;
						Status.code = e.responseText;
					},
					timeout: 6000
				}
			);
			return Status;
		]])()
        q.do_request()
    end ;
    client.delay_call(1, function()
        n.report_delay = false
    end)
end;
function q.apply_community_reportbot()
    if n.report_delay then
        return
    end ;
    n.report_delay = true;
    mariolua.userdata.token = database.read('mariolua_db_token')
    if mariolua.userdata.token == '' then
        mariolua.print('[Reportbot] API Token not set!')
        mariolua.PrintInChat('[Reportbot] API Token not set!')
        return
    end ;
    local plist = ui.get(b1)
    if plist then
        if x.is_bot(plist) then
            return
        end ;
        local bk = q.steam_64(entity.get_steam64(plist))
        local bl = '[Reportbot] Reporting Player: \'' .. entity.get_player_name(plist) .. '\' | Steam64: \'' .. bk .. '\''
        mariolua.print(bl)
        mariolua.PrintInChat(bl)
        local bm = t.decode('aHR0cHM6Ly9hcGkubWFyaW9sdWEuY2YvcmVwb3J0P3N0ZWFtX2lkPQ==') .. bk .. '&token=' .. mariolua.userdata.token;
        n.get_report_req = panorama.loadstring([[
			let Status = {
				finished: false
			};
			$.AsyncWebRequest("]] .. bm .. [[", {
					type:"GET",
					complete:function(e){
						Status.finished = true;
						Status.code = e.responseText;
					},
					timeout: 6000
				}
			);
			return Status;
		]])()
        q.do_request()
    end ;
    client.delay_call(1, function()
        n.report_delay = false
    end)
end;
ui.new_button('Players', 'Adjustments', 'Apply Community Reportbot', function()
    q.apply_community_reportbot()
end)
local bn = { white = '\x01', red = '\x02', purple = '\x03', green = '\x04', light_green = '\x05', turquoise = '\x06', light_red = '\x07', gray = '\x08', yellow = '\x09', light_steel_blue = '\x0A', light_blue = '\x0B', blue = '\x0C', dark_purple = '\x0D', pink = '\x0E', dark_orange = '\x0F', orange = '\x10' }
mariolua.chathud_prefix = { [1] = ' ' .. bn.light_blue .. '[' .. bn.light_blue .. 'Mario' .. bn.white .. 'Lua' .. bn.light_blue .. '] ' .. bn.gray, [2] = ' ' .. bn.blue .. '[' .. bn.blue .. 'Mario' .. bn.white .. 'Lua' .. bn.blue .. '] ' .. bn.gray, [3] = ' ' .. bn.light_blue .. '[' .. bn.light_blue .. 'Debug Mario' .. bn.white .. 'Lua' .. bn.light_blue .. '] ' .. bn.gray }
function mariolua.PrintInChat(bo)
    if bo == nil then
        return
    end ;
    return o.print_to_chat(o.hudchat, 0, 0, mariolua.chathud_prefix[1] .. bo)
end;
function mariolua.PrintInLobbyChat(bp)
    return k.SessionCommand('Game::Chat', string.format('run all xuid %s chat %s', l.GetXuid(), bp:gsub(' ', ' ')))
end;
local bq = { Reference = {}, Groupbox = {}, Window = {}, Tab = {}, Checkbox = {}, Slider = {}, Editbox = {}, Combobox = {}, Multibox = {}, Text = {}, Keybox = {}, Button = {}, Indicator = {}, CObject = {}, ColorPicker = {}, MultiboxItem = {}, ComboboxItem = {}, IndicatorItem = {}, CObjectItem = {}, SaveVar = {}, GetValue = {}, SetValue = {}, LoadConfig = LoadConfig or {}, SaveConfig = SaveConfig or {} }
ffi_cdef [[
    typedef bool(__thiscall* console_is_visible)(void*);
]]
o.engine_client = ffi.cast(ffi.typeof("void***"), client.create_interface("engine.dll", "VEngineClient014"))
o.console_is_visible = ffi.cast("console_is_visible", o.engine_client[0][11])
ffi_cdef([[
	struct CUtlVector2 {
		void* vtable;
		void* m_Memory[2];
		int m_Size;
	};
	typedef void*(__thiscall* find_cvar_t)(void*, const char* name);
]])
o.cvar_raw = client.create_interface('vstdlib.dll', 'VEngineCvar007') or error('Interface not found')
o.cvar_real = ffi.cast(ffi.typeof('void***'), o.cvar_raw) or error('can\'t cast')
o.find_cvar = ffi.cast('find_cvar_t', o.cvar_real[0][15]) or error('could not find function')
o.name_cvar = o.find_cvar(o.cvar_raw, 'name')
o.cvar_raw = ffi.cast('char*', o.name_cvar)
o.fnChangeCallback = ffi.cast('struct CUtlVector2*', o.cvar_raw + 0x44)
o.fnChangeCallback.m_Size = 0;
ffi_cdef([[
	typedef void(__thiscall* asp_t)(void*, const char*, const char*, int);
	typedef bool(__thiscall* rsp_t)(void*, const char*, const char*);
	typedef int(__thiscall* gcpbs_t)(void*);
	typedef int(__thiscall* gcpbt_t)(void*, int,  char*, int);
	typedef char(__thiscall* gcd_t)(void*, char*, int);
	typedef bool(__thiscall* mv_t)(void*, const char*, const char*, const char*);
	typedef int(__thiscall* get_clipboard_text_count)(void*);
	typedef void(__thiscall* set_clipboard_text)(void*, const char*, int);
	typedef void(__thiscall* get_clipboard_text)(void*, int, const char*, int);
]])
o.VGUI_System010 = client.create_interface("vgui2.dll", "VGUI_System010") or print("Error finding VGUI_System010")
o.VGUI_System = ffi.cast(ffi.typeof("void***"), o.VGUI_System010)
o.get_clipboard_text_count = ffi.cast("get_clipboard_text_count", o.VGUI_System[0][7]) or print("get_clipboard_text_count Invalid")
o.set_clipboard_text = ffi.cast("set_clipboard_text", o.VGUI_System[0][9]) or print("set_clipboard_text Invalid")
o.get_clipboard_text = ffi.cast("get_clipboard_text", o.VGUI_System[0][11]) or print("get_clipboard_text Invalid")
o.fs = ffi.cast(ffi.typeof("void***"), client.create_interface("filesystem_stdio.dll", "VFileSystem017"))
o.rsp = ffi.cast("rsp_t", client.find_signature("filesystem_stdio.dll", string.char(85, 139, 236, 129, 236, 204, 204, 204, 204, 139, 85, 8, 83, 139)))
o.gcd = ffi.cast("gcd_t", client.find_signature("filesystem_stdio.dll", string.char(85, 139, 236, 86, 139, 117, 8, 86, 255)))
o.isystem = ffi.cast(ffi.typeof("void***"), client.create_interface("vgui2.dll", "VGUI_System010"))
o.gcpbs = ffi.cast("gcpbs_t", o.isystem[0][7])
o.gcpbt = ffi.cast("gcpbt_t", o.isystem[0][11])
ffi_cdef [[
    typedef void*(__thiscall* get_net_channel_info_t)(void*);
    typedef const char*(__thiscall* get_name_t)(void*);
    typedef const char*(__thiscall* get_address_t)(void*);
    typedef float(__thiscall* get_local_time_t)(void*);
    typedef float(__thiscall* get_time_connected_t)(void*);
    typedef float(__thiscall* get_avg_latency_t)(void*, int);
    typedef float(__thiscall* get_avg_loss_t)(void*, int);
    typedef float(__thiscall* get_avg_choke_t)(void*, int);
]]
o.interface_ptr = ffi.typeof('void***')
o.rawivengineclient = client.create_interface("engine.dll", "VEngineClient014") or error("VEngineClient014 wasnt found", 2)
o.ivengineclient = ffi.cast(o.interface_ptr, o.rawivengineclient) or error("rawivengineclient is nil", 2)
o.get_net_channel_info = ffi.cast("get_net_channel_info_t", o.ivengineclient[0][78]) or error("ivengineclient is nil")
ffi_cdef [[
	typedef unsigned char wchar_t;
	typedef bool (__thiscall *IsButtonDown_t)(void*, int);
	typedef void (__thiscall *EnableInput)(void*, bool);
]]
o.raw_inputsystem = client.create_interface('inputsystem.dll', 'InputSystemVersion001')
o.inputsystem = ffi.cast(o.interface_ptr, o.raw_inputsystem)
o.inputsystem_vtbl = o.inputsystem[0]
o.raw_EnableInput = o.inputsystem_vtbl[11]
o.raw_IsButtonDown = o.inputsystem_vtbl[15]
o.is_button_pressed = ffi.cast('IsButtonDown_t', o.raw_IsButtonDown)
o.enable_input = ffi.cast('EnableInput', o.raw_EnableInput)
ffi_cdef([[
	typedef void***(__thiscall* FindHudElement_t)(void*, const char*);
	typedef void(__cdecl* ChatPrintf_t)(void*, int, int, const char*, ...);
	typedef int(__thiscall* ConvertAnsiToUnicode_t)(void*, const char*, wchar_t*, int);
	typedef int(__thiscall* ConvertUnicodeToAnsi_t)(void*, const wchar_t*, char*, int);
	typedef wchar_t*(__thiscall* FindSafe_t)(void*, const char*);

	typedef struct {
		char pad[0x58];
		bool isChatOpen;
	} CCSGO_HudChat;
]])
o.signature_gHud = string.char(185, 204, 204, 204, 204, 136, 70, 9)
o.signature_FindElement = string.char(85, 139, 236, 83, 139, 93, 8, 86, 87, 139, 249, 51, 246, 57, 119, 40)
o.chat_match_temp = client.find_signature('client.dll', o.signature_gHud) or error('sig1 not found')
o.hud = ffi.cast('void**', ffi.cast('char*', o.chat_match_temp) + 1)[0] or error('hud is nil')
o.chat_match = client.find_signature('client.dll', o.signature_FindElement) or error('FindHudElement not found')
o.find_hud_element = ffi.cast('FindHudElement_t', o.chat_match)
o.hudchat = o.find_hud_element(o.hud, 'CHudChat') or error('CHudChat not found')
o.chudchat_vtbl = o.hudchat[0] or error('CHudChat instance vtable is nil')
o.print_to_chat = ffi.cast('ChatPrintf_t', o.chudchat_vtbl[27])
o.hudElement2 = o.find_hud_element(o.hud, "CCSGO_HudChat") or error("CCSGO_HudChat not found")
o.hudchat2 = nil;
if o.hudElement2 ~= nil then
    o.hudchat2 = ffi.cast("CCSGO_HudChat*", o.hudElement2)
end ;
function o.initHudChat()
    o.hudElement2 = o.find_hud_element(o.hud, "CCSGO_HudChat") or error("CCSGO_HudChat not found")
    if o.hudElement2 ~= nil then
        o.hudchat2 = ffi.cast("CCSGO_HudChat*", o.hudElement2)
    end
end;
ffi_cdef [[
	typedef int(__cdecl* plat_messagebox)(const char*, const char*)
]]
o.crr_t = ffi.typeof('void*(__thiscall*)(void*)')
o.cr_t = ffi.typeof('void*(__thiscall*)(void*)')
o.gm_t = ffi.typeof('const void*(__thiscall*)(void*)')
o.gsa_t = ffi.typeof('int(__fastcall*)(void*, void*, int)')
ffi.cdef [[
	typedef float  float_t;

    typedef void*(__thiscall* get_client_entity_t)(void*, int);
    typedef int(__thiscall* get_highest_entity_by_index_t)(void*);

    typedef float(__thiscall* get_spread_t)(void*);
    typedef float(__thiscall* get_innaccuracy_t)(void*);
    typedef bool(__thiscall* is_weapon_t)(void*);

    struct c_animstate_freeze_aa_mariolua {
        char pad[ 3 ];
        char m_bForceWeaponUpdate; //0x4
        char pad1[ 91 ];
        void* m_pBaseEntity; //0x60
        void* m_pActiveWeapon; //0x64
        void* m_pLastActiveWeapon; //0x68
        float m_flLastClientSideAnimationUpdateTime; //0x6C
        int m_iLastClientSideAnimationUpdateFramecount; //0x70
        float m_flAnimUpdateDelta; //0x74
        float m_flEyeYaw; //0x78
        float m_flPitch; //0x7C
        float m_flGoalFeetYaw; //0x80
        float m_flCurrentFeetYaw; //0x84
        float m_flCurrentTorsoYaw; //0x88
        float m_flUnknownVelocityLean; //0x8C
        float m_flLeanAmount; //0x90
        char pad2[ 4 ];
        float m_flFeetCycle; //0x98
        float m_flFeetYawRate; //0x9C
        char pad3[ 4 ];
        float m_fDuckAmount; //0xA4
        float m_fLandingDuckAdditiveSomething; //0xA8
        char pad4[ 4 ];
        float m_vOriginX; //0xB0
        float m_vOriginY; //0xB4
        float m_vOriginZ; //0xB8
        float m_vLastOriginX; //0xBC
        float m_vLastOriginY; //0xC0
        float m_vLastOriginZ; //0xC4
        float m_vVelocityX; //0xC8
        float m_vVelocityY; //0xCC
        char pad5[ 4 ];
        float m_flUnknownFloat1; //0xD4
        char pad6[ 8 ];
        float m_flUnknownFloat2; //0xE0
        float m_flUnknownFloat3; //0xE4
        float m_flUnknown; //0xE8
        float m_flSpeed2D; //0xEC
        float m_flUpVelocity; //0xF0
        float m_flSpeedNormalized; //0xF4
        float m_flFeetSpeedForwardsOrSideWays; //0xF8
        float m_flFeetSpeedUnknownForwardOrSideways; //0xFC
        float m_flTimeSinceStartedMoving; //0x100
        float m_flTimeSinceStoppedMoving; //0x104
        bool m_bOnGround; //0x108
        bool m_bInHitGroundAnimation; //0x109
        float m_flTimeSinceInAir; //0x10A
        float m_flLastOriginZ; //0x10E
        float m_flHeadHeightOrOffsetFromHittingGroundAnimation; //0x112
        float m_flStopToFullRunningFraction; //0x116
        char pad7[ 4 ]; //0x11A
        float m_flMagicFraction; //0x11E
        char pad8[ 60 ]; //0x122
        float m_flWorldForce; //0x15E
        char pad9[ 462 ]; //0x162
        float m_flMaxYaw; //0x334
    };

	struct c_weapon_info_t_mariolua_da {
		char pad_0000[4]; //0x0000
		char* ConsoleName; //0x0004
		char pad_0008[12]; //0x0008
		int iMaxClip1; //0x0014
		char pad_0018[12]; //0x0018
		int iMaxClip2; //0x0024
		char pad_0028[4]; //0x0028
		char* szWorldModel; //0x002C
		char* szViewModel; //0x0030
		char* szDropedModel; //0x0034
		char pad_0038[4]; //0x0038
		char* N00000984; //0x003C
		char pad_0040[56]; //0x0040
		char* szEmptySound; //0x0078
		char pad_007C[4]; //0x007C
		char* szBulletType; //0x0080
		char pad_0084[4]; //0x0084
		char* szHudName; //0x0088
		char* szWeaponName; //0x008C
		char pad_0090[60]; //0x0090
		int WeaponType; //0x00CC
		int iWeaponPrice; //0x00D0
		int iKillAward; //0x00D4
		char* szAnimationPrefex; //0x00D8
		float flCycleTime; //0x00DC
		float flCycleTimeAlt; //0x00E0
		float flTimeToIdle; //0x00E4
		float flIdleInterval; //0x00E8
		bool bFullAuto; //0x00EC
		char pad_00ED[3]; //0x00ED
		int iDamage; //0x00F0
		float flArmorRatio; //0x00F4
		int iBullets; //0x00F8
		float flPenetration; //0x00FC
		float flFlinchVelocityModifierLarge; //0x0100
		float flFlinchVelocityModifierSmall; //0x0104
		float flRange; //0x0108
		float flRangeModifier; //0x010C
		char pad_0110[28]; //0x0110
		int iCrosshairMinDistance; //0x012C
		float flMaxPlayerSpeed; //0x0130
		float flMaxPlayerSpeedAlt; //0x0134
		char pad_0138[4]; //0x0138
		float flSpread; //0x013C
		float flSpreadAlt; //0x0140
		float flInaccuracyCrouch; //0x0144
		float flInaccuracyCrouchAlt; //0x0148
		float flInaccuracyStand; //0x014C
		float flInaccuracyStandAlt; //0x0150
		float flInaccuracyJumpIntial; //0x0154
		float flInaccaurcyJumpApex;
		float flInaccuracyJump; //0x0158
		float flInaccuracyJumpAlt; //0x015C
		float flInaccuracyLand; //0x0160
		float flInaccuracyLandAlt; //0x0164
		float flInaccuracyLadder; //0x0168
		float flInaccuracyLadderAlt; //0x016C
		float flInaccuracyFire; //0x0170
		float flInaccuracyFireAlt; //0x0174
		float flInaccuracyMove; //0x0178
		float flInaccuracyMoveAlt; //0x017C
		float flInaccuracyReload; //0x0180
		int iRecoilSeed; //0x0184
		float flRecoilAngle; //0x0188
		float flRecoilAngleAlt; //0x018C
		float flRecoilVariance; //0x0190
		float flRecoilAngleVarianceAlt; //0x0194
		float flRecoilMagnitude; //0x0198
		float flRecoilMagnitudeAlt; //0x019C
		float flRecoilMagnatiudeVeriance; //0x01A0
		float flRecoilMagnatiudeVerianceAlt; //0x01A4
		float flRecoveryTimeCrouch; //0x01A8
		float flRecoveryTimeStand; //0x01AC
		float flRecoveryTimeCrouchFinal; //0x01B0
		float flRecoveryTimeStandFinal; //0x01B4
		int iRecoveryTransititionStartBullet; //0x01B8
		int iRecoveryTransititionEndBullet; //0x01BC
		bool bUnzoomAfterShot; //0x01C0
		char pad_01C1[31]; //0x01C1
		char* szWeaponClass; //0x01E0
		char pad_01E4[56]; //0x01E4
		float flInaccuracyPitchShift; //0x021C
		float flInaccuracySoundThreshold; //0x0220
		float flBotAudibleRange; //0x0224
		char pad_0228[12]; //0x0228
		bool bHasBurstMode; //0x0234
	};

	struct t_bone_matrix_mariolua {
		char pad3[12];
		float x;
		char pad1[12];
		float y;
		char pad2[12];
		float z;
	};

	struct c_weapon_info_t {
		char pad_0000[4]; //0x0000
		char* ConsoleName; //0x0004
		char pad_0008[12]; //0x0008
		int iMaxClip1; //0x0014
		char pad_0018[12]; //0x0018
		int iMaxClip2; //0x0024
		char pad_0028[4]; //0x0028
		char* szWorldModel; //0x002C
		char* szViewModel; //0x0030
		char* szDropedModel; //0x0034
		char pad_0038[4]; //0x0038
		char* N00000984; //0x003C
		char pad_0040[56]; //0x0040
		char* szEmptySound; //0x0078
		char pad_007C[4]; //0x007C
		char* szBulletType; //0x0080
		char pad_0084[4]; //0x0084
		char* szHudName; //0x0088
		char* szWeaponName; //0x008C
		char pad_0090[60]; //0x0090
		int WeaponType; //0x00CC
		int iWeaponPrice; //0x00D0
		int iKillAward; //0x00D4
		char* szAnimationPrefex; //0x00D8
		float flCycleTime; //0x00DC
		float flCycleTimeAlt; //0x00E0
		float flTimeToIdle; //0x00E4
		float flIdleInterval; //0x00E8
		bool bFullAuto; //0x00EC
		char pad_00ED[3]; //0x00ED
		int iDamage; //0x00F0
		float flArmorRatio; //0x00F4
		int iBullets; //0x00F8
		float flPenetration; //0x00FC
		float flFlinchVelocityModifierLarge; //0x0100
		float flFlinchVelocityModifierSmall; //0x0104
		float flRange; //0x0108
		float flRangeModifier; //0x010C
		char pad_0110[28]; //0x0110
		int iCrosshairMinDistance; //0x012C
		float flMaxPlayerSpeed; //0x0130
		float flMaxPlayerSpeedAlt; //0x0134
		char pad_0138[4]; //0x0138
		float flSpread; //0x013C
		float flSpreadAlt; //0x0140
		float flInaccuracyCrouch; //0x0144
		float flInaccuracyCrouchAlt; //0x0148
		float flInaccuracyStand; //0x014C
		float flInaccuracyStandAlt; //0x0150
		float flInaccuracyJumpIntial; //0x0154
		float flInaccaurcyJumpApex;
		float flInaccuracyJump; //0x0158
		float flInaccuracyJumpAlt; //0x015C
		float flInaccuracyLand; //0x0160
		float flInaccuracyLandAlt; //0x0164
		float flInaccuracyLadder; //0x0168
		float flInaccuracyLadderAlt; //0x016C
		float flInaccuracyFire; //0x0170
		float flInaccuracyFireAlt; //0x0174
		float flInaccuracyMove; //0x0178
		float flInaccuracyMoveAlt; //0x017C
		float flInaccuracyReload; //0x0180
		int iRecoilSeed; //0x0184
		float flRecoilAngle; //0x0188
		float flRecoilAngleAlt; //0x018C
		float flRecoilVariance; //0x0190
		float flRecoilAngleVarianceAlt; //0x0194
		float flRecoilMagnitude; //0x0198
		float flRecoilMagnitudeAlt; //0x019C
		float flRecoilMagnatiudeVeriance; //0x01A0
		float flRecoilMagnatiudeVerianceAlt; //0x01A4
		float flRecoveryTimeCrouch; //0x01A8
		float flRecoveryTimeStand; //0x01AC
		float flRecoveryTimeCrouchFinal; //0x01B0
		float flRecoveryTimeStandFinal; //0x01B4
		int iRecoveryTransititionStartBullet; //0x01B8
		int iRecoveryTransititionEndBullet; //0x01BC
		bool bUnzoomAfterShot; //0x01C0
		char pad_01C1[31]; //0x01C1
		char* szWeaponClass; //0x01E0
		char pad_01E4[56]; //0x01E4
		float flInaccuracyPitchShift; //0x021C
		float flInaccuracySoundThreshold; //0x0220
		float flBotAudibleRange; //0x0224
		char pad_0228[12]; //0x0228
		bool bHasBurstMode; //0x0234
	};

    struct animation_layer_t_mariolua {
		bool m_bClientBlend;		 //0x0000
		float m_flBlendIn;			 //0x0004
		void* m_pStudioHdr;			 //0x0008
		int m_nDispatchSequence;     //0x000C
		int m_nDispatchSequence_2;   //0x0010
		uint32_t m_nOrder;           //0x0014
		uint32_t m_nSequence;        //0x0018
		float_t m_flPrevCycle;       //0x001C
		float_t m_flWeight;          //0x0020
		float_t m_flWeightDeltaRate; //0x0024
		float_t m_flPlaybackRate;    //0x0028
		float_t m_flCycle;           //0x002C
		void* m_pOwner;              //0x0030
		char pad_0038[4];            //0x0034
    };

    struct c_animstate_mariolua {
        char pad[ 3 ];
        char m_bForceWeaponUpdate; //0x4
        char pad1[ 91 ];
        void* m_pBaseEntity; //0x60
        void* m_pActiveWeapon; //0x64
        void* m_pLastActiveWeapon; //0x68
        float m_flLastClientSideAnimationUpdateTime; //0x6C
        int m_iLastClientSideAnimationUpdateFramecount; //0x70
        float m_flAnimUpdateDelta; //0x74
        float m_flEyeYaw; //0x78
        float m_flPitch; //0x7C
        float m_flGoalFeetYaw; //0x80
        float m_flCurrentFeetYaw; //0x84
        float m_flCurrentTorsoYaw; //0x88
        float m_flUnknownVelocityLean; //0x8C
        float m_flLeanAmount; //0x90
        char pad2[ 4 ];
        float m_flFeetCycle; //0x98
        float m_flFeetYawRate; //0x9C
        char pad3[ 4 ];
        float m_fDuckAmount; //0xA4
        float m_fLandingDuckAdditiveSomething; //0xA8
        char pad4[ 4 ];
        float m_vOriginX; //0xB0
        float m_vOriginY; //0xB4
        float m_vOriginZ; //0xB8
        float m_vLastOriginX; //0xBC
        float m_vLastOriginY; //0xC0
        float m_vLastOriginZ; //0xC4
        float m_vVelocityX; //0xC8
        float m_vVelocityY; //0xCC
        char pad5[ 4 ];
        float m_flUnknownFloat1; //0xD4
        char pad6[ 8 ];
        float m_flUnknownFloat2; //0xE0
        float m_flUnknownFloat3; //0xE4
        float m_flUnknown; //0xE8
        float m_flSpeed2D; //0xEC
        float m_flUpVelocity; //0xF0
        float m_flSpeedNormalized; //0xF4
        float m_flFeetSpeedForwardsOrSideWays; //0xF8
        float m_flFeetSpeedUnknownForwardOrSideways; //0xFC
        float m_flTimeSinceStartedMoving; //0x100
        float m_flTimeSinceStoppedMoving; //0x104
        bool m_bOnGround; //0x108
        bool m_bInHitGroundAnimation; //0x109
        float m_flTimeSinceInAir; //0x10A
        float m_flLastOriginZ; //0x10E
        float m_flHeadHeightOrOffsetFromHittingGroundAnimation; //0x112
        float m_flStopToFullRunningFraction; //0x116
        char pad7[ 4 ]; //0x11A
        float m_flMagicFraction; //0x11E
        char pad8[ 60 ]; //0x122
        float m_flWorldForce; //0x15E
        char pad9[ 462 ]; //0x162
        float m_flMaxYaw; //0x334
    };
]]
x.rawientitylist = client.create_interface('client_panorama.dll', 'VClientEntityList003') or error('VClientEntityList003 wasnt found', 2)
x.ientitylist = ffi.cast(o.interface_ptr, x.rawientitylist) or error('rawientitylist is nil', 2)
x.get_client_networkable = ffi.cast('void*(__thiscall*)(void*, int)', x.ientitylist[0][0]) or error('get_client_networkable_t is nil', 2)
x.get_client_entity = ffi.cast('void*(__thiscall*)(void*, int)', x.ientitylist[0][3]) or error('get_client_entity is nil', 2)
x.get_highest_entity_by_index = ffi.cast("get_highest_entity_by_index_t", x.ientitylist[0][6])
x.rawivmodelinfo = client.create_interface('engine.dll', 'VModelInfoClient004')
x.ivmodelinfo = ffi.cast(o.interface_ptr, x.rawivmodelinfo) or error('rawivmodelinfo is nil', 2)
x.get_studio_model = ffi.cast('void*(__thiscall*)(void*, const void*)', x.ivmodelinfo[0][32])
x.seq_activity_sig = client.find_signature('client.dll', string.char(85, 139, 236, 83, 139, 93, 8, 86, 139, 241, 131)) or error('error getting seq_activity')
function x.get_model(a5)
    if a5 then
        a5 = ffi.cast(o.interface_ptr, a5)
        local ar = ffi.cast(o.crr_t, a5[0][0])
        local at = ar(a5) or error("error getting client unknown", 2)
        if at then
            at = ffi.cast(o.interface_ptr, at)
            local au = ffi.cast(o.cr_t, at[0][5])(at) or error("error getting client renderable", 2)
            if au then
                au = ffi.cast(o.interface_ptr, au)
                return ffi.cast(o.gm_t, au[0][8])(au) or error("error getting model_t", 2)
            end
        end
    end
end;
function x.get_sequence_activity(br, bs, bt)
    br = ffi.cast(o.interface_ptr, br)
    local bu = x.get_studio_model(x.ivmodelinfo, x.get_model(bs))
    if bu == nil then
        return -1
    end ;
    local aq = ffi.cast(o.gsa_t, x.seq_activity_sig)
    return aq(br, bu, bt)
end;
function x.get_anim_layer(br, bv)
    bv = bv or 1;
    br = ffi.cast(o.interface_ptr, br)
    return ffi.cast("struct animation_layer_t_mariolua**", ffi.cast("char*", br) + 0x2980)[0][bv]
end;
function q.GetAvgLatency()
    local bw = ffi.cast("void***", o.get_net_channel_info(o.ivengineclient))
    if bw then
        local bx = ffi.cast("get_avg_latency_t", bw[0][10])
        if bx == nil then
            return 0
        else
            return bx(bw, 1)
        end
    end ;
    return 0.0
end;
function x.animstate(ent)
    local br = x.get_client_entity(x.ientitylist, ent)
    local by = ffi.cast(o.interface_ptr, br)
    local bz = ffi.cast("char*", by) + 0x3914;
    local bA = ffi.cast("struct c_animstate_mariolua**", bz)[0]
    if ent ~= nil then
        return bA
    end
end;
x.teams = { [0] = "None", [1] = "Spec", [2] = "T", [3] = "CT" }
n.enemies_t = {}
n.enemie_names_t = {}
n.enemie_index_t = {}
n.enemie_count = 0;
function x.get_all_enemies2()
    local bB = entity.get_all("CCSPlayer")
    for I = 1, #bB do
        local ent = bB[I]
        if not u.Contains(n.enemies_t, ent) and entity.is_enemy(ent) and ent ~= nil and entity.get_player_name(ent) ~= 'unknown' and (entity.get_steam64(ent) ~= 0 and entity.get_steam64(ent) ~= nil or x.is_bot(ent)) then
            table.insert(n.enemies_t, ent)
            table.insert(n.enemie_names_t, entity.get_player_name(ent))
            table.insert(n.enemie_index_t, I)
            n.enemie_count = n.enemie_count + 1;
            mariolua.log('Playerlist: Added idx: ' .. I .. ' | player: ' .. entity.get_player_name(ent) .. ' | enemy count: ' .. n.enemie_count)
        end
    end ;
    local bC = globals.maxplayers()
    for I = 1, bC do
        local ent = n.enemie_index_t[I]
        if entity.is_enemy(ent) or not n.enemies_t[ent] == ent then
            return
        end ;
        if entity.get_player_name(ent) == 'unknown' or n.enemie_names_t[ent] == 'unknown' then
            mariolua.log('Playerlist: Removed idx: ' .. tostring(ent) .. ' | player: ' .. tostring(n.enemie_names_t[ent]) .. ' | enemy count: ' .. tostring(n.enemie_count))
            table.remove(n.enemies_t, ent)
            table.remove(n.enemie_names_t, ent)
            n.enemie_index_t[I] = nil;
            table.remove(n.enemie_index_t, I)
            n.enemie_count = n.enemie_count - 1
        end
    end ;
    return n.enemies_t
end;
function x.get_all_enemies()
    local bD = {}
    local bB = entity.get_all("CCSPlayer")
    if #bB == 0 then
        return
    end ;
    for I = 1, #bB do
        local ent = bB[I]
        if entity.is_enemy(ent) and entity.get_player_name(ent) ~= 'unknown' and (entity.get_steam64(ent) ~= 0 and entity.get_steam64(ent) ~= nil or x.is_bot(I)) then
            bD[I - 1] = ent
        end
    end ;
    return bD
end;
function x.GetChokedPackets(ent)
    local bE = entity.get_prop(ent, "m_flSimulationTime")
    local bF = entity.get_prop(entity.get_player_resource(), "m_iPing", ent) or 0;
    local bG = s.TimeToTicks(globals.curtime() - bE - bF)
    return bG
end;
function x.get_all_player_positions(bH)
    local bD = {}
    local bI = {}
    local bJ = entity.get_players(bH)
    if #bJ == 0 then
        return
    end ;
    for I = 1, #bJ do
        local bK = bJ[I]
        local bL, bM, bN = entity.get_prop(bK, "m_vecOrigin")
        local bO = entity.get_prop(bK, "m_vecViewOffset[2]")
        if bN ~= nil and bO ~= nil then
            bN = bN + bO * 0.5;
            local bP, bQ = client.world_to_screen(ctx, bL, bM, bN)
            if bP ~= nil and bQ ~= nil then
                if bP >= 0 and bP <= n.screen_size.w and bQ >= 0 and bQ <= n.screen_size.h then
                    bD[#bD + 1] = bK;
                    bI[#bI + 1] = { bP, bQ }
                end
            end
        end
    end ;
    return bD, bI
end;
function x.is_peeking_other(ent, bR, bS)
    bR = bR or 1;
    local bT, bU, bO = entity.get_prop(ent, "m_vecVelocity")
    local bV = math.sqrt(bT * bT + bU * bU + bO * bO)
    if bV < 5 then
        return false
    end ;
    local bW = A(entity.get_origin(bS))
    local bX = A(entity.get_origin(ent))
    local bY = math.abs(B.distance_3d(bW, bX))
    local bZ = 999999;
    for b_ = 1, bR do
        local c0 = A(x.ExtrapolatePosition(bX.x, bX.y, bX.z, bR, ent))
        local c1 = B.distance_3d(bW, c0)
        if c1 < bZ then
            bZ = math.abs(c1)
        end ;
        if bZ < bY then
            return true
        end
    end ;
    return bZ < bY
end;
function x.is_local_peeking_enemy(ent, bR)
    bR = bR or 1;
    local bT, bU, bO = entity.get_prop(local_player, "m_vecVelocity")
    local bV = math.sqrt(bT * bT + bU * bU + bO * bO)
    if bV < 5 then
        return false
    end ;
    local bX = A(entity.get_origin(ent))
    local c2 = A(entity.get_origin(local_player))
    local bY = math.abs(B.distance_3d(bX, c2))
    local bZ = 999999;
    for b_ = 1, bR do
        local c0 = A(x.ExtrapolatePosition(c2.x, c2.y, c2.z, bR, ent))
        local c1 = B.distance_3d(bX, c0)
        if c1 < bZ then
            bZ = math.abs(c1)
        end ;
        if bZ < bY then
            return true
        end
    end ;
    return bZ < bY
end;
local c3 = {}
c3.__index = c3;
c3.native_GetNetChannelInfo = vtable_bind("engine.dll", "VEngineClient014", 78, "void*(__thiscall*)(void*)")
c3.native_GetName = vtable_thunk(0, "const char*(__thiscall*)(void*)")
c3.native_GetAddress = vtable_thunk(1, "const char*(__thiscall*)(void*)")
c3.native_IsLoopback = vtable_thunk(6, "bool(__thiscall*)(void*)")
c3.native_IsTimingOut = vtable_thunk(7, "bool(__thiscall*)(void*)")
c3.native_GetAvgLoss = vtable_thunk(11, "float(__thiscall*)(void*, int)")
c3.native_GetAvgChoke = vtable_thunk(12, "float(__thiscall*)(void*, int)")
c3.native_GetTimeSinceLastReceived = vtable_thunk(22, "float(__thiscall*)(void*)")
c3.native_GetRemoteFramerate = vtable_thunk(25, "void(__thiscall*)(void*, float*, float*, float*)")
c3.native_GetTimeoutSeconds = vtable_thunk(26, "float(__thiscall*)(void*)")
local c4 = {}
function c4.GetAddress(c5)
    local c6 = c3.native_GetAddress(c5)
    if c6 ~= nil then
        return ffi.string(c6)
    end
end;
function c4.GetName(c5)
    local aU = c3.native_GetName(c5)
    if aU ~= nil then
        return ffi.string(aU)
    end
end;
x.GetWeapon = function(c7)
    local c8 = entity.get_prop(c7, "m_hActiveWeapon")
    if c8 == nil then
        return
    end ;
    local c9 = entity.get_prop(c8, "m_iItemDefinitionIndex")
    if c9 == nil then
        return
    end ;
    local ca = bit.band(c9, 0xFFFF)
    return n.weapons[ca]
end;
x.GetWeaponGroup = function(ent)
    local c8 = entity.get_prop(ent, "m_hActiveWeapon")
    if c8 == nil then
        return
    end ;
    local c9 = entity.get_prop(c8, "m_iItemDefinitionIndex")
    if c9 == nil then
        return
    end ;
    local ca = bit.band(c9, 0xFFFF)
    for I = 1, #n.wepcfg_wepgroups do
        if u.Contains(n.wepcfg_wepgroups[I], n.weapons[ca]) then
            return I
        end
    end
end;
n.AccumulateFps = function()
    local cb = globals.absoluteframetime()
    if cb > 0 then
        table.insert(n.getFrametimes, 1, cb)
    end ;
    local cc = #n.getFrametimes;
    if cc == 0 then
        return 0
    end ;
    local I, cd = 0, 0;
    while cd < 0.5 do
        I = I + 1;
        cd = cd + n.getFrametimes[I]
        if I >= cc then
            break
        end
    end ;
    cd = cd / I;
    while I < cc do
        I = I + 1;
        table.remove(n.getFrametimes)
    end ;
    local ce = 1 / cd;
    local cf = globals.realtime()
    if math.abs(ce - n.fps_prev) > 4 or cf - last_update_time > 2 then
        n.fps_prev = ce;
        last_update_time = cf
    else
        ce = n.fps_prev
    end ;
    return math.floor(ce + 0.5)
end;
local cg = { ['arrow_1_l'] = '4peE', ['arrow_1_r'] = '4pa6', ['arrow_2_l'] = '4q+H', ['arrow_2_r'] = '4q+I', ['arrow_3_l'] = '4q6Y', ['arrow_3_r'] = '4q6a', ['arrow_4'] = '4oCS' }
local ch = { ['left_1'] = t.decode(cg['arrow_1_l']), ['right_1'] = t.decode(cg['arrow_1_r']), ['left_2'] = t.decode(cg['arrow_2_l']), ['right_2'] = t.decode(cg['arrow_2_r']), ['left_3'] = t.decode(cg['arrow_3_l']), ['right_3'] = t.decode(cg['arrow_3_r']), ['4'] = t.decode(cg['arrow_4']) }
bq.__index = bq;
n.buttons = { KEY_0 = 1, KEY_1 = 2, KEY_2 = 3, KEY_3 = 4, KEY_4 = 5, KEY_5 = 6, KEY_6 = 7, KEY_7 = 8, KEY_8 = 9, KEY_9 = 10, KEY_A = 11, KEY_B = 12, KEY_C = 13, KEY_D = 14, KEY_E = 15, KEY_F = 16, KEY_G = 17, KEY_H = 18, KEY_I = 19, KEY_J = 20, KEY_K = 21, KEY_L = 22, KEY_M = 23, KEY_N = 24, KEY_O = 25, KEY_P = 26, KEY_Q = 27, KEY_R = 28, KEY_S = 29, KEY_T = 30, KEY_U = 31, KEY_V = 32, KEY_W = 33, KEY_X = 34, KEY_Y = 35, KEY_Z = 36, KEY_PAD_0 = 37, KEY_PAD_1 = 38, KEY_PAD_2 = 39, KEY_PAD_3 = 40, KEY_PAD_4 = 41, KEY_PAD_5 = 42, KEY_PAD_6 = 43, KEY_PAD_7 = 44, KEY_PAD_8 = 45, KEY_PAD_9 = 46, KEY_PAD_DIVIDE = 47, KEY_PAD_MULTIPLY = 48, KEY_PAD_MINUS = 49, KEY_PAD_PLUS = 50, KEY_PAD_ENTER = 51, KEY_PAD_DECIMAL = 52, KEY_LBRACKET = 53, KEY_RBRACKET = 54, KEY_SEMICOLON = 55, KEY_APOSTROPHE = 56, KEY_BACKQUOTE = 57, KEY_COMMA = 58, KEY_PERIOD = 59, KEY_SLASH = 60, KEY_BACKSLASH = 61, KEY_MINUS = 62, KEY_EQUAL = 63, KEY_ENTER = 64, KEY_SPACE = 65, KEY_BACKSPACE = 66, KEY_TAB = 67, KEY_CAPSLOCK = 68, KEY_NUMLOCK = 69, KEY_ESCAPE = 70, KEY_SCROLLLOCK = 71, KEY_INSERT = 72, KEY_DELETE = 73, KEY_HOME = 74, KEY_END = 75, KEY_PAGEUP = 76, KEY_PAGEDOWN = 77, KEY_BREAK = 78, KEY_LSHIFT = 79, KEY_RSHIFT = 80, KEY_LALT = 81, KEY_RALT = 82, KEY_LCONTROL = 83, KEY_RCONTROL = 84, KEY_LWIN = 85, KEY_RWIN = 86, KEY_APP = 87, KEY_UP = 88, KEY_LEFT = 89, KEY_DOWN = 90, KEY_RIGHT = 91, KEY_F1 = 92, KEY_F2 = 93, KEY_F3 = 94, KEY_F4 = 95, KEY_F5 = 96, KEY_F6 = 97, KEY_F7 = 98, KEY_F8 = 99, KEY_F9 = 100, KEY_F10 = 101, KEY_F11 = 102, KEY_F12 = 103, KEY_CAPSLOCKTOGGLE = 104, KEY_NUMLOCKTOGGLE = 105, KEY_SCROLLLOCKTOGGLE = 106, MOUSE_LEFT = 107, MOUSE_RIGHT = 108, MOUSE_MIDDLE = 109, MOUSE_4 = 110, MOUSE_5 = 111, MOUSE_WHEEL_UP = 112, MOUSE_WHEEL_DOWN = 113 }
n.vk = { MOUSE_LEFT = 0x01, MOUSE_RIGHT = 0x02, KEY_CANCEL = 0x03, MOUSE_MIDDLE = 0x04, MOUSE_4 = 0x05, MOUSE_5 = 0x06, KEY_BACK = 0x08, KEY_TAB = 0x09, KEY_CLEAR = 0x0C, KEY_RETURN = 0x0D, KEY_SHIFT = 0x10, KEY_CONTROL = 0x11, KEY_MENU = 0x12, KEY_PAUSE = 0x13, KEY_CAPITAL = 0x14, KEY_KANA = 0x15, KEY_HANGUEL = 0x15, KEY_HANGUL = 0x15, KEY_JUNJA = 0x17, KEY_FINAL = 0x18, KEY_HANJA = 0x19, KEY_KANJI = 0x19, KEY_ESCAPE = 0x1B, KEY_CONVERT = 0x1C, KEY_NONCONVERT = 0x1D, KEY_ACCEPT = 0x1E, KEY_MODECHANGE = 0x1F, KEY_SPACE = 0x20, KEY_PRIOR = 0x21, KEY_NEXT = 0x22, KEY_END = 0x23, KEY_HOME = 0x24, KEY_LEFT = 0x25, KEY_UP = 0x26, KEY_RIGHT = 0x27, KEY_DOWN = 0x28, KEY_SELECT = 0x29, KEY_PRINT = 0x2A, KEY_EXECUTE = 0x2B, KEY_SNAPSHOT = 0x2C, KEY_INSERT = 0x2D, KEY_DELETE = 0x2E, KEY_HELP = 0x2F, KEY_0 = 0x30, KEY_1 = 0x31, KEY_2 = 0x32, KEY_3 = 0x33, KEY_4 = 0x34, KEY_5 = 0x35, KEY_6 = 0x36, KEY_7 = 0x37, KEY_8 = 0x38, KEY_9 = 0x39, KEY_A = 0x41, KEY_B = 0x42, KEY_C = 0x43, KEY_D = 0x44, KEY_E = 0x45, KEY_F = 0x46, KEY_G = 0x47, KEY_H = 0x48, KEY_I = 0x49, KEY_J = 0x4A, KEY_K = 0x4B, KEY_L = 0x4C, KEY_M = 0x4D, KEY_N = 0x4E, KEY_O = 0x4F, KEY_P = 0x50, KEY_Q = 0x51, KEY_R = 0x52, KEY_S = 0x53, KEY_T = 0x54, KEY_U = 0x55, KEY_V = 0x56, KEY_W = 0x57, KEY_X = 0x58, KEY_Y = 0x59, KEY_Z = 0x5A, KEY_LWIN = 0x5B, KEY_RWIN = 0x5C, KEY_APPS = 0x5D, KEY_SLEEP = 0x5F, KEY_PAD_0 = 0x60, KEY_PAD_1 = 0x61, KEY_PAD_2 = 0x62, KEY_PAD_3 = 0x63, KEY_PAD_4 = 0x64, KEY_PAD_5 = 0x65, KEY_PAD_6 = 0x66, KEY_PAD_7 = 0x67, KEY_PAD_8 = 0x68, KEY_PAD_9 = 0x69, KEY_PAD_MULTIPLY = 0x6A, KEY_PAD_PLUS = 0x6B, KEY_SEPARATOR = 0x6C, KEY_PAD_MINUS = 0x6D, KEY_PAD_DECIMAL = 0x6E, KEY_PAD_DIVIDE = 0x6F, KEY_F1 = 0x70, KEY_F2 = 0x71, KEY_F3 = 0x72, KEY_F4 = 0x73, KEY_F5 = 0x74, KEY_F6 = 0x75, KEY_F7 = 0x76, KEY_F8 = 0x77, KEY_F9 = 0x78, KEY_F10 = 0x79, KEY_F11 = 0x7A, KEY_F12 = 0x7B, KEY_F13 = 0x7C, KEY_F14 = 0x7D, KEY_F15 = 0x7E, KEY_F16 = 0x7F, KEY_F17 = 0x80, KEY_F18 = 0x81, KEY_F19 = 0x82, KEY_F20 = 0x83, KEY_F21 = 0x84, KEY_F22 = 0x85, KEY_F23 = 0x86, KEY_F24 = 0x87, KEY_NUMLOCK = 0x90, KEY_SCROLL = 0x91, KEY_LSHIFT = 0xA0, KEY_RSHIFT = 0xA1, KEY_LCONTROL = 0xA2, KEY_RCONTROL = 0xA3, KEY_LMENU = 0xA4, KEY_RMENU = 0xA5, KEY_BROWSER_BACK = 0xA6, KEY_BROWSER_FORWARD = 0xA7, KEY_BROWSER_REFRESH = 0xA8, KEY_BROWSER_STOP = 0xA9, KEY_BROWSER_SEARCH = 0xAA, KEY_BROWSER_FAVORITES = 0xAB, KEY_BROWSER_HOME = 0xAC, KEY_VOLUME_MUTE = 0xAD, KEY_VOLUME_DOWN = 0xAE, KEY_VOLUME_UP = 0xAF, KEY_MEDIA_NEXT_TRACK = 0xB0, KEY_MEDIA_PREV_TRACK = 0xB1, KEY_MEDIA_STOP = 0xB2, KEY_MEDIA_PLAY_PAUSE = 0xB3, KEY_LAUNCH_MAIL = 0xB4, KEY_LAUNCH_MEDIA_SELECT = 0xB5, KEY_LAUNCH_APP1 = 0xB6, KEY_LAUNCH_APP2 = 0xB7, KEY_OEM_1 = 0xBA, KEY_OEM_PLUS = 0xBB, KEY_OEM_COMMA = 0xBC, KEY_OEM_MINUS = 0xBD, KEY_OEM_PERIOD = 0xBE, KEY_OEM_2 = 0xBF, KEY_OEM_3 = 0xC0, KEY_OEM_4 = 0xDB, KEY_OEM_5 = 0xDC, KEY_OEM_6 = 0xDD, KEY_OEM_7 = 0xDE, KEY_OEM_8 = 0xDF, KEY_OEM_102 = 0xE2, KEY_PROCESSKEY = 0xE5, KEY_PACKET = 0xE7, KEY_ATTN = 0xF6, KEY_CRSEL = 0xF7, KEY_EXSEL = 0xF8, KEY_EREOF = 0xF9, KEY_PLAY = 0xFA, KEY_ZOOM = 0xFB, KEY_NONAME = 0xFC, KEY_PA1 = 0xFD, KEY_OEM_CLEAR = 0xFE }
n.vk_name = { 'MOUSE LEFT', 'MOUSE RIGHT', 'CANCEL', 'MOUSE MIDDLE', 'MOUSE 4', 'MOUSE 5', 'BACK', 'TAB', 'CLEAR', 'RETURN', 'SHIFT', 'CONTROL', 'MENU', 'PAUSE', 'CAPITAL', 'KANA', 'HANGUEL', 'HANGUL', 'JUNJA', 'FINAL', 'HANJA', 'KANJI', 'ESCAPE', 'CONVERT', 'NONCONVERT', 'ACCEPT', 'MODECHANGE', 'SPACE', 'PRIOR', 'NEXT', 'END', 'HOME', 'LEFT', 'UP', 'RIGHT', 'DOWN', 'SELECT', 'PRINT', 'EXECUTE', 'SNAPSHOT', 'INSERT', 'DELETE', 'HELP', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'LWIN', 'RWIN', 'APPS', 'SLEEP', 'PAD 0', 'PAD 1', 'PAD 2', 'PAD 3', 'PAD 4', 'PAD 5', 'PAD 6', 'PAD 7', 'PAD 8', 'PAD 9', 'PAD MULTIPLY', 'PAD PLUS', 'PAD SEPARATOR', 'PAD MINUS', 'PAD DECIMAL', 'PAD DIVIDE', 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12', 'F13', 'F14', 'F15', 'F16', 'F17', 'F18', 'F19', 'F20', 'F21', 'F22', 'F23', 'F24', 'NUMLOCK', 'SCROLL', 'LSHIFT', 'RSHIFT', 'LCONTROL', 'RCONTROL', 'LMENU', 'RMENU', 'BROWSER_BACK', 'BROWSER_FORWARD', 'BROWSER_REFRESH', 'BROWSER_STOP', 'BROWSER_SEARCH', 'BROWSER_FAVORITES', 'BROWSER_HOME', 'VOLUME_MUTE', 'VOLUME_DOWN', 'VOLUME_UP', 'MEDIA_NEXT_TRACK', 'MEDIA_PREV_TRACK', 'MEDIA_STOP', 'MEDIA_PLAY_PAUSE', 'LAUNCH_MAIL', 'LAUNCH_MEDIA_SELECT', 'LAUNCH_APP1', 'LAUNCH_APP2', 'OEM_1', 'OEM_PLUS', 'OEM_COMMA', 'OEM_MINUS', 'OEM_PERIOD', 'OEM_2', 'OEM_3', 'OEM_4', 'OEM_5', 'OEM_6', 'OEM_7', 'OEM_8', 'OEM_102', 'PROCESSKEY', 'PACKET', 'ATTN', 'CRSEL', 'EXSEL', 'EREOF', 'PLAY', 'ZOOM', 'NONAME', 'PA1', 'OEM_CLEAR' }
n.button_name = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'PAD 0', 'PAD 1', 'PAD 2', 'PAD 3', 'PAD 4', 'PAD 5', 'PAD 6', 'PAD 7', 'PAD 8', 'PAD 9', 'PAD DIVIDE', 'PAD MULTIPLY', 'PAD MINUS', 'PAD PLUS', 'PAD ENTER', 'PAD DECIMAL', 'LBRACKET', 'RBRACKET', 'SEMICOLON', 'APOSTROPHE', 'BACKQUOTE', 'COMMA', 'PERIOD', 'SLASH', 'BACKSLASH', 'MINUS', 'EQUAL', 'ENTER', 'SPACE', 'BACKSPACE', 'TAB', 'CAPSLOCK', 'NUMLOCK', 'ESCAPE', 'SCROLLLOCK', 'INSERT', 'DELETE', 'HOME', 'END', 'PAGEUP', 'PAGEDOWN', 'BREAK', 'LSHIFT', 'RSHIFT', 'LALT', 'RALT', 'LCONTROL', 'RCONTROL', 'LWIN', 'RWIN', 'APP', 'UP', 'LEFT', 'DOWN', 'RIGHT', 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12', 'CAPSLOCKTOGGLE', 'NUMLOCKTOGGLE', 'SCROLLLOCKTOGGLE', 'MOUSE LEFT', 'MOUSE RIGHT', 'MOUSE MIDDLE', 'MOUSE 4', 'MOUSE 5', 'MOUSE WHEEL UP', 'MOUSE WHEEL DOWN' }
n.key_text = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '/', '*', '-', '+', '', ',', '{', '}', '\'', '�', '`', ',', '.', '/', '\\', '-', '=', '', ' ', '' }
local ci = { is_pressed = o.is_button_pressed, key_downtime = {} }
function ci.get_pressed_key()
    if n.is_input_blocked then
        for Q, F in pairs(n.vk) do
            if client.key_state(F) then
                local cj = n.buttons[Q] or -1;
                return cj
            end
        end
    else
        for I = 1, 113 do
            if I ~= 104 and I ~= 105 and I ~= 106 then
                if ci.is_pressed(o.inputsystem, I) then
                    return I
                end
            end
        end
    end
end;
n.wep_type = { [1] = 'pistol', [2] = 'hpistol', [3] = 'smg', [4] = 'rifle', [5] = 'scout', [6] = 'awp', [7] = 'asniper', [8] = 'lmg', [9] = 'other' }
p.adaptive_wep_cfg = {}
function q.temp_wepcfg()
    local temp_wepcfg = temp_wepcfg or {}
    for I = 1, 9 do
        temp_wepcfg[I] = { bq.Groupbox:new('weapon.' .. n.wep_type[I], 'Aimbot', 0, 0, 210, 530), bq.Multibox:new('weapon.' .. n.wep_type[I] .. '.targethitbox', 'Target Hitbox', 0, 0, 190, 22, { bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.targethitbox', 'Head'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.targethitbox', 'Chest'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.targethitbox', 'Stomach'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.targethitbox', 'Arms'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.targethitbox', 'Legs'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.targethitbox', 'Feet') }, nil, true), bq.Multibox:new('weapon.' .. n.wep_type[I] .. '.multipoint', 'Multi-Point', 0, 0, 190, 22, { bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.multipoint', 'Head'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.multipoint', 'Chest'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.multipoint', 'Stomach'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.multipoint', 'Arms'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.multipoint', 'Legs'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.multipoint', 'Feet') }, nil, true), bq.Slider:new('weapon.' .. n.wep_type[I] .. '.multipoint.scale', 'Multi-Point Scale', 0, 0, 190, 12, 70, 24, 100), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.safepoint.prefer', 'Prefer Safe Point', 0, 0, 18, 18, nil), bq.Multibox:new('weapon.' .. n.wep_type[I] .. '.avoid', 'Avoid Unsafe Hitboxes', 0, 0, 190, 22, { bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.avoid', 'Head'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.avoid', 'Chest'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.avoid', 'Stomach'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.avoid', 'Arms'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.avoid', 'Legs') }, nil, true), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.autofire', 'Automatic Fire', 0, 0, 18, 18, nil), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.silentaim', 'Silent Aim', 0, 0, 18, 18, nil), bq.Slider:new('weapon.' .. n.wep_type[I] .. '.hitchance', 'Minimum Hit Chance', 0, 0, 190, 12, 55, 0, 100), bq.Slider:new('weapon.' .. n.wep_type[I] .. '.damage', 'Minimum Damage', 0, 0, 190, 12, 30, 0, 126), bq.Slider:new('weapon.' .. n.wep_type[I] .. '.damage.override', 'Minimum Damage Override', 0, 0, 190, 12, 30, 0, 126), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.autoscope', 'Automatic Scope', 0, 0, 18, 18, nil) }
        local ck = temp_wepcfg[I]
        for cl = 1, #ck do
            if p.adaptive_wep_cfg[I] == nil then
                p.adaptive_wep_cfg[I] = {}
            end ;
            p.adaptive_wep_cfg[I][ck[cl].label:lower()] = bq.Reference(ck[cl].reference)
        end
    end ;
    return temp_wepcfg
end;
function q.temp_wepcfg2()
    local temp_wepcfg2 = temp_wepcfg2 or {}
    for I = 1, 9 do
        temp_wepcfg2[I] = { bq.Groupbox:new('weapon.' .. n.wep_type[I], 'Other', 0, 0, 210, 580), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.removerecoil', 'Remove Recoil', 0, 0, 18, 18, nil), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.delayshot', 'Delay Shot', 0, 0, 18, 18, nil), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.quickstop', 'Quick Stop', 0, 0, 18, 18, nil), bq.Multibox:new('weapon.' .. n.wep_type[I] .. '.quickstop.options', 'Quick Stop Options', 0, 0, 190, 22, { bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.quickstop.options', 'Early'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.quickstop.options', 'Slow Motion'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.quickstop.options', 'Duck'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.quickstop.options', 'Fake Duck'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.quickstop.options', 'Move between Shots'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.quickstop.options', 'Ignore molotov') }, nil, true), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.bodyaim.lethal', 'Body Aim If Lethal', 0, 0, 18, 18, nil), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.bodyaim.prefer', 'Prefer Body Aim', 0, 0, 18, 18, nil), bq.Multibox:new('weapon.' .. n.wep_type[I] .. '.bodyaim.disablers', 'Prefer Body Aim Disablers', 0, 0, 190, 22, { bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.bodyaim.disablers', 'Low Inaccuracy'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.bodyaim.disablers', 'Target Shot Fired'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.bodyaim.disablers', 'Target Resolved'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.bodyaim.disablers', 'Safe Point Headshot'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.bodyaim.disablers', 'Low Damage') }, nil, true), bq.Checkbox:new('weapon.' .. n.wep_type[I] .. '.doubletap', 'Double Tap', 0, 0, 18, 18, nil), bq.Combobox:new('weapon.' .. n.wep_type[I] .. '.doubletap.mode', 'Double Tap Mode', 0, 0, 190, 22, { 'Offensive', 'Defensive' }, nil), bq.Slider:new('weapon.' .. n.wep_type[I] .. '.doubletap.hitchance', 'Double Tap Hit Chance', 0, 0, 190, 12, 5, 0, 100), bq.Slider:new('weapon.' .. n.wep_type[I] .. '.doubletap.fakelaglimit', 'Double Tap Fake Lag Limit', 0, 0, 190, 12, 1, 1, 10), bq.Multibox:new('weapon.' .. n.wep_type[I] .. '.doubletap.quickstop', 'Double Tap Quick Stop', 0, 0, 190, 22, { bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.doubletap.quickstop', 'Slow Motion'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.doubletap.quickstop', 'Duck'), bq.MultiboxItem:new('weapon.' .. n.wep_type[I] .. '.doubletap.quickstop', 'Move Between Shots') }, nil, true) }
        local ck = temp_wepcfg2[I]
        for cl = 1, #ck do
            if p.adaptive_wep_cfg[I] == nil then
                p.adaptive_wep_cfg[I] = {}
            end ;
            p.adaptive_wep_cfg[I][ck[cl].label:lower()] = bq.Reference(ck[cl].reference)
        end
    end ;
    return temp_wepcfg2
end;
function n.get_aa_settings()
    local cm = {}
    local cn = { 'standing', 'moving', 'slowmotion' }
    for I = 1, #cn do
        cm[cn[I]] = { enable = bq.Reference('antiaim.' .. cn[I] .. '.enable'):GetValue(), state = bq.Reference('antiaim.' .. cn[I] .. '.state'):GetValue(), fake = bq.Reference('antiaim.' .. cn[I] .. '.fake'):GetValue(), fake_jitter = bq.Reference('antiaim.' .. cn[I] .. '.fake.jitter'):GetValue(), fake_jitter_enable = bq.Reference('antiaim.' .. cn[I] .. '.fake.jitter.enable'):GetValue(), fake_jitter_speed = bq.Reference('antiaim.' .. cn[I] .. '.fake.jitter.speed'):GetValue(), body = bq.Reference('antiaim.' .. cn[I] .. '.body'):GetValue(), body_mode = bq.Reference('antiaim.' .. cn[I] .. '.body.mode'):GetValue(), lbyextras_mode = bq.Reference('antiaim.' .. cn[I] .. '.lbyextras'):GetValue(), freestanding = bq.Reference('antiaim.' .. cn[I] .. '.mode'):GetValue(), lby_mode = bq.Reference('antiaim.' .. cn[I] .. '.lby'):GetValue(), enable_anti_bruteforce = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.enable'):GetValue(), anti_bruteforce_timeout = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.timeout'):GetValue(), default_yaw_offset = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.yaw.default'):GetValue(), max_yaw_delta = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.yaw.max'):GetValue(), yaw_step = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.yaw.step'):GetValue(), default_body_yaw_offset = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.default'):GetValue(), max_body_yaw_delta = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.max'):GetValue(), body_yaw_step = bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.step'):GetValue() }
    end ;
    return cm
end;
function n.set_aa_settings(a6)
    local cn = { 'standing', 'moving', 'slowmotion' }
    for I = 1, #cn do
        bq.Reference('antiaim.' .. cn[I] .. '.enable'):SetValue(a6[cn[I]].enable)
        bq.Reference('antiaim.' .. cn[I] .. '.state'):SetValue(a6[cn[I]].state)
        bq.Reference('antiaim.' .. cn[I] .. '.fake'):SetValue(a6[cn[I]].fake)
        bq.Reference('antiaim.' .. cn[I] .. '.fake.jitter'):SetValue(a6[cn[I]].fake_jitter)
        bq.Reference('antiaim.' .. cn[I] .. '.fake.jitter.enable'):SetValue(a6[cn[I]].fake_jitter_enable)
        bq.Reference('antiaim.' .. cn[I] .. '.fake.jitter.speed'):SetValue(a6[cn[I]].fake_jitter_speed)
        bq.Reference('antiaim.' .. cn[I] .. '.body'):SetValue(a6[cn[I]].body)
        bq.Reference('antiaim.' .. cn[I] .. '.body.mode'):SetValue(a6[cn[I]].body_mode)
        bq.Reference('antiaim.' .. cn[I] .. '.lbyextras'):SetValue(a6[cn[I]].lbyextras_mode)
        bq.Reference('antiaim.' .. cn[I] .. '.mode'):SetValue(a6[cn[I]].freestanding)
        bq.Reference('antiaim.' .. cn[I] .. '.lby'):SetValue(a6[cn[I]].lby_mode)
        bq.Reference('antiaim.' .. cn[I] .. '.slowwalk.enabled'):SetValue(a6[cn[I]].slowwalk)
        bq.Reference('antiaim.' .. cn[I] .. '.slowwalk.speed'):SetValue(a6[cn[I]].slowwalk_speed)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.enable'):SetValue(a6[cn[I]].enable_anti_bruteforce)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.timeout'):SetValue(a6[cn[I]].anti_bruteforce_timeout)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.yaw.default'):SetValue(a6[cn[I]].default_yaw_offset)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.yaw.max'):SetValue(a6[cn[I]].max_yaw_delta)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.yaw.step'):SetValue(a6[cn[I]].yaw_step)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.default'):SetValue(a6[cn[I]].default_body_yaw_offset)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.max'):SetValue(a6[cn[I]].max_body_yaw_delta)
        bq.Reference('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.step'):SetValue(a6[cn[I]].body_yaw_step)
    end
end;
function q.generate_aa_tab()
    local co = {}
    local cn = { 'standing', 'moving', 'slowmotion' }
    for I = 1, #cn do
        co[cn[I]] = { [1] = { bq.Groupbox:new('antiaim.' .. cn[I] .. '.gb', 'Anti-Aim', 0, 0, 220, 520), bq.Checkbox:new('antiaim.' .. cn[I] .. '.enable', 'Enable', 0, 0, 18, 18, nil), bq.Combobox:new('antiaim.' .. cn[I] .. '.state', 'Anti-Aim Mode', 0, 0, 200, 22, { 'Legit', 'Rage' }, nil), bq.Combobox:new('antiaim.' .. cn[I] .. '.lby', 'LBY Mode', 0, 0, 200, 22, { 'Local View', 'Opposite', 'Match Real', 'Sway' }, nil), bq.Combobox:new('antiaim.' .. cn[I] .. '.mode', 'Legit Anti-Aim Mode', 0, 0, 200, 22, { 'MarioLua Freestanding', 'Skeet Freestanding', 'Manual' }, nil), bq.Combobox:new('antiaim.' .. cn[I] .. '.lbyextras', 'Lowerbody Extras', 0, 0, 200, 22, { 'Off', 'Fake Twist', 'Fake Jitter', 'Fake Max', 'Cradle', 'Shake' }, nil), bq.Combobox:new('antiaim.' .. cn[I] .. '.body.mode', 'Body Yaw Mode', 0, 0, 200, 22, { 'Off', 'Static', 'Opposite', 'Jitter' }, 2), bq.Checkbox:new('antiaim.' .. cn[I] .. '.fake.jitter.enable', 'Enable Fake Jitter', 0, 0, 18, 18, nil), bq.Slider:new('antiaim.' .. cn[I] .. '.body', 'Body Yaw', 0, 0, 190, 12, 60, 0, 180), bq.Slider:new('antiaim.' .. cn[I] .. '.fake', 'Fake Yaw', 0, 0, 190, 12, 60, 0, 60), bq.Slider:new('antiaim.' .. cn[I] .. '.fake.jitter', 'Fake Yaw Jitter', 0, 0, 190, 12, 60, 0, 60), bq.Slider:new('antiaim.' .. cn[I] .. '.fake.jitter.speed', 'Fake Jitter Speed', 0, 0, 190, 12, 30, 0, 1000) }, [2] = { bq.Groupbox:new('antiaim.' .. cn[I] .. '.antibruteforce', 'Anti Bruteforce', 0, 0, 230, 380), bq.Checkbox:new('antiaim.' .. cn[I] .. '.antibruteforce.enable', 'Enable', 0, 0, 18, 18, nil), bq.Slider:new('antiaim.' .. cn[I] .. '.antibruteforce.timeout', 'Timeout', 0, 0, 200, 12, 10, 0, 30), bq.Slider:new('antiaim.' .. cn[I] .. '.antibruteforce.yaw.default', 'Default Yaw Offset', 0, 0, 200, 12, 0, -180, 180), bq.Slider:new('antiaim.' .. cn[I] .. '.antibruteforce.yaw.max', 'Max Yaw Delta', 0, 0, 200, 12, 0, 0, 180), bq.Slider:new('antiaim.' .. cn[I] .. '.antibruteforce.yaw.step', 'Yaw Step', 0, 0, 200, 12, 5, 1, 10), bq.Slider:new('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.default', 'Default body Yaw Offset', 0, 0, 200, 12, 0, -180, 180), bq.Slider:new('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.max', 'Max Body Yaw Delta', 0, 0, 200, 12, 100, 0, 180), bq.Slider:new('antiaim.' .. cn[I] .. '.antibruteforce.bodyyaw.step', 'Body Yaw Step	', 0, 0, 200, 12, 5, 1, 10) } }
    end ;
    return co
end;
n.screen_size = { client.screen_size() }
n.screen_size.w = n.screen_size[1]
n.screen_size.h = n.screen_size[2]
function q.draw_Skeleton(ent, cp, cq)
    cq = cq or false;
    cp = cp or 0;
    if ent == local_player and not x.is_thirdperson() then
        return
    end ;
    if #x.get_hitbox_pos(ent) == 0 then
        return
    end ;
    local cr, cs, ct;
    for I = 0, 18 do
        hbox_t = x.get_hitbox_pos(ent)[I]
        if cp > 0 then
            cr, cs, ct = x.ExtrapolatePosition(hbox_t[1], hbox_t[2], hbox_t[3], cp, ent)
        else
            cr, cs, ct = hbox_t[1], hbox_t[2], hbox_t[3]
        end ;
        if cq then
            w.drawCubeAtPoint(3, { cr, cs, ct }, 170, 100, 220, 250, 20)
        end ;
        if cr == nil then
            return
        end ;
        local cu, cv = renderer.world_to_screen(cr, cs, ct)
        n.sk_table[I] = { cu, cv }
    end ;
    for I = 1, #n.sk_table do
        local F = n.sk_table[I]
        if F[1] and F[2] and F[3] then
            n.sk_table[I] = { renderer.world_to_screen(F[1], F[2], F[3]) }
        end
    end ;
    if not cq then
        cr, cs, ct = x.ExtrapolatePosition(x.get_hitbox_pos(ent)[0][1], x.get_hitbox_pos(ent)[0][2], x.get_hitbox_pos(ent)[0][3], cp, ent)
        w.drawCubeAtPoint(3, { cr, cs, ct }, 255, 255, 255, 255, 100)
    end ;
    w.draw_line(n.sk_table[0][1], n.sk_table[0][2], n.sk_table[1][1], n.sk_table[1][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[1][1], n.sk_table[1][2], n.sk_table[6][1], n.sk_table[6][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[6][1], n.sk_table[6][2], n.sk_table[17][1], n.sk_table[17][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[6][1], n.sk_table[6][2], n.sk_table[15][1], n.sk_table[15][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[6][1], n.sk_table[6][2], n.sk_table[4][1], n.sk_table[4][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[4][1], n.sk_table[4][2], n.sk_table[2][1], n.sk_table[2][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[2][1], n.sk_table[2][2], n.sk_table[7][1], n.sk_table[7][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[2][1], n.sk_table[2][2], n.sk_table[8][1], n.sk_table[8][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[7][1], n.sk_table[7][2], n.sk_table[9][1], n.sk_table[9][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[9][1], n.sk_table[9][2], n.sk_table[11][1], n.sk_table[11][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[8][1], n.sk_table[8][2], n.sk_table[10][1], n.sk_table[10][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[10][1], n.sk_table[10][2], n.sk_table[12][1], n.sk_table[12][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[17][1], n.sk_table[17][2], n.sk_table[18][1], n.sk_table[18][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[18][1], n.sk_table[18][2], n.sk_table[14][1], n.sk_table[14][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[15][1], n.sk_table[15][2], n.sk_table[16][1], n.sk_table[16][2], 255, 255, 255, 255)
    w.draw_line(n.sk_table[16][1], n.sk_table[16][2], n.sk_table[13][1], n.sk_table[13][2], 255, 255, 255, 255)
end;
n.old_ui_set = ui.set;
n.ui_set = {}
function ui.set(cw, ...)
    if n.ui_set[cw] ~= ... then
        if type(...) == 'table' then
            local cx = u.table_to_string3(...)
            if n.ui_set[cw] ~= cx then
                n.ui_set[cw] = cx;
                n.old_ui_set(cw, unpack(...))
            end
        else
            n.ui_set[cw] = ...
            n.old_ui_set(cw, ...)
        end
    end
end;
function bq.SaveConfig()
    local a8 = '{\n'
    ui.set(n.config_string, '')
    for I = 1, #n.reference do
        local cy = n.reference[n.reference[I]]
        if cy:GetValue() ~= nil and (cy.type ~= 'text' or cy.type == 'text' and cy.should_save) and (cy.type ~= 'tab' or cy.type == 'tab' and cy.should_save) and cy.type ~= 'button' and cy.type ~= 'groupbox' and cy.type ~= 'editbox' and cy.type ~= 'multibox_item' then
            if type(cy:GetValue()) == 'table' or cy.type == 'save_var' or cy.type == 'multibox' then
                a8 = a8 .. "['" .. n.reference[I] .. "']" .. " = " .. u.table_to_string3(cy:GetValue()) .. ",\n"
            elseif type(cy:GetValue()) == 'string' then
                a8 = a8 .. "['" .. n.reference[I] .. "']" .. " = " .. cy:GetValue() .. ",\n"
            elseif type(cy:GetValue()) == 'boolean' or 'number' then
                a8 = a8 .. "['" .. n.reference[I] .. "']" .. " = " .. tostring(cy:GetValue()) .. ",\n"
            end
        end
    end ;
    ui.set(n.config_string, a8 .. '}')
end;
function bq.LoadConfig(cz)
    if ui.get(n.config_string) == nil or ui.get(n.config_string) == '' or ui.get(n.config_string):len() < 3 then
        return
    end ;
    local cA = ui.get(n.config_string) or ''
    if cA:match("antiaim.exception,") then
        o.set_clipboard_text(o.VGUI_System, cA, cA:len())
        mariolua.notify(10, '[Info] Your confing got exported to your clipboard.')
        mariolua.notify(20, '[Error] Your confing is corrupted! Trying to repair config...')
        if cz then
            cz = cz:gsub("antiaim.exception,", "false,")
        else
            cA = cA:gsub("antiaim.exception,", "false,")
        end ;
        mariolua.notify(30, '[Info] Config repair attempt done. Loading now config...')
    end ;
    local cB;
    if cz ~= nil and cz ~= '' and type(cz) == 'string' then
        local cC = cz;
        cC = cC;
        cB = loadstring('return ' .. cC)()
    else
        cA = cA:gsub("antiaim.exception,", "false,")
        cB = loadstring('return ' .. cA)()
    end ;
    for I = 1, #n.reference do
        local cy = cB[n.reference[I]]
        local cD = n.reference[I]
        if cB[cD] == nil then
            cB[cD] = cD
        elseif n.reference[cD].type == 'keybox' then
            n.reference[cD].key = tonumber(cy)
            if cy == 0 then
                n.reference[cD].key_name = 'None'
            else
                n.reference[cD].key_name = n.button_name[cy]
            end
        elseif n.reference[cD].type == 'checkbox' then
            if cy == nil or cy == 'nil' then
                n.reference[cD].isEnabled = false
            else
                n.reference[cD].isEnabled = cy
            end
        elseif n.reference[cD].type == 'save_var' then
            if cy ~= nil and cy ~= 'nil' then
                n.reference[cD]:SetValue(cy)
            end
        elseif n.reference[cD].type == 'combobox' then
            if type(cy) ~= 'boolean' then
                n.reference[cD].enabledItem = cy
            else
                n.reference[cD].enabledItem = 1
            end
        elseif n.reference[cD].type == 'combobox_item' then
            n.reference[cD].isEnabled = cy
        elseif n.reference[cD].type == 'multibox' then
            n.reference[cD]:SetValue(cy)
        elseif n.reference[cD].type == 'slider' then
            if cy == nil or cy == 'nil' then
                n.reference[cD]:SetValue(n.reference[cD].def_val)
            else
                n.reference[cD]:SetValue(tonumber(cy))
            end
        elseif n.reference[cD].type == 'indicator_item' then
            if type(cy) == 'table' then
                if cy[1] ~= nil and cy[2] ~= nil then
                    n.reference[cD]:SetValue(cy[1], cy[2])
                end
            end
        elseif n.reference[cD].type == 'cobject_item' then
            if type(cy) == 'table' then
                if cy[1] ~= nil and cy[2] ~= nil then
                    n.reference[cD]:SetValue(cy[1], cy[2])
                end
            end
        end
    end ;
    mariolua.log('Config loaded!')
end;
function bq.SetValue(cw, H)
    for I = 1, #n.reference do
        local cy = n.reference[n.reference[I]]
        if cy:GetValue() ~= nil and n.reference[I] == cw then
            cy:SetValue(H)
        end
    end
end;
function bq.GetValue(cw)
    for I = 1, #n.reference do
        local cy = n.reference[n.reference[I]]
        if cy:GetValue() ~= nil and n.reference[I] == cw then
            cy:GetValue()
        end
    end
end;
local cE = false;
function bq.Reference(cw)
    if cw == nil then
        return false
    end ;
    if not cE then
        bq.SaveConfig()
        cE = true
    end ;
    for I = 1, #n.reference do
        local cy = n.reference[n.reference[I]]
        if (cy:GetValue() ~= nil or cy.type ~= nil) and n.reference[I] == cw then
            return cy
        end
    end
end;
function bq.Editbox:new(cF, cG, cH, cI, cJ, aw, callback)
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'editbox', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, reference = cF, label = cG, isHovered = false, isClicked = false, isWriting = false, last_key = 0, released_key = 0, input = "", visible = true, force_invisible = false, func = callback }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Editbox:SetActive(cL)
    self.visible = cL
end;
function bq.Editbox:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Editbox:IsActive()
    return self.visible
end;
function bq.Editbox:GetPosition()
    return self.pos
end;
function bq.Editbox:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Editbox:SetFunction(cN)
    self.func = cN
end;
function bq.Editbox:Update()
    if self.isWriting then
        local pressed_key = ci.get_pressed_key()
        pressed_key = pressed_key or 0;
        ci.key_downtime[pressed_key] = ci.key_downtime[pressed_key] or 0;
        if ci.is_pressed(o.inputsystem, pressed_key) then
            self.released_key = 0;
            ci.key_downtime[pressed_key] = ci.key_downtime[pressed_key] + 1
        else
            self.released_key = ci.key_downtime[pressed_key] > 0 and pressed_key or self.released_key;
            self.last_key = 0;
            ci.key_downtime = {}
        end ;
        if pressed_key ~= nil then
            if not (pressed_key == n.buttons.KEY_ESCAPE or pressed_key == n.buttons.CAPSLOCKTOGGLE or pressed_key == n.buttons.NUMLOCKTOGGLE) and self.visible and pressed_key <= #n.key_text then
                self.last_key = self.last_key == self.released_key and 0 or self.last_key;
                if self.last_key ~= pressed_key then
                    if pressed_key == n.buttons.KEY_BACKSPACE then
                        self.input = self.input:sub(1, #self.input - 1)
                    else
                        self.input = self.input .. n.key_text[pressed_key]:lower()
                    end
                end ;
                self.last_key = pressed_key
            else
                self.isClicked = false;
                self.isWriting = false;
                n.lock_input['move'] = false;
                self.input = self.input:len() > 0 and self.input or ''
                mariolua.log('editbox abort')
            end
        end
    end ;
    if self.visible then
        if ci.is_pressed(o.inputsystem, n.buttons.KEY_ESCAPE) and self.isWriting then
            self.isClicked = false;
            self.isWriting = false;
            n.lock_input['move'] = false;
            pressed_key = nil;
            self.input = ''
            mariolua.log('editbox abort')
        end ;
        if s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) or self.isWriting then
            self.isHovered = true;
            if n.mouse1_key_state and not self.isClicked then
                self.isClicked = true;
                self.isWriting = true;
                self.input = self.input:len() > 0 and self.input or ''
                n.lock_input['move'] = true
            end
        else
            self.isWriting = n.mouse1_key_state and self.isWriting and false or self.isWriting;
            self.isClicked = n.mouse1_key_state and self.isWriting and false or self.isClicked;
            self.isHovered = false
        end
    else
        if self.isWriting then
            self.isWriting = false;
            self.isClicked = false;
            n.lock_input['move'] = false;
            self.input = self.input:len() > 0 and self.input or ''
            mariolua.log('editbox abort')
        end ;
        self.isHovered = false
    end
end;
function bq.Editbox:GetValue()
    return self.input
end;
function bq.Editbox:SetValue(cO)
    if cO == nil or type(cO) ~= 'string' and type(cO) ~= 'number' and type(cO) ~= 'boolean' then
        self.input = ""
        mariolua.log(self.label .. ', editbox input is nil. Set input to "" ')
    else
        mariolua.log(self.label .. ', set to ' .. cO)
        self.input = tostring(cO)
    end
end;
function bq.Editbox:Render()
    if self.visible then
        self.alpha = s.clamp(self.alpha, 0, 255)
        if p.settings_guistyle:GetItemName() == "UwU" then
            local cP = self.isWriting and { 255, 80, 255 } or (self.isClicked and { 200, 60, 120 } or (self.isHovered and { 235, 80, 235 } or { 220, 80, 140 }))
            w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, cP[1], cP[2], cP[3], self.alpha)
            local cQ, cR = renderer.measure_text('c', self.label)
            local cS = self.isWriting and { 250, 250, 250 } or { 240, 240, 240 }
            renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, self.alpha - 15, 'c', 0, self.label)
            renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, cS[1], cS[2], cS[3], self.alpha - 15, 'c', 0, self.input .. (self.isWriting and '_' or ''))
        elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
            w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
            w.rectangle_outline(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, 50, 50, 50, self.alpha)
            if self.isHovered then
                local cP = self.isClicked and (self.isWriting and { { 32, 32, 32 }, { 40, 40, 40 } } or { { 22, 22, 22 }, { 30, 30, 30 } }) or (self.isWriting and { { 50, 50, 50 }, { 40, 40, 40 } } or { { 40, 40, 40 }, { 30, 30, 30 } })
                renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, cP[1][1], cP[1][2], cP[1][3], self.alpha - 35, cP[2][1], cP[2][2], cP[2][3], self.alpha - 35, true)
            else
                local cP = self.isWriting and { 35, 35, 35 } or { 25, 25, 25 }
                renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, cP[1], cP[2], cP[3], self.alpha - 35, cP[1] - 5, cP[2] - 5, cP[3] - 5, self.alpha - 75, true)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, self.alpha - 15, 'c', 0, self.label)
            local cP = self.isWriting and { n.color[1], n.color[2], n.color[3] } or { 240, 240, 240 }
            renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, cP[1], cP[2], cP[3], self.alpha - 15, 'c', 0, self.input .. (self.isWriting and '_' or ''))
        else
            local cP = self.isWriting and { 255, 255, 255 } or (self.isClicked and { 200, 200, 200 } or (self.isHovered and { 235, 235, 235 } or { 220, 220, 220 }))
            w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, cP[1], cP[2], cP[3], self.alpha)
            local cQ, cR = renderer.measure_text('c', self.label)
            local cS = self.isWriting and { 250, 250, 250 } or { 240, 240, 240 }
            renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, self.alpha - 15, 'c', 0, self.label)
            renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, cS[1], cS[2], cS[3], self.alpha - 15, 'c', 0, self.input .. (self.isWriting and '_' or ''))
        end
    end
end;
function bq.SaveVar:new(cF, cT)
    if type(cF) ~= 'string' then
        mariolua.log(cT .. ': ' .. tostring(cF) .. ' is not a valid reference!')
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'save_var', reference = cF, var = cT }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.SaveVar:GetValue()
    return self.var
end;
function bq.SaveVar:SetValue(cU)
    self.var = cU;
    bq.SaveConfig()
end;
function bq.CObjectItem:new(cV, cH, cI, cJ, aw, cU)
    table.insert(n.reference, "cobject_item_" .. cV:gsub(" ", ""))
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'cobject_item', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, x_dif = 0, y_dif = 0, reference = "cobject_item_" .. cV:gsub(" ", ""), name = cV, isHovered = false, isClicked = false, visible = true, force_invisible = false, is_moving = false, check_ref = false, value = cU or nil }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.CObjectItem:GetValue()
    local cW = "{" .. self.pos.x .. "," .. self.pos.y .. "}"
    return cW
end;
function bq.CObjectItem:SetValue(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.CObjectItem:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.CObjectItem:Update()
    if n.block_moving_indicator or not self.visible then
        return
    end ;
    self.pos.x, self.pos.y = s.clamp(self.pos.x, 5, n.screen_size.w - 5), s.clamp(self.pos.y, 5, n.screen_size.h - 5)
    self.x_dif = not self.is_moving and self.pos.x - n.mouse_x or self.x_dif;
    self.y_dif = not self.is_moving and self.pos.y - n.mouse_y or self.y_dif;
    if (s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) or self.is_moving) and (n.used_Object == "" or n.used_Object == self.reference) then
        if n.mouse1_key_state then
            n.used_Object = self.reference;
            self.isClicked = true;
            self.is_moving = true;
            self:SetPosition(n.mouse_x + self.x_dif, n.mouse_y + self.y_dif)
        elseif not n.mouse1_key_state and self.isClicked ~= false then
            n.used_Object = ""
            self.isClicked = false;
            self.is_moving = false;
            bq.SaveConfig()
        end
    end
end;
function bq.CObjectItem:Render()
    return
end;
function bq.CObject:new(cF, cX)
    table.insert(n.cobject, cF)
    local cK = n.cobject[#n.cobject]
    n.cobject[cK] = { type = 'cobject', items = cX or {}, reference = "cobject_" .. cF }
    self.__index = self;
    return setmetatable(n.cobject[cK], self)
end;
function bq.CObject:GetValue()
    return items
end;
function bq.CObject:AddItem(bo, a9, aa, cJ, aw, cY, q)
    table.insert(self.items, bq.CObjectItem:new(bo, a9, aa, cJ, aw, cY, q))
end;
function bq.IndicatorItem:new(cZ, cH, cI, cJ, aw, cN)
    table.insert(n.reference, "indicator_item_" .. cZ:gsub(" ", ""))
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'indicator_item', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, x_dif = 0, y_dif = 0, reference = "indicator_item_" .. cZ:gsub(" ", ""), text = cZ, isHovered = false, isClicked = false, visible = true, force_invisible = false, is_moving = false, check_ref = false, func = cN or 0 }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.IndicatorItem:GetValue()
    local cW = "{ " .. self.pos.x .. ", " .. self.pos.y .. " }"
    return cW
end;
function bq.IndicatorItem:SetValue(cH, cI)
    cH = s.clamp(cH, 5, n.screen_size.w - 5)
    cI = s.clamp(cI, 5, n.screen_size.h - 5)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.IndicatorItem:SetPosition(cH, cI)
    cH = s.clamp(cH, 5, n.screen_size.w - 5)
    cI = s.clamp(cI, 5, n.screen_size.h - 5)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.IndicatorItem:Update()
    if n.block_moving_indicator or not self.visible then
        return
    end ;
    self.pos.x, self.pos.y = s.clamp(self.pos.x, 5, n.screen_size.w - 5), s.clamp(self.pos.y, 5, n.screen_size.h - 5)
    self.x_dif = not self.is_moving and self.pos.x - n.mouse_x or self.x_dif;
    self.y_dif = not self.is_moving and self.pos.y - n.mouse_y or self.y_dif;
    if (s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) or self.is_moving) and (n.used_Object == "" or n.used_Object == self.reference) then
        if n.mouse1_key_state then
            n.used_Object = self.reference;
            self.isClicked = true;
            self.is_moving = true;
            self:SetPosition(n.mouse_x + self.x_dif, n.mouse_y + self.y_dif)
        elseif not n.mouse1_key_state and self.isClicked ~= false then
            n.used_Object = ""
            self.isClicked = false;
            self.is_moving = false;
            bq.SaveConfig()
        end
    end
end;
function bq.IndicatorItem:Render()
    return
end;
function bq.Indicator:new(cF, cX)
    table.insert(n.indicator, cF)
    local cK = n.indicator[#n.indicator]
    n.indicator[cK] = { type = 'indicator', items = cX or {}, reference = "indicator_" .. cF }
    self.__index = self;
    return setmetatable(n.indicator[cK], self)
end;
function bq.Indicator:GetValue()
    return self.items
end;
function bq.Indicator:AddItem(bo, a9, aa, cJ, aw, cY, q)
    a9 = s.clamp(a9, 0, n.screen_size.w - cJ / 4)
    aa = s.clamp(aa, 0, n.screen_size.h - aw / 4)
    table.insert(self.items, bq.IndicatorItem:new(bo, a9, aa, cJ, aw, cY, q))
end;
function bq.Text:new(cF, cG, cH, cI, cJ, aw, c_, d0, callback)
    if type(cF) ~= "string" then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'text', pos = { x = cH or 0, y = cI or 0 }, flag = c_ or 'c', width = cJ or 0, height = aw or 0, alpha = 255, reference = cF, label = cG, should_save = d0 or false, isHovered = false, isClicked = false, visible = true, force_invisible = false, func = callback }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Text:SetActive(cL)
    self.visible = cL
end;
function bq.Text:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Text:IsActive()
    return self.visible
end;
function bq.Text:GetPosition()
    return self.pos
end;
function bq.Text:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Text:SetFunction(cN)
    self.func = cN
end;
function bq.Text:Update()
    self.visible = self.alpha == 0 and false or self.visible
end;
function bq.Text:Render()
    if not self.visible then
        return
    end ;
    local cQ, cR = renderer.measure_text(self.flag, self.label)
    if self.width == 0 then
        self.width = cQ
    end ;
    if self.height == 0 then
        self.height = cR
    end ;
    renderer.text(self.pos.x, self.pos.y, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), self.flag, 0, self.label)
end;
function bq.Text:GetValue()
    return t.stripchars("'" .. self.label .. "'", "][")
end;
function bq.Text:SetValue(cU)
    self.label = cU
end;
function bq.Groupbox:new(cF, cG, cH, cI, cJ, aw)
    if type(cF) ~= "string" then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'groupbox', pos = { x = cH or 0, y = cI or 0 }, pos_x = cH or 0, pos_y = cI or 0, width = cJ or 0, height = aw or 0, def_width = cJ or 0, def_height = aw or 0, alpha = 255, reference = cF, label = cG, isHovered = false, isClicked = false, visible = true, force_invisible = false }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Groupbox:SetActive(cL)
    self.visible = cL
end;
function bq.Groupbox:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Groupbox:IsActive()
    return self.visible
end;
function bq.Groupbox:GetPosition()
    return self.pos
end;
function bq.Groupbox:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
n.menu = { x = 0, y = 0, w = 0, h = 0 }
function bq.Groupbox:Update()
    if not self.visible then
        return
    end ;
    local d1, d2, d3, d4, d5, d6 = s.rect_getSegmentIntersectionIndices(n.menu.x, n.menu.y, n.menu.w, n.menu.h, self.pos_x + self.pos.x, self.pos_y + self.pos.y, self.pos_x + self.pos.x + self.width, self.pos_y + self.pos.y + self.height, 0, n.screen_size.h)
    d2 = d2 or 0;
    if d2 < 0.98 then
        self.height = s.clamp(self.height - (d2 * 100 - 100) * -1, 0, self.def_height)
    elseif d2 > 1.08 then
        self.height = s.clamp(self.height + d2 * 100 - 100, 0, self.def_height)
    end
end;
function bq.Groupbox:Render()
    if not self.visible then
        return
    end ;
    local d7 = self.pos_x + self.pos.x;
    local d8 = self.pos_y + self.pos.y;
    local d9 = self.width;
    local da = self.height;
    local db = self.alpha;
    local dc, dd = renderer.measure_text("b", self.label)
    renderer.rectangle(d7 + 2, d8 + 2, d9 - 4, da - 4, 40, 40, 40, s.clamp(self.alpha - 205, 0, 255))
    renderer.line(d7, d8, d7 + 12, d8, 0, 0, 0, db)
    renderer.line(d7 + 14 + dc + 2, d8, d7 + d9, d8, 0, 0, 0, db)
    renderer.line(d7 + d9, d8, d7 + d9, d8 + da, 0, 0, 0, db)
    renderer.line(d7 + d9, d8 + da, d7, d8 + da, 0, 0, 0, db)
    renderer.line(d7, d8 + da, d7, d8, 0, 0, 0, db)
    renderer.line(d7 + 1, d8 + 1, d7 + 12, d8 + 1, 48, 48, 48, db)
    renderer.line(d7 + 14 + dc + 2, d8 + 1, d7 + d9 - 1, d8 + 1, 48, 48, 48, db)
    renderer.line(d7 + d9 - 1, d8 + 1, d7 + d9 - 1, d8 + da - 1, 48, 48, 48, db)
    renderer.line(d7 + d9 - 1, d8 + da - 1, d7 + 1, d8 + da - 1, 48, 48, 48, db)
    renderer.line(d7 + 1, d8 + da - 1, d7 + 1, d8 + 1, 48, 48, 48, db)
    renderer.text(d7 + 14, d8 - 6, 203, 203, 203, db, "b", 0, self.label)
end;
function bq.Groupbox:GetValue()
    return t.stripchars("'" .. self.label .. "'", "][")
end;
function bq.Groupbox:SetValue(cU)
    self.label = cU
end;
function bq.Slider:new(cF, cG, cH, cI, cJ, aw, de, df, dg)
    if type(cF) ~= "string" then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'slider', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 100, height = aw or 24, alpha = 255, min_val = df, max_val = dg, def_val = de, relative_pos = 0, circle_pos = cJ * de / dg or 0, x_var = x_var, reference = cF, label = cG, onRefreshRender = false, onRefreshUpdate = false, isHovered = false, isClicked = false, holding_slider = false, released_slider = false, visible = true, force_invisible = false }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Slider:SetActive(cL)
    self.visible = cL
end;
function bq.Slider:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Slider:IsActive()
    return self.visible
end;
function bq.Slider:GetPosition()
    return self.pos
end;
function bq.Slider:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Slider:SetFunction(cN)
    self.func = cN
end;
function bq.Slider:Update()
    self.visible = self.alpha == 0 and false or self.visible;
    if not self.visible then
        return
    end ;
    local cQ, cR = renderer.measure_text('c', self.label)
    local dh = s.IsNumberNegative(self.min_val)
    local di = dh and self.width / 2 or self.width;
    local dj = self.pos.y + cR + 6;
    local dk = dh and self.width / 2 + self.pos.x + 6 or self.pos.x + 6;
    local dl = { dk - 2, dj + self.height, dk + di + 2, dj + self.height * 2 }
    dl[1] = dh and dl[1] - di or dl[1]
    if (s.inBounds(dl[1], dl[2], dl[3], dl[4]) or self.isClicked) and (n.used_Object == "" or n.used_Object == self.reference) then
        self.isHovered = true;
        if n.mouse1_key_state then
            n.used_Object = self.reference;
            self.isClicked = true
        else
            n.used_Object = ""
            self.isClicked = false
        end ;
        if n.mouse1_key_state and self.holding_slider ~= true then
            self.holding_slider = true
        elseif not n.mouse1_key_state and self.holding_slider ~= false then
            self.holding_slider = false;
            self.released_slider = true;
            if self.released_slider then
                bq.SaveConfig()
                self.released_slider = false
            end
        end
    else
        if self.isClicked and not n.mouse1_key_state then
            n.used_Object = ""
            self.isClicked = false
        end ;
        self.isHovered = false
    end ;
    if self.x_var == nil and self.def_val == nil then
        self.x_var = 0
    elseif self.def_val ~= nil and self.x_var == nil then
        self.x_var = self.def_val
    end ;
    if self.isClicked then
        self.relative_pos = s.clamp(n.mouse_x - dk, self.min_val, di)
        local dm = self.relative_pos / di * self.max_val;
        self.x_var = dh and s.clamp(dm, self.min_val, self.max_val) or dm;
        self.circle_pos = di * self.x_var / self.max_val
    else
        self.circle_pos = di * self.x_var / self.max_val
    end
end;
function bq.Slider:Render()
    if self.visible then
        local cQ, cR = renderer.measure_text('c', self.label)
        local dh = s.IsNumberNegative(self.min_val)
        local di = dh and self.width / 2 or self.width;
        local dj = self.pos.y + cR + 6;
        local dk = dh and self.width / 2 + self.pos.x + 6 or self.pos.x + 6;
        local dn = { dk, dj + 2, self.circle_pos, self.height - 4 }
        local dp = { dk + self.circle_pos, dj + 2, di - self.circle_pos, self.height - 4 }
        local dq = { dk, dj + self.height / 2 }
        local dr = { dk + di, dj + self.height / 2 }
        dq[1] = dh and dq[1] - di or dq[1]
        dn[1] = dh and dn[1] - di or dn[1]
        dn[3] = dh and dn[3] + di or dn[3]
        if p.settings_guistyle:GetItemName() == "UwU" then
            renderer.circle_outline(dq[1], dq[2], 150, 100, 200, self.alpha, self.height / 2 - 2, 0, 1, self.height / 2)
            renderer.circle_outline(dr[1], dr[2], 130, 100, 150, self.alpha, self.height / 2 - 2, 0, 1, self.height / 2)
            renderer.rectangle(dn[1], dn[2], dn[3], dn[4], 150, 100, 200, self.alpha)
            renderer.rectangle(dp[1], dp[2], dp[3], dp[4], 130, 100, 150, self.alpha)
            w.draw_svg(w.gpx.svg['slider_circle'], dk + self.circle_pos - 6, dj, self.height, self.height, 255, 255, 255, self.alpha)
            dk = dh and dk - di or dk;
            renderer.text(dk + cQ / 2, dj - cR, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
            local ds, dt = renderer.measure_text('b', s.round(self.x_var))
            if self.isClicked then
                renderer.text(dk + self.circle_pos - ds / 2, dj - dt - dt / 2, 240, 240, 240, self.alpha, 'b', 0, s.round(self.x_var, 0))
            else
                renderer.text(dk + self.circle_pos - ds / 2, dj + self.height, 220, 220, 220, self.alpha, 'b', 0, s.round(self.x_var, 0))
            end
        else
            renderer.circle_outline(dr[1], dr[2], 53, 53, 53, self.alpha, self.height / 2 - 2, 0, 1, self.height / 2)
            renderer.circle_outline(dq[1], dq[2], 151, 151, 151, self.alpha, self.height / 2 - 2, 0, 1, self.height / 2)
            renderer.rectangle(dn[1], dn[2], dn[3], dn[4], 151, 151, 151, self.alpha)
            renderer.rectangle(dp[1], dp[2], dp[3], dp[4], 53, 53, 53, self.alpha)
            w.draw_svg(w.gpx.svg['slider_circle'], dk + self.circle_pos - 6, dj, self.height, self.height, 255, 255, 255, self.alpha)
            dk = dh and dk - di or dk;
            renderer.text(dk + cQ / 2, dj - cR, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
            local ds, dt = renderer.measure_text('b', s.round(self.x_var))
            if self.isClicked then
                renderer.text(dp[1] - ds / 2, dj - dt - dt / 2, 240, 240, 240, self.alpha, 'b', 0, s.round(self.x_var, 0))
            else
                renderer.text(dp[1] - ds / 2, dj + self.height, 220, 220, 220, s.clamp(self.alpha - 15, 0, 255), 'b', 0, s.round(self.x_var, 0))
            end
        end
    end
end;
function bq.Slider:GetValue()
    return s.clamp(s.round(self.x_var), self.min_val, self.max_val)
end;
function bq.Slider:SetValue(du)
    if du == nil then
        mariolua.log("Trying to set slider value to a nil!")
        return
    end ;
    self.x_var = s.clamp(du, self.min_val, self.max_val)
end;
function bq.MultiboxItem:new(cw, cZ)
    table.insert(n.reference, "multibox_item_" .. cw .. '_' .. cZ:gsub(" ", ""))
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'multibox_item', text = cZ, isEnabled = false, isClicked = false, reference = "multibox_item_" .. cw .. '_' .. cZ:gsub(" ", "") }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.MultiboxItem:GetValue()
    return self.isEnabled
end;
function bq.MultiboxItem:SetValue(as)
    self.isEnabled = as;
    self.onRefresh = true
end;
function bq.Multibox:new(cF, cG, cH, cI, cJ, aw, cX, dv)
    if type(cF) ~= "string" then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'multibox', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, old_w = cJ or 0, old_h = aw or 0, alpha = 255, reference = cF, label = cG, isHovered = false, isClicked = false, isOpen = false, maxSize = 0, visible = true, force_invisible = false, items = cX or {}, enabled_items = enabled_items or {}, enabledItemsText = "", one_enabled = dv or false, func = callback }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Multibox:SetActive(cL)
    self.visible = cL
end;
function bq.Multibox:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Multibox:IsActive()
    return self.visible
end;
function bq.Multibox:GetPosition()
    return self.pos
end;
function bq.Multibox:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Multibox:SetFunction(cN)
    self.func = cN
end;
function bq.Multibox:GetValue()
    return self.enabled_items
end;
function bq.Multibox:IsEnabled(dw)
    for I = 1, #self.items do
        if self.items[I].text == dw and self.items[I].isEnabled then
            return true
        end
    end
end;
function bq.Multibox:GetByIndex(dx)
    local dy = self.items[dx].isEnabled;
    return dy
end;
function bq.Multibox:GetByName(aU)
    for I = 1, #self.items do
        if self.items[I].text == aU then
            return self.items[I]
        end
    end
end;
function bq.Multibox:SetValue(H)
    H = H or {}
    local enabled_items = {}
    for I = 1, #self.items do
        local dz = self.items[I]
        if u.exists(H, dz.text) then
            dz.isEnabled = true;
            table.insert(enabled_items, dz.text)
        else
            dz.isEnabled = false
        end
    end ;
    bq.SaveConfig()
    self.enabled_items = enabled_items;
    if u.table_to_text then
        self.enabledItemsText = u.table_to_text(self.enabled_items, self.width - 15)
    else
        self.enabledItemsText = ''
    end
end;
function bq.Multibox:SetItems(items)
    self.items = items
end;
function bq.Multibox:AddItem(cw, aU)
    table.insert(self.items, bq.MultiboxItem:new(cw, aU))
end;
function bq.Multibox:Update()
    self.visible = self.alpha == 0 and false or self.visible;
    if self.visible or self.onRefresh and n.used_Object == "" then
        if s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) then
            self.isHovered = true;
            if self.maxSize == nil then
                self.maxSize = 0
            end ;
            if n.mouse1_key_state and (n.used_Object == "" or n.used_Object == self.reference) or n.mouse1_key_state and self.isOpen then
                self.isClicked = true;
                n.used_Object = self.reference
            elseif self.isClicked then
                n.used_Object = ""
                self.isClicked = false;
                if self.isOpen == false then
                    self.isOpen = true;
                    self.maxSize = self.height * (#self.items + 1)
                elseif self.isOpen then
                    self.isOpen = false;
                    self.maxSize = 0;
                    bq.SaveConfig()
                end
            end
        elseif not s.inBounds(self.pos.x, self.pos.y + self.height, self.pos.x + self.width, self.pos.y + self.height * (#self.items + 1)) and n.mouse1_key_state and self.isOpen then
            self.isOpen = false;
            self.maxSize = 0;
            self.isHovered = false;
            bq.SaveConfig()
        elseif s.inBounds(self.pos.x, self.pos.y + self.height, self.pos.x + self.width, self.pos.y + self.height * (#self.items + 1)) and self.isOpen or self.onRefresh and n.used_Object == "" then
            for I = 1, #self.items do
                local dz = self.items[I]
                if dz.onRefresh and n.used_Object == "" then
                    if dz.isEnabled then
                        self.enabledItemsText = u.table_to_text(self.enabled_items, self.width - 15)
                        dz.onRefresh = false
                    end ;
                    if I >= #self.items then
                        dz.onRefresh = false
                    end
                end ;
                if s.inBounds(self.pos.x, self.pos.y + I * self.height, self.pos.x + self.width, self.pos.y + I * self.height + self.height) and (n.used_Object == "" or n.used_Object == dz.reference) then
                    if n.mouse1_key_state then
                        n.used_Object = dz.reference;
                        dz.isClicked = true;
                        if bq.SaveConfig() ~= nil then
                            bq.SaveConfig()
                        end
                    elseif dz.isClicked then
                        n.used_Object = ""
                        dz.isClicked = false;
                        if dz.isEnabled ~= true then
                            dz.isEnabled = true;
                            self.enabledItemsText = u.table_to_text(self.enabled_items, self.width - 15)
                        elseif dz.isEnabled ~= false then
                            dz.isEnabled = false;
                            self.enabledItemsText = u.table_to_text(self.enabled_items, self.width - 15)
                        end ;
                        if bq.SaveConfig() ~= nil then
                            bq.SaveConfig()
                        end
                    end
                end
            end
        else
            self.isHovered = false
        end ;
        if self.maxSize == nil then
            self.maxSize = 0
        end
    else
        self.isOpen = false;
        self.maxSize = 0;
        self.isClicked = false;
        self.isHovered = false
    end ;
    for I = 1, #self.items do
        local dz = self.items[I]
        if dz.isEnabled and not u.Contains(self.enabled_items, dz.text) then
            table.insert(self.enabled_items, dz.text)
            self.enabledItemsText = u.table_to_text(self.enabled_items, self.width - 15)
        elseif not dz.isEnabled and u.Contains(self.enabled_items, dz.text) then
            for cl = 1, #self.enabled_items do
                if self.enabled_items[cl] == dz.text then
                    table.remove(self.enabled_items, cl)
                    self.enabledItemsText = u.table_to_text(self.enabled_items, self.width - 15)
                end
            end
        end ;
        if dz.onRefresh then
            self.onRefresh = true
        else
            self.onRefresh = false
        end
    end
end;
function bq.Multibox:Render()
    if self.visible then
        if self.isOpen then
            if p.settings_guistyle:GetItemName() == "Aimware" or p.settings_guistyle:GetItemName() == "Fuhrer" then
                w.draw_svg(w.gpx.svg['combobox_open'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            elseif p.settings_guistyle:GetItemName() == "UwU" then
                w.draw_svg(w.gpx.svg['combobox_open'], self.pos.x, self.pos.y, self.width, self.height, 150, 100, 180, self.alpha)
            elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
                w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
                renderer.gradient(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, 35, 35, 35, self.alpha, 30, 30, 30, self.alpha, true)
            end ;
            for I = 1, #self.items do
                local dz = self.items[I]
                if p.settings_guistyle:GetItemName() == "Aimware" then
                    if s.inBounds(self.pos.x, self.pos.y + I * self.height, self.pos.x + self.width, self.pos.y + I * self.height + self.height) then
                        if I == #self.items then
                            w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                        else
                            w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                        end
                    else
                        if dz.isEnabled then
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            end
                        else
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_between'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            end
                        end
                    end ;
                    local cQ, cR = renderer.measure_text('c', dz.text)
                    renderer.text(self.pos.x + cQ / 2 + 5, self.pos.y + I * self.height + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, dz.text)
                elseif p.settings_guistyle:GetItemName() == "UwU" then
                    if s.inBounds(self.pos.x, self.pos.y + I * self.height, self.pos.x + self.width, self.pos.y + I * self.height + self.height) then
                        if I == #self.items then
                            w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                        else
                            w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                        end
                    else
                        if dz.isEnabled then
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            end
                        else
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_between'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            end
                        end
                    end ;
                    local cQ, cR = renderer.measure_text('c', dz.text)
                    renderer.text(self.pos.x + cQ / 2 + 5, self.pos.y + I * self.height + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, dz.text)
                elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
                    if s.inBounds(self.pos.x, self.pos.y + I * self.height, self.pos.x + self.width, self.pos.y + I * self.height + self.height) then
                        local dA, dB, dC, dD = 25, 25, 25, self.alpha;
                        if I == #self.items then
                            renderer.gradient(self.pos.x + 1, self.pos.y + I * self.height + 1, self.width - 2, self.height, dA, dB, dC, dD, dA - 5, dB - 5, dC - 5, dD, true)
                        else
                            renderer.gradient(self.pos.x, self.pos.y + I * self.height + 2, self.width, self.height, dA, dB, dC, dD, dA - 5, dB - 5, dC - 5, dD, true)
                        end
                    else
                        local dA, dB, dC, dD = 35, 35, 35, self.alpha;
                        if I == #self.items then
                            renderer.gradient(self.pos.x + 1, self.pos.y + I * self.height + 1, self.width - 2, self.height, dA, dB, dC, dD, dA - 5, dB - 5, dC - 5, dD, true)
                        else
                            renderer.gradient(self.pos.x, self.pos.y + I * self.height + 2, self.width, self.height, dA, dB, dC, dD, dA - 5, dB - 5, dC - 5, dD, true)
                        end
                    end ;
                    w.rectangle_outline(self.pos.x, self.pos.y + self.height + 2, self.width, #self.items * self.height, 12, 12, 12, self.alpha)
                    local cQ, cR = renderer.measure_text('c', dz.text)
                    if dz.isEnabled then
                        renderer.text(self.pos.x + cQ / 2 + 5, self.pos.y + I * self.height + self.height / 2, n.color[1], n.color[2], n.color[3], self.alpha, 'c', 0, dz.text)
                    else
                        renderer.text(self.pos.x + cQ / 2 + 5, self.pos.y + I * self.height + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, dz.text)
                    end
                end
            end
        end ;
        if p.settings_guistyle:GetItemName() == "Aimware" or p.settings_guistyle:GetItemName() == "Fuhrer" then
            w.draw_svg(w.gpx.svg['combobox_closed'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
        elseif p.settings_guistyle:GetItemName() == "UwU" then
            w.draw_svg(w.gpx.svg['combobox_closed'], self.pos.x, self.pos.y, self.width, self.height, 150, 100, 180, self.alpha)
        elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
            local ap, av, a5, G;
            if self.isHovered then
                ap, av, a5, G = 45, 45, 45, self.alpha
            else
                ap, av, a5, G = 35, 35, 35, self.alpha
            end ;
            w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
            renderer.gradient(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, ap, av, a5, G, ap - 5, av - 5, a5 - 5, G, true)
            if not self.isOpen then
                renderer.rectangle(self.pos.x + self.width - 14, self.pos.y + 11, 5, 1, 181, 181, 181, self.alpha)
                renderer.rectangle(self.pos.x + self.width - 13, self.pos.y + 12, 3, 1, 181, 181, 181, self.alpha)
                renderer.rectangle(self.pos.x + self.width - 12, self.pos.y + 13, 1, 1, 181, 181, 181, self.alpha)
            end
        end ;
        if p.settings_guistyle:GetItemName() == 'Gamesense' then
            if self.isOpen then
                renderer.rectangle(self.pos.x + self.width - 12, self.pos.y + 11, 1, 1, 181, 181, 181, self.alpha)
                renderer.rectangle(self.pos.x + self.width - 13, self.pos.y + 12, 3, 1, 181, 181, 181, self.alpha)
                renderer.rectangle(self.pos.x + self.width - 14, self.pos.y + 13, 5, 1, 181, 181, 181, self.alpha)
            end
        elseif p.settings_guistyle:GetItemName() == "Aimware" or p.settings_guistyle:GetItemName() == "Fuhrer" then
            w.draw_svg(w.gpx.svg['combobox_arrow'], self.pos.x + self.width - (12 + 24 - self.height) - 5, self.pos.y, 12 + 24 - self.height, self.height, 255, 255, 255, self.alpha)
        end ;
        local dE, dF, dG, dH;
        if p.settings_guistyle:GetItemName() == "Aimware" or p.settings_guistyle:GetItemName() == "Fuhrer" then
            dE, dF, dG, dH = 30, 30, 30, s.clamp(self.alpha - 15, 0, 255)
        elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
            dE, dF, dG, dH = 180, 180, 180, s.clamp(self.alpha - 15, 0, 255)
        else
            dE, dF, dG, dH = 200, 150, 180, s.clamp(self.alpha - 15, 0, 255)
        end ;
        local dI, dJ = renderer.measure_text('c', self.enabledItemsText)
        renderer.text(self.pos.x + dI / 2 + 5, self.pos.y + self.height / 2, dE, dF, dG, dH, 'c', 0, self.enabledItemsText)
        local cQ, cR = renderer.measure_text('c', self.label)
        renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
    end
end;
function bq.ComboboxItem:new(cw, cZ)
    if cZ == nil then
        return
    end ;
    local cK = cw .. '.combobox.' .. cZ:gsub(' ', '_'):lower()
    n.reference[cK] = { type = 'combobox_item', text = cZ, isEnabled = false, isClicked = false, reference = cw .. '.item.' .. cZ:gsub(' ', '_') }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Combobox:new(cF, cG, cH, cI, cJ, aw, cX, dK)
    if type(cF) ~= 'string' then
        mariolua.log(cG .. ': ' .. tostring(cF) .. ' is not a valid reference!')
        return
    end ;
    cX = cX or {}
    local dL = {}
    for I = 1, #cX do
        cX[I] = bq.ComboboxItem:new(cF, cX[I])
        dL[I] = cX[I]
    end ;
    dK = type(dK) == 'number' and dK or 1;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'combobox', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, alpha = 255, reference = cF, label = cG, isHovered = false, isClicked = false, isOpen = false, maxSize = 0, visible = true, force_invisible = false, items = cX or {}, item_list = dL or {}, enabledItem = dK or 1 }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Combobox:Update()
    self.visible = self.alpha == 0 and false or self.visible;
    if self.enabledItem == nil then
        self.enabledItem = 1
    else
        if type(self.enabledItem) == 'boolean' or type(self.enabledItem) == 'string' then
            self.enabledItem = 1
        end ;
        if tonumber(self.enabledItem) <= 0 then
            self.enabledItem = 1
        end
    end ;
    self.visible = self.alpha == 0 and false or self.visible;
    if self.visible then
        if s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) and (n.used_Object == '' or n.used_Object == self.reference) then
            self.isHovered = true;
            if self.maxSize == nil then
                self.maxSize = 0
            end ;
            if n.mouse1_key_state then
                n.used_Object = self.reference;
                self.isClicked = true
            elseif self.isClicked then
                n.used_Object = ''
                self.isClicked = false;
                if self.isOpen == false then
                    self.isOpen = true;
                    self.maxSize = self.height * (#self.items + 1)
                elseif self.isOpen then
                    self.isOpen = false;
                    self.maxSize = 0
                end
            end
        else
            if not s.inBounds(self.pos.x, self.pos.y + self.height, self.pos.x + self.width, self.pos.y + self.maxSize) and n.mouse1_key_state and self.isOpen then
                self.isOpen = false;
                self.maxSize = 0
            end ;
            self.isHovered = false
        end ;
        if self.maxSize == nil then
            self.maxSize = 0
        end ;
        for I = 1, #self.items do
            local dz = self.items[I]
            if self.isOpen and s.inBounds(self.pos.x, self.pos.y + I * self.height, self.pos.x + self.width, self.pos.y + I * self.height + self.height) then
                if n.mouse1_key_state then
                    dz.isClicked = true
                elseif dz.isClicked then
                    dz.isClicked = false;
                    if dz.isEnabled == false then
                        if self.enabledItem ~= I and self.enabledItem ~= 0 then
                            if self.items[self.enabledItem] ~= nil then
                                self.items[self.enabledItem].isEnabled = false
                            end ;
                            dz.isEnabled = true;
                            self.enabledItem = I
                        end ;
                        if self.enabledItem <= 0 then
                            self.items[1].isEnabled = true;
                            self.enabledItem = 1
                        end ;
                        bq.SaveConfig()
                    elseif dz.isEnabled then
                        if self.enabledItem == I then
                            dz.isEnabled = false;
                            self.enabledItem = 1;
                            bq.SaveConfig()
                        end
                    end
                end
            end ;
            if dz.isEnabled == false and self.enabledItem == I then
                dz.isEnabled = true;
                bq.SaveConfig()
            elseif dz.isEnabled == true and self.enabledItem ~= I then
                dz.isEnabled = false;
                bq.SaveConfig()
            end
        end
    else
        self.isOpen = false;
        self.maxSize = 0;
        self.isClicked = false;
        self.isHovered = false
    end
end;
function bq.Combobox:Render()
    if self.visible then
        if self.isOpen then
            if p.settings_guistyle:GetItemName() == 'Aimware' or p.settings_guistyle:GetItemName() == 'Fuhrer' then
                w.draw_svg(w.gpx.svg['combobox_open'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            elseif p.settings_guistyle:GetItemName() == 'UwU' then
                w.draw_svg(w.gpx.svg['combobox_open'], self.pos.x, self.pos.y, self.width, self.height, 150, 100, 180, self.alpha)
            elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
                w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
                renderer.gradient(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, 35, 35, 35, self.alpha, 30, 30, 30, self.alpha, true)
            end ;
            for I = 1, #self.items do
                local dz = self.items[I]
                if s.inBounds(self.pos.x, self.pos.y + I * self.height, self.pos.x + self.width, self.pos.y + I * self.height + self.height) then
                    if p.settings_guistyle:GetItemName() == 'Aimware' or p.settings_guistyle:GetItemName() == 'Fuhrer' then
                        if I == #self.items then
                            w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                        else
                            w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                        end
                    elseif p.settings_guistyle:GetItemName() == 'UwU' then
                        if I == #self.items then
                            w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                        else
                            w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                        end
                    elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
                        local dA, dB, dC, dD = 25, 25, 25, self.alpha;
                        if I == #self.items then
                            renderer.gradient(self.pos.x + 1, self.pos.y + I * self.height + 1, self.width - 2, self.height, dA, dB, dC, dD, dA - 5, dB - 5, dC - 5, dD, true)
                        else
                            renderer.gradient(self.pos.x, self.pos.y + I * self.height + 2, self.width, self.height, dA, dB, dC, dD, dA - 5, dB - 5, dC - 5, dD, true)
                        end
                    end
                else
                    if p.settings_guistyle:GetItemName() == 'Aimware' or p.settings_guistyle:GetItemName() == 'Fuhrer' then
                        if dz.isEnabled then
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            end
                        else
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_between'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 255, 255, self.alpha)
                            end
                        end
                    elseif p.settings_guistyle:GetItemName() == 'UwU' then
                        if dz.isEnabled then
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox_between_mouse_over'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            end
                        else
                            if I == #self.items then
                                w.draw_svg(w.gpx.svg['combobox_itembox_between'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            else
                                w.draw_svg(w.gpx.svg['combobox_itembox'], self.pos.x, self.pos.y + I * self.height, self.width, self.height, 255, 60, 180, self.alpha)
                            end
                        end
                    elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
                        renderer.gradient(self.pos.x, self.pos.y + I * self.height + 2, self.width, self.height, 35, 35, 35, self.alpha, 30, 30, 30, self.alpha, true)
                        w.rectangle_outline(self.pos.x, self.pos.y + self.height + 2, self.width, #self.items * self.height, 12, 12, 12, self.alpha)
                        renderer.rectangle(self.pos.x + self.width - 12, self.pos.y + 11, 1, 1, 181, 181, 181, self.alpha)
                        renderer.rectangle(self.pos.x + self.width - 13, self.pos.y + 12, 3, 1, 181, 181, 181, self.alpha)
                        renderer.rectangle(self.pos.x + self.width - 14, self.pos.y + 13, 5, 1, 181, 181, 181, self.alpha)
                    end
                end ;
                local cQ, cR = renderer.measure_text('c', dz.text)
                if dz.isEnabled and p.settings_guistyle:GetItemName() == 'Gamesense' then
                    renderer.text(self.pos.x + cQ / 2 + 5, self.pos.y + I * self.height + self.height / 2, n.color[1], n.color[1], n.color[1], self.alpha, 'c', 0, dz.text)
                else
                    renderer.text(self.pos.x + cQ / 2 + 5, self.pos.y + I * self.height + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, dz.text)
                end ;
                if self.enabledItem == 0 or self.enabledItem == tostring(0) or self.enabledItem == I and not self.items[I].isEnabled then
                    if I > 0 then
                        self.enabledItem = I;
                        self.items[I].isEnabled = true;
                        if bq.SaveConfig() ~= nil then
                            bq.SaveConfig()
                        end
                    end
                end
            end
        else
            if p.settings_guistyle:GetItemName() == 'Aimware' or p.settings_guistyle:GetItemName() == 'Fuhrer' then
                w.draw_svg(w.gpx.svg['combobox_closed'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            elseif p.settings_guistyle:GetItemName() == 'UwU' then
                w.draw_svg(w.gpx.svg['combobox_closed'], self.pos.x, self.pos.y, self.width, self.height, 150, 100, 180, self.alpha)
            elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
                local ap, av, a5, G;
                if self.isHovered or self.isOpen then
                    ap, av, a5, G = 45, 45, 45, self.alpha
                else
                    ap, av, a5, G = 35, 35, 35, self.alpha
                end ;
                w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
                renderer.gradient(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, ap, av, a5, G, ap - 5, av - 5, a5 - 5, G, true)
                renderer.rectangle(self.pos.x + self.width - 14, self.pos.y + 11, 5, 1, 181, 181, 181, self.alpha)
                renderer.rectangle(self.pos.x + self.width - 13, self.pos.y + 12, 3, 1, 181, 181, 181, self.alpha)
                renderer.rectangle(self.pos.x + self.width - 12, self.pos.y + 13, 1, 1, 181, 181, 181, self.alpha)
            end
        end ;
        local dM;
        if self.enabledItem == 0 or self.items[self.enabledItem] == nil then
            dM = ''
        else
            dM = self.items[self.enabledItem].text
        end ;
        if self.enabledItem == 0 or tonumber(self.enabledItem) == 0 then
            self.enabledItem = 1;
            self.items[1].isEnabled = true;
            bq.SaveConfig()
        end ;
        self.enabledItem = s.clamp(self.enabledItem, 1, 99)
        if self.items[self.enabledItem] ~= nil then
            self.items[self.enabledItem].isEnabled = true
        end ;
        if p.settings_guistyle:GetItemName() == 'Aimware' or p.settings_guistyle:GetItemName() == 'Fuhrer' then
            w.draw_svg(w.gpx.svg['combobox_arrow'], self.pos.x + self.width - (12 + 24 - self.height) - 5, self.pos.y, 12 + 24 - self.height, self.height, 255, 255, 255, self.alpha)
        elseif p.settings_guistyle:GetItemName() == 'UwU' then
            w.draw_svg(w.gpx.svg['combobox_arrow'], self.pos.x + self.width - (12 + 24 - self.height) - 5, self.pos.y, 12 + 24 - self.height, self.height, 255, 60, 180, self.alpha)
        end ;
        local dI, dJ = renderer.measure_text('c', dM)
        if p.settings_guistyle:GetItemName() == 'Aimware' or p.settings_guistyle:GetItemName() == 'Fuhrer' then
            renderer.text(self.pos.x + dI / 2 + 5, self.pos.y + self.height / 2, 30, 30, 30, s.clamp(self.alpha - 15, 0, 255), 'c', 0, dM)
        elseif p.settings_guistyle:GetItemName() == 'UwU' then
            renderer.text(self.pos.x + dI / 2 + 5, self.pos.y + self.height / 2, 200, 150, 180, s.clamp(self.alpha - 15, 0, 255), 'c', 0, dM)
        elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
            renderer.text(self.pos.x + dI / 2 + 5, self.pos.y + self.height / 2, 180, 180, 180, s.clamp(self.alpha - 15, 0, 255), 'c', 0, dM)
        end ;
        local cQ, cR = renderer.measure_text('c', self.label)
        renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
    end
end;
function bq.Combobox:SetActive(cL)
    self.visible = cL
end;
function bq.Combobox:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Combobox:IsActive()
    return self.visible
end;
function bq.Combobox:GetPosition()
    return self.pos
end;
function bq.Combobox:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Combobox:SetFunction(cN)
    self.func = cN
end;
function bq.Combobox:SetItems(items)
    if items == nil then
        return
    end ;
    for I = 1, #items do
        if items[I] == nil then
            return
        end ;
        table.insert(self.items, bq.ComboboxItem:new(self.reference, items[I]))
    end ;
    self.item_list = items
end;
function bq.Combobox:AddItem(aU)
    if aU == nil then
        return
    end ;
    table.insert(self.items, bq.ComboboxItem:new(self.reference, aU))
    table.insert(self.item_list, aU)
end;
function bq.Combobox:GetValue()
    return self.enabledItem
end;
function bq.Combobox:GetItemName()
    if self.items[self.enabledItem] ~= nil then
        return self.items[self.enabledItem].text
    else
        return false
    end
end;
function bq.Combobox:SetValue(dw, H)
    H = H or true;
    if type(dw) == 'string' then
        for I = 1, #self.items do
            local dN = self.items[I].text;
            if dN == dw then
                self.items[I].isEnabled = H;
                self.enabledItem = H and I or self.enabledItem;
                return
            end
        end
    else
        self.enabledItem = H and dw or self.enabledItem;
        self.items[dw].isEnabled = H
    end
end;
function bq.Combobox:GetItems()
    return self.item_list
end;
function bq.Checkbox:new(cF, cG, cH, cI, cJ, aw, dO, callback, dP, dQ)
    if type(cF) ~= 'string' then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'checkbox', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, alpha = 255, reference = cF, label = cG, isHovered = false, isClicked = false, isEnabled = dO or false, visible = true, force_invisible = false, func = callback or nil, on_enable_func = dP or nil, on_disable_func = dQ or nil }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Checkbox:SetActive(cL)
    self.visible = cL
end;
function bq.Checkbox:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Checkbox:IsActive()
    return self.visible
end;
function bq.Checkbox:GetPosition()
    return self.pos
end;
function bq.Checkbox:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Checkbox:SetFunction(cN)
    self.func = cN
end;
function bq.Checkbox:Update()
    self.visible = self.alpha == 0 and false or self.visible;
    if self.visible then
        self.isEnabled = self.isEnabled or false;
        if self.isEnabled and self.func then
            self.func()
        end ;
        if s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) and (n.used_Object == "" or n.used_Object == self.reference) then
            self.isHovered = true;
            if n.mouse1_key_state then
                n.used_Object = self.reference;
                self.isClicked = true
            elseif self.isClicked then
                n.used_Object = ""
                self.isClicked = false;
                if not self.isEnabled then
                    self.isEnabled = true;
                    if self.on_enable_func then
                        self.on_enable_func()
                    end
                elseif self.isEnabled then
                    self.isEnabled = false;
                    if self.on_enable_func then
                        self.on_disable_func()
                    end
                end ;
                bq.SaveConfig()
            end
        else
            self.isHovered = false
        end
    end
end;
function bq.Checkbox:Render()
    if self.visible then
        if p.settings_guistyle:GetItemName() == "Aimware" then
            if self.isHovered then
                if self.isEnabled then
                    w.draw_svg(w.gpx.svg['checkbox_checked'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
                    renderer.rectangle(self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, s.clamp(self.alpha - 205, 0, 255))
                else
                    w.draw_svg(w.gpx.svg['checkbox_unchecked_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
                end
            elseif self.isEnabled then
                w.draw_svg(w.gpx.svg['checkbox_checked'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            else
                w.draw_svg(w.gpx.svg['checkbox_unchecked'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + self.width + cQ / 2 + 7, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
        elseif p.settings_guistyle:GetItemName() == "UwU" then
            if self.isHovered then
                if self.isEnabled then
                    w.draw_svg(w.gpx.svg['checkbox_checked'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
                    renderer.rectangle(self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, s.clamp(self.alpha - 205, 0, 255))
                else
                    w.draw_svg(w.gpx.svg['checkbox_unchecked_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
                end
            elseif self.isEnabled then
                w.draw_svg(w.gpx.svg['checkbox_checked'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
            else
                w.draw_svg(w.gpx.svg['checkbox_unchecked'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + self.width + cQ / 2 + 7, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
        elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
            w.rectangle_outline(self.pos.x + 8, self.pos.y + 8, 10, 10, 12, 12, 12, self.alpha)
            if self.isEnabled then
                renderer.rectangle(self.pos.x + 9, self.pos.y + 9, 8, 8, n.color[1], n.color[2], n.color[3], self.alpha)
            else
                renderer.rectangle(self.pos.x + 9, self.pos.y + 9, 8, 8, 35, 35, 35, self.alpha)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + self.width + cQ / 2 + 7, self.pos.y + 12, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
        else
            if self.isHovered then
                if self.isEnabled then
                    w.draw_svg(w.gpx.svg['checkbox_checked'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
                    renderer.rectangle(self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, s.clamp(self.alpha - 205, 0, 255))
                else
                    w.draw_svg(w.gpx.svg['checkbox_unchecked_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
                end
            elseif self.isEnabled then
                w.draw_svg(w.gpx.svg['checkbox_checked'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            else
                w.draw_svg(w.gpx.svg['checkbox_unchecked'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + self.width + cQ / 2 + 7, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
        end
    end
end;
function bq.Checkbox:GetValue()
    return self.isEnabled
end;
function bq.Checkbox:SetValue(dR)
    if dR == nil or type(dR) ~= "boolean" then
        if type(dR) == "string" then
            if dR == "true" then
                self.isEnabled = true
            else
                self.isEnabled = false
            end
        else
            mariolua.log("Can set " .. self.label .. " " .. self.type .. " argument is a nil")
            self.isEnabled = false
        end
    else
        self.isEnabled = dR
    end
end;
function bq.Keybox:new(cF, cG, cH, cI, cJ, aw, callback)
    if type(cF) ~= "string" then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'keybox', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, old_w = cJ or 0, old_h = aw or 0, alpha = 255, reference = cF, label = cG, bSet = false, hold_count = 0, isHovered = false, isClicked = false, isBinding = false, isKeyDown = false, isKeyReleased = false, isKeyToggle = false, key_down_time = 0, key = 0, key_name = 'None', visible = true, force_invisible = false, func = callback }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Keybox:SetActive(cL)
    self.visible = cL
end;
function bq.Keybox:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Keybox:IsActive()
    return self.visible
end;
function bq.Keybox:GetPosition()
    return self.pos
end;
function bq.Keybox:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Keybox:SetFunction(cN)
    self.func = cN
end;
function bq.Keybox:Update()
    self.visible = self.alpha == 0 and false or self.visible;
    if self.isBinding then
        local pressed_key = ci.get_pressed_key()
        if pressed_key ~= nil then
            if pressed_key ~= n.buttons.KEY_ESCAPE and self.visible then
                self.key = pressed_key;
                self.key_name = t.FirstToUpper(n.button_name[pressed_key])
                self.isClicked = false;
                self.isBinding = false;
                mariolua.log('key bound to ' .. pressed_key)
                pressed_key = nil;
                bq.SaveConfig()
            else
                pressed_key = nil;
                self.isClicked = false;
                self.isBinding = false;
                n.lock_input['move'] = false;
                self.key = 0;
                self.key_name = 'None'
                mariolua.log('keybind abort')
                bq.SaveConfig()
            end
        end
    end ;
    if self.visible then
        if ci.is_pressed(o.inputsystem, n.buttons.KEY_ESCAPE) and self.isBinding then
            self.isClicked = false;
            self.isBinding = false;
            n.lock_input['move'] = false;
            pressed_key = nil;
            self.key = 0;
            self.key_name = 'None'
            bq.SaveConfig()
        end ;
        if s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) and (n.used_Object == "" or n.used_Object == self.reference) or self.isBinding then
            self.isHovered = true;
            if n.mouse1_key_state and self.isClicked ~= true then
                n.used_Object = self.reference;
                self.isClicked = true;
                n.lock_input['move'] = true;
                self.key = 0;
                self.key_name = ''
                self.isBinding = true
            elseif self.isClicked then
                n.used_Object = ""
            end
        else
            self.isHovered = false
        end
    else
        if self.isBinding then
            pressed_key = nil;
            self.isBinding = false;
            self.isClicked = false;
            n.lock_input['move'] = false;
            self.key = 0;
            self.key_name = 'None'
            bq.SaveConfig()
        end ;
        self.isHovered = false
    end ;
    if self.key ~= 0 and self.key ~= nil and o.hudchat2 and not o.hudchat2.isChatOpen then
        self.isKeyDown = ci.is_pressed(o.inputsystem, self.key)
        self.isKeyReleased = not self.isKeyDown and self.key_down_time ~= 0 and true or false;
        self.key_down_time = self.isKeyDown and self.key_down_time + 1 or 0;
        if self.isKeyDown and self.key_down_time == 1 then
            self.isKeyToggle = not self.isKeyToggle
        end
    elseif not self.key then
        pressed_key = 0;
        self.isBinding = false;
        self.isClicked = false;
        n.lock_input['move'] = false;
        self.key = 0;
        self.key_name = 'None'
    end
end;
function bq.Keybox:GetValue()
    return self.key
end;
function bq.Keybox:GetKeyName()
    return self.key_name
end;
function bq.Keybox:SetValue(du)
    if du == nil then
        pressed_key = nil;
        self.isBinding = false;
        self.isClicked = false;
        self.key = 0;
        self.key_name = 'None'
    elseif type(du) == "string" or type(du) == "number" then
        du = tonumber(du)
        if du <= 0 or du > 113 then
            self.key = 0;
            self.key_name = 'None'
        elseif du <= 113 then
            self.key = du;
            self.key_name = t.FirstToUpper(n.button_name[du])
        end ;
        mariolua.log(self.label .. ' key set to ' .. t.FirstToUpper(n.button_name[du]) .. ' ' .. du)
    end
end;
function bq.Keybox:IsKeyReleased()
    return self.isKeyReleased
end;
function bq.Keybox:IsKeyDown()
    return self.isKeyDown
end;
function bq.Keybox:IsKeyToggle()
    return self.isKeyToggle
end;
function bq.Keybox:Render()
    if self.visible then
        if p.settings_guistyle:GetItemName() == "Aimware" then
            if self.isHovered then
                if self.isClicked then
                    w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
                else
                    w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
                end
            else
                w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
            renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.key_name)
        elseif p.settings_guistyle:GetItemName() == "UwU" then
            if self.isHovered then
                if self.isClicked then
                    w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
                else
                    w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
                end
            else
                w.draw_svg(w.gpx.svg['keybox'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
            renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.key_name)
        elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
            w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
            w.rectangle_outline(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, 50, 50, 50, self.alpha)
            if self.isHovered then
                if self.isClicked then
                    renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 22, 22, 22, s.clamp(self.alpha - 35, 0, 255), 30, 30, 30, s.clamp(self.alpha - 35, 0, 255), true)
                else
                    renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 40, 40, 40, s.clamp(self.alpha - 35, 0, 255), 30, 30, 30, s.clamp(self.alpha - 35, 0, 255), true)
                end
            else
                renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 25, 25, 25, s.clamp(self.alpha - 35, 0, 255), 20, 20, 20, s.clamp(self.alpha - 75, 0, 255), true)
            end ;
            local cQ, cR = renderer.measure_text('c', self.label)
            renderer.text(self.pos.x + cQ / 2, self.pos.y - cR, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
            renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.key_name)
        end
    end
end;
function bq.Tab:new(cF, cG, cH, cI, cJ, aw, dS, callback, dT, dU, dV)
    if type(cF) ~= "string" then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'tab', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, alpha = 255, reference = cF, ref_group = dS, label = cG, isHovered = false, isClicked = false, visible = true, force_invisible = false, is_curtab = false, icon = dT, tabs = dU or {}, is_main = dV or false, exec_func = false, func = callback }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Tab:SetActive(cL)
    self.visible = cL
end;
function bq.Tab:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Tab:IsActive()
    return self.visible
end;
function bq.Tab:GetPosition()
    return self.pos
end;
function bq.Tab:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Tab:SetCurrentTab()
    n.active_tabs[self.ref_group] = self.label
end;
function bq.Tab:SetIcon(a_)
    self.icon = a_
end;
function bq.Tab:SetFunction(cN)
    self.func = cN
end;
function bq.Tab:Update()
    self.visible = self.alpha == 0 and false or self.visible;
    if self.visible and self.isClicked and self.exec_func == false then
        self.exec_func = true;
        if self.func ~= nil then
            self.func(self)
        end
    end ;
    if self.visible and s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) then
        self.isHovered = true;
        n.used_Object = n.mouse1_key_state and (n.used_Object == "" or n.used_Object == self.reference) and self.reference or n.used_Object;
        n.current_wep_tab = n.mouse1_key_state and self.label or n.current_wep_tab;
        n.active_tabs[self.ref_group] = n.mouse1_key_state and self.label or n.active_tabs[self.ref_group]
        self.isClicked = n.mouse1_key_state;
        self.exec_func = false
    else
        n.used_Object = n.used_Object == self.reference and "" or n.used_Object;
        self.isClicked = false;
        self.isHovered = false;
        self.exec_func = false
    end ;
    n.active_tabs[self.ref_group] = n.active_tabs[self.ref_group] or self.label;
    self.is_curtab = n.active_tabs[self.ref_group] == self.label
end;
function bq.Tab:Render()
    if not self.visible then
        n.used_Object = n.used_Object == self.reference and "" or n.used_Object;
        self.isClicked = false;
        self.isHovered = false;
        return
    end ;
    if p.settings_guistyle:GetItemName() == "Aimware" then
        if self.is_curtab then
            n.icon_alpha = s.clamp(self.alpha - 20, 0, 255)
            w.draw_svg(w.gpx.svg['button_pressed'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
        elseif self.isHovered then
            if self.isClicked then
                w.draw_svg(w.gpx.svg['button_pressed'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            else
                w.draw_svg(w.gpx.svg['button_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            end
        else
            n.icon_alpha = s.clamp(self.alpha - 135, 0, 255)
            w.draw_svg(w.gpx.svg['button_normal'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
        end
    elseif p.settings_guistyle:GetItemName() == "UwU" then
        if self.is_curtab then
            n.icon_alpha = s.clamp(self.alpha - 20, 0, 255)
            w.draw_svg(w.gpx.svg['button_pressed'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
        elseif self.isHovered then
            if self.isClicked then
                w.draw_svg(w.gpx.svg['button_pressed'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
            else
                w.draw_svg(w.gpx.svg['button_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
            end
        else
            n.icon_alpha = s.clamp(self.alpha - 135, 0, 255)
            w.draw_svg(w.gpx.svg['button_normal'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
        end
    elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
        w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
        w.rectangle_outline(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, 50, 50, 50, self.alpha)
        if self.is_curtab then
            n.icon_alpha = s.clamp(self.alpha - 20, 0, 255)
            renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 22, 22, 22, self.alpha, 30, 30, 30, self.alpha, true)
        elseif self.isHovered then
            if self.isClicked then
                renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 22, 22, 22, self.alpha, 30, 30, 30, self.alpha, true)
            else
                renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 40, 40, 40, self.alpha, 35, 35, 35, self.alpha, true)
            end
        else
            n.icon_alpha = s.clamp(self.alpha - 135, 0, 255)
            renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 35, 35, 35, self.alpha, 30, 30, 30, self.alpha, true)
        end
    end ;
    if self.icon == nil then
        renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
    else
        w.draw_svg(w.gpx.svg[self.icon], self.pos.x + self.width / 100 * 30 / 2, self.pos.y + self.height / 100 * 30 / 2, self.width - self.width / 100 * 30, self.height - self.height / 100 * 30, 255, 255, 255, n.icon_alpha)
    end
end;
function bq.Tab:GetValue()
    return false
end;
function bq.Tab:SetValue(dW)
end;
function bq.Button:new(cF, cG, cH, cI, cJ, aw, callback)
    if type(cF) ~= "string" then
        mariolua.log(cG .. ": " .. tostring(cF) .. " is not a valid reference!")
        return
    end ;
    table.insert(n.reference, cF)
    local cK = n.reference[#n.reference]
    n.reference[cK] = { type = 'button', pos = { x = cH or 0, y = cI or 0 }, width = cJ or 0, height = aw or 0, alpha = 255, reference = cF, label = cG, isHovered = false, isClicked = false, visible = true, force_invisible = false, exec_func = false, func = callback }
    self.__index = self;
    return setmetatable(n.reference[cK], self)
end;
function bq.Button:SetActive(cL)
    self.visible = cL
end;
function bq.Button:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Button:IsActive()
    return self.visible
end;
function bq.Button:GetPosition()
    return self.pos
end;
function bq.Button:SetPosition(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Button:SetFunction(cN)
    self.func = cN
end;
function bq.Button:Update()
    self.visible = self.alpha == 0 and false or self.visible;
    if self.visible and self.isClicked and self.exec_func == false then
        self.exec_func = true;
        if self.func() ~= nil then
            self.func()
        end
    end ;
    if self.visible and s.inBounds(self.pos.x, self.pos.y, self.pos.x + self.width, self.pos.y + self.height) and (n.used_Object == "" or n.used_Object == self.reference) then
        self.isHovered = true;
        if n.mouse1_key_state then
            n.used_Object = (n.used_Object == '' or n.used_Object == self.reference) and self.reference or n.used_Object;
            self.isClicked = n.used_Object == self.reference and true or false
        else
            n.used_Object = n.used_Object == self.reference and "" or n.used_Object;
            self.isClicked = false;
            self.exec_func = false
        end
    else
        n.used_Object = n.used_Object == self.reference and "" or n.used_Object;
        self.isClicked = false;
        self.exec_func = false;
        self.isHovered = false
    end
end;
function bq.Button:Render()
    if not self.visible then
        return
    end ;
    if p.settings_guistyle:GetItemName() == "Aimware" then
        if self.isHovered then
            if self.isClicked then
                w.draw_svg(w.gpx.svg['button_pressed'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            else
                w.draw_svg(w.gpx.svg['button_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            end
        else
            w.draw_svg(w.gpx.svg['button_normal'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
        end ;
        renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
    elseif p.settings_guistyle:GetItemName() == "UwU" then
        if self.isHovered then
            if self.isClicked then
                w.draw_svg(w.gpx.svg['button_pressed'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
            else
                w.draw_svg(w.gpx.svg['button_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
            end
        else
            w.draw_svg(w.gpx.svg['button_normal'], self.pos.x, self.pos.y, self.width, self.height, 255, 60, 180, self.alpha)
        end ;
        renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
    elseif p.settings_guistyle:GetItemName() == 'Gamesense' then
        w.rectangle_outline(self.pos.x, self.pos.y, self.width, self.height, 12, 12, 12, self.alpha)
        w.rectangle_outline(self.pos.x + 1, self.pos.y + 1, self.width - 2, self.height - 2, 50, 50, 50, self.alpha)
        if self.isHovered then
            if self.isClicked then
                renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 22, 22, 22, self.alpha, 30, 30, 30, self.alpha, true)
            else
                renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 40, 40, 40, self.alpha, 35, 35, 35, self.alpha, true)
            end
        else
            renderer.gradient(self.pos.x + 2, self.pos.y + 2, self.width - 4, self.height - 4, 35, 35, 35, self.alpha, 30, 30, 30, self.alpha, true)
        end ;
        renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
    else
        if self.isHovered then
            if self.isClicked then
                w.draw_svg(w.gpx.svg['button_pressed'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            else
                w.draw_svg(w.gpx.svg['button_mouse_over'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
            end
        else
            w.draw_svg(w.gpx.svg['button_normal'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, self.alpha)
        end ;
        renderer.text(self.pos.x + self.width / 2, self.pos.y + self.height / 2, 240, 240, 240, s.clamp(self.alpha - 15, 0, 255), 'c', 0, self.label)
    end
end;
function bq.Button:GetValue()
    return false
end;
function bq.Button:SetValue(dW)
end;
function bq.Window:new(dX, cH, cI, dY, dZ, d_, e0)
    table.insert(n.windows, dX)
    local cK = n.windows[#n.windows]
    n.windows[cK] = { varname = dX, idx = cK, pos = { x = cH or 0, y = cI or 0, drag_x = 0, drag_y = 0, ty = 0, drag = false, resize = false }, scrll = { y = (cI or 0) - 12, drag = false, fix = 0 }, mouse = {}, width = dY or 800, height = dZ or 400, alpha = 255, px_up = 0, px_down = 0, visible = false, moveable = true, is_moving = false, onResize = false, can_scroll = false, overlap = 0, overlap_object = 0, overlaped_obj = 0, isOverlap = false, isOverlap2 = false, prev_tab = '', cur_tab = '', tab = {}, count = { done = false, keybox = 0, button = 0, checkbox = 0 }, guiObjects = {}, currentHoveredGUIObject = 1, on_render = d_ or nil, on_update = e0 or nil }
    self.__index = self;
    return setmetatable(n.windows[cK], self)
end;
function bq.Window:SetMoveable(e1)
    self.moveable = e1
end;
function bq.Window:GetValue()
    return self.varname
end;
function bq.Window:SetValue()
end;
function bq.Window:IsMoveable()
    return self.moveable
end;
function bq.Window:SetActive(cL)
    self.visible = cL
end;
function bq.Window:SetInvisible(cM)
    self.force_invisible = cM;
    self.visible = not cM
end;
function bq.Window:IsActive()
    return self.visible
end;
function bq.Window:SetWindowPos(cH, cI)
    self.pos.x = cH;
    self.pos.y = cI
end;
function bq.Window:SetWindowSize(dY, dZ)
    self.width = dY;
    self.height = dZ;
    if n.mouse1_key_state then
        self.onResize = true
    end
end;
function bq.Window:GetWindowSize()
    return self.width, self.height
end;
function bq.Window:GetWindowPos()
    return self.pos
end;
function q.get_bounds_alpha(a9, aa, cJ, aw, b8, b9)
    if s.isInsideRect(a9, aa, a9 + cJ, aa + aw, b8, b9) then
        local e2 = s.clamp((aa - b9) * -1, 0, aw)
        local e3 = s.clamp(aa + aw - b9, 0, aw)
        local e4 = s.round(s.percentof(e2, aw))
        local e5 = s.round(s.percentof(e3, aw))
        if e4 < 1 then
            return s.percent(s.percentof(e4, 1), 255)
        elseif e5 < 10 then
            return s.percent(s.percentof(e5, 10), 255)
        else
            return 255
        end
    else
        return 0
    end
end;
function q.should_update(dU)
    if dU[3] and dU[1] then
        return dU[1] == dU[2] and dU[3] == dU[4]
    elseif dU[1] then
        return dU[1] == dU[2]
    end ;
    return false
end;
function bq.Window:UpdateTab(al, e6, e7, a9, aa, e8, dU)
    dU = dU or {}
    local e9 = q.should_update(dU)
    local ea, eb, ec = 0, 0, 0;
    for I = 1, #e6 do
        local ed = e6[I]
        if not self.visible and not ed.type == 'keybox' then
            return
        end ;
        local db = q.get_bounds_alpha(self.pos.x, self.pos.y, self.width, self.height, ed.pos.x, ed.pos.y)
        ed.alpha = db;
        if ed.type == "combobox" or ed.type == "multibox" then
            if ed.maxSize > ed.height and self.overlap ~= ed.maxSize then
                self.overlap = ed.pos.y + ed.maxSize;
                self.overlap_object = I
            end
        end ;
        local cQ, cR = renderer.measure_text("c", ed.label)
        if self.overlap_object > 0 and (self.cur_tab == e7 and e9 or self.cur_tab == e7 and not dU[1]) then
            if e6[self.overlap_object] ~= nil then
                if e6[self.overlap_object].maxSize == nil then
                    e6[self.overlap_object].maxSize = 0
                end ;
                if al == 1 then
                    if I ~= self.overlap_object and ed.pos.y - cR <= self.overlap and ed.pos.y - cR >= self.overlap - e6[self.overlap_object].maxSize then
                        self.overlaped_obj = I;
                        ed.visible = false;
                        self.isOverlap = true
                    elseif I == self.overlaped_obj and self.isOverlap then
                        self.isOverlap = false
                    end
                else
                    if I ~= self.overlap_object and ed.pos.y - cR <= self.overlap and ed.pos.y - cR >= self.overlap - e6[self.overlap_object].maxSize then
                        self.overlaped_obj = I;
                        ed.visible = false;
                        self.isOverlap2 = true
                    elseif I == self.overlaped_obj and self.isOverlap2 then
                        self.isOverlap2 = false
                    end
                end
            end
        end ;
        if not ed.force_invisible then
            if ed.type == 'slider' then
                ed:SetPosition(a9 + 5, aa - 15 + ea * 15 + ec + I * e8 - (ea * e8 - 8))
            elseif ed.type == 'groupbox' then
                ed:SetPosition(a9 - 5, aa - 15 + ea * 15 + ec + I * e8 - (ea * e8 - 8))
                ea = ea + 1;
                eb = eb + ed.pos_x;
                ec = ec + ed.pos_y
            else
                ed:SetPosition(a9 + 5, aa + ea * 15 + ec + I * e8 - (ea * e8 - 8))
            end
        end ;
        ed:Update()
    end
end;
n.draging_ui_obj = false;
function bq.Window:Scroll()
    if self.cur_tab ~= self.prev_tab then
        self.prev_tab = self.cur_tab;
        self.mouse = {}
        self.pos.drag_x = 0;
        self.pos.drag_y = 0;
        self.pos.drag = false;
        n.draging_ui_obj = false;
        self.pos.drag_dif = 0
    end ;
    if not self.can_scroll then
        return self.pos.x, self.pos.y
    end ;
    local ee = self.pos.x;
    local ef = self.pos.y + self.pos.drag_dif or self.pos.y;
    self.mouse.left, self.mouse.pos = client.key_state(0x01, true), { ui.mouse_position() }
    self.mouse.fixed_pos = self.mouse.fixed_pos or { self.pos.x, self.pos.y }
    if self.pos.drag and not self.mouse.left then
        self.pos.drag = false;
        n.draging_ui_obj = false;
        n.block_key_state[0x01] = false;
        self.mouse.pressed = false
    end ;
    if self.pos.drag and self.mouse.left then
        ee = self.mouse.pos[1] - self.pos.drag_x;
        ef = s.clamp(self.mouse.pos[2] - self.pos.drag_y, self.pos.y, self.pos.y + 2000)
        self.mouse.fixed_pos[1] = self.mouse.pos[1] - self.pos.drag_x;
        self.mouse.fixed_pos[2] = s.clamp(self.mouse.pos[2] - self.pos.drag_y, self.pos.y, self.pos.y + 2000)
        self.pos.drag_dif = self.mouse.fixed_pos[2] - self.pos.y
    end ;
    if s.intersect(self.mouse.pos[1], self.mouse.pos[2], ee, ef, self.width - 10, self.height - 10) and self.mouse.left then
        if not self.mouse.pressed then
            self.mouse.press_pos_x = self.mouse.pos[1]
            self.mouse.press_pos_y = self.mouse.pos[2]
            self.mouse.pressed = true
        end ;
        if not s.between(self.mouse.press_pos_y, self.mouse.pos[2] - 40, self.mouse.pos[2] + 40) then
            self.pos.drag = true;
            n.draging_ui_obj = true;
            n.block_key_state[0x01] = true;
            self.pos.drag_x = self.mouse.pos[1] - ee;
            self.pos.drag_y = s.clamp(self.mouse.pos[2] - ef, self.pos.y, self.pos.y + 2000)
        end
    end ;
    return ee, ef
end;
function bq.Window:Update()
    self.on_update(self)
end;
function bq.Window:RenderTab(al, e6, e7, dU)
    dU = dU or {}
    local eg = q.should_update(dU)
    for I = 1, #e6 do
        local ed = e6[I]
        if self.cur_tab == e7 and eg or self.cur_tab == e7 and not dU[1] then
            if al == 1 then
                ed.visible = (not self.isOverlap or not self.visible) and not ed.force_invisible and self.visible or (self.force_invisible and false or ed.visible)
            else
                ed.visible = (not self.isOverlap2 or not self.visible) and not ed.force_invisible and self.visible or (self.force_invisible and false or ed.visible)
            end ;
            ed:Render()
        elseif ed.visible then
            ed.visible = false
        end
    end
end;
n.bg_link = ''
function bq.Window:Render()
    if self.visible then
        if p.settings_guistyle:GetItemName() == 'Gamesense' then
            if self.onResize or p.settings_custombackground:GetValue() then
                w.gs_container(self.pos.x, self.pos.y - 24, self.width, self.height + 28, 255, true, false)
            else
                w.gs_container(self.pos.x, self.pos.y - 24, self.width, self.height + 28, 255, true, true)
            end
        elseif p.settings_guistyle:GetItemName() == "Fuhrer" then
            w.draw_svg(w.gpx.svg['window_top'], self.pos.x, self.pos.y - 24, self.width, 24, 50, 50, 50, 255)
            w.draw_svg(w.gpx.svg['window_bottom'], self.pos.x, self.pos.y + self.height, self.width, 4, 50, 50, 50, 255)
            renderer.rectangle(self.pos.x, self.pos.y, self.width, self.height, 20, 20, 20, 150)
            if not p.settings_custombackground:GetValue() then
                w.draw_svg(w.gpx.svg['hitler'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, 250, 'r')
            end
        elseif p.settings_guistyle:GetItemName() == "UwU" then
            w.draw_svg(w.gpx.svg['window_top'], self.pos.x, self.pos.y - 24, self.width, 24, 80, 20, 250, 255)
            w.draw_svg(w.gpx.svg['window_bottom'], self.pos.x, self.pos.y + self.height, self.width, 4, 80, 20, 250, 255)
            if not p.settings_custombackground:GetValue() then
                renderer.rectangle(self.pos.x, self.pos.y, self.width, self.height, 20, 20, 20, 150)
                w.draw_svg(w.gpx.svg['uwu'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, 255, 'r')
                w.draw_svg(w.gpx.svg['uwu_avatar'], self.pos.x - 200, self.pos.y - 120, 300, 500, 255, 255, 255, 250, 'r')
            end
        elseif p.settings_guistyle:GetItemName() == "Minimal" then
            w.watermark_container(self.pos.x, self.pos.y - 24, self.width, self.height + 28, true)
        else
            w.draw_svg(w.gpx.svg['window_top'], self.pos.x, self.pos.y - 24, self.width, 24, 255, 255, 255, 255)
            w.draw_svg(w.gpx.svg['window_bottom'], self.pos.x, self.pos.y + self.height, self.width, 4, 255, 255, 255, 255)
            if not p.settings_custombackground:GetValue() then
                renderer.rectangle(self.pos.x, self.pos.y, self.width, self.height, 0, 0, 0, 190)
                w.draw_svg(w.gpx.svg['window_bg'], self.pos.x, self.pos.y, self.width, self.height, 255, 255, 255, 230, 'r')
            end
        end ;
        if p.settings_custombackground:GetValue() then
            local eh = ui.get(n.config_bg_string)
            local ei = p.settings_guistyle:GetItemName()
            local ej = ei == 'Gamesense' and self.pos.x + 6 or self.pos.x;
            local ek = ei == 'Gamesense' and self.pos.y - 14 or self.pos.y;
            local el = ei == 'Gamesense' and self.width - 12 or self.width;
            local em = ei == 'Gamesense' and self.height + 12 or self.height;
            if w.gpx.jpg.custom_bg ~= nil and w.gpx.jpg.custom_bg ~= '' and n.bg_link == eh then
                renderer.rectangle(ej, ek, el, self.height, 20, 20, 20, 150)
                if n.img_type == 'jpg' then
                    w.draw_jpg(w.gpx.jpg.custom_bg, ej, ek, el, em, 255, 255, 255, 255)
                elseif n.img_type == 'png' then
                    w.draw_png(w.gpx.jpg.custom_bg, ej, ek, el, em, 255, 255, 255, 255)
                end
            else
                local en = readfile('mariolua_bg.dat')
                en = en or 'return {}'
                local eo = loadstring(en)()
                if eo[eh] then
                    img_file = t.decode(eo[eh])
                    n.img_type = img_file:match('�PNG') and 'png' or 'jpg'
                    w.gpx.jpg.custom_bg = img_file;
                    n.bg_link = eh
                end
            end
        end ;
        local ep = d and 'Dev' or '' or false;
        renderer.text(self.pos.x + 25, self.pos.y - 17, 255, 255, 255, 200, nil, 0, '' .. mariolua.name .. ' v' .. mariolua.version .. ' ' .. ep .. ' by SamHoque#1337')
    end ;
    if self.on_render then
        self.on_render(self)
    end
end;
function q.on_update_ui(self)
    local ee, ef = self:Scroll()
    ee = self.pos.x;
    if self.onResize and n.mouse1_key_state ~= true then
        self.onResize = false
    end ;
    for I = 1, #self.guiObjects.tab do
        local ed = self.guiObjects.tab[I]
        if I == 1 then
            if n.is_window_hidden and ui.is_menu_open() then
                if n.moving_window then
                    ed.pos.x = n.temp_menu_pos_x
                else
                    ed.pos.x = n.gs_menu_x - 18
                end ;
                ed.visible = true
            else
                ed.visible = self.visible
            end ;
            if self.visible then
                ed:SetPosition(self.pos.x - ed.width + 18, self.pos.y - 24 - ed.height + ed.height)
            else
                ed:SetPosition(n.gs_menu_x - ed.width, n.gs_menu_y - ed.height + ed.height)
            end
        else
            ed:SetPosition(self.pos.x - ed.width, self.pos.y - 32 - ed.height + ed.height * I - 1)
        end ;
        ed:Update()
    end ;
    for I = 1, #self.guiObjects.aimbot.tabs do
        local ed = self.guiObjects.aimbot.tabs[I]
        ed:SetPosition(self.pos.x - 60 + I * 80, self.pos.y + 20)
        ed:Update()
    end ;
    for I = 1, #self.guiObjects.antiaim.tabs do
        local ed = self.guiObjects.antiaim.tabs[I]
        ed:SetPosition(self.pos.x - 60 + I * 80, self.pos.y + 20)
        ed:Update()
    end ;
    for I = 1, #self.guiObjects.antiaim['conditions'] do
        local ed = self.guiObjects.antiaim['conditions'][I]
        ed:SetPosition(self.pos.x - 40 + I * 65, self.pos.y + 80)
        ed:Update()
    end ;
    for I = 1, #self.guiObjects.weapons do
        local ed = self.guiObjects.weapons[I]
        ed:SetPosition(self.pos.x - 43 + I * 54, self.pos.y + 30)
        ed:Update()
    end ;
    for I = 1, #self.guiObjects.wepcfg_top do
        local ed = self.guiObjects.wepcfg_top[I]
        ed:SetPosition(self.pos.x - 50 + I * 60, self.pos.y + 5)
        ed:Update()
    end ;
    self:UpdateTab(1, self.guiObjects.aimbot.keybinds, 'Aimbot', ee + 20, ef + 30, 45, { n.aimbot_tab, 'Keybinds' })
    self:UpdateTab(2, self.guiObjects.aimbot.keybinds2, 'Aimbot', ee + 250, ef + 30, 45, { n.aimbot_tab, 'Keybinds' })
    self:UpdateTab(1, self.guiObjects.aimbot.other, 'Aimbot', ee + 20, ef + 30, 45, { n.aimbot_tab, 'Other' })
    self:UpdateTab(2, self.guiObjects.aimbot.other2, 'Aimbot', ee + 250, ef + 30, 45, { n.aimbot_tab, 'Other' })
    self:UpdateTab(1, self.guiObjects.antiaim.tab_1['standing'][1], 'Anti-Aim', ee + 20, ef + 90, 45, { n.aa_tab, 'AA', n.aa_condition_tab, 'Standing' })
    self:UpdateTab(2, self.guiObjects.antiaim.tab_1['standing'][2], 'Anti-Aim', ee + 250, ef + 90, 45, { n.aa_tab, 'AA', n.aa_condition_tab, 'Standing' })
    self:UpdateTab(1, self.guiObjects.antiaim.tab_1['moving'][1], 'Anti-Aim', ee + 20, ef + 90, 45, { n.aa_tab, 'AA', n.aa_condition_tab, 'Moving' })
    self:UpdateTab(2, self.guiObjects.antiaim.tab_1['moving'][2], 'Anti-Aim', ee + 250, ef + 90, 45, { n.aa_tab, 'AA', n.aa_condition_tab, 'Moving' })
    self:UpdateTab(1, self.guiObjects.antiaim.tab_1['slowmotion'][1], 'Anti-Aim', ee + 20, ef + 90, 45, { n.aa_tab, 'AA', n.aa_condition_tab, 'Slow Motion' })
    self:UpdateTab(2, self.guiObjects.antiaim.tab_1['slowmotion'][2], 'Anti-Aim', ee + 250, ef + 90, 45, { n.aa_tab, 'AA', n.aa_condition_tab, 'Slow Motion' })
    self:UpdateTab(1, self.guiObjects.antiaim.tab_2[1], 'Anti-Aim', ee + 20, ef + 30, 45, { n.aa_tab, 'AA 2' })
    self:UpdateTab(2, self.guiObjects.antiaim.tab_2[2], 'Anti-Aim', ee + 270, ef + 30, 45, { n.aa_tab, 'AA 2' })
    self:UpdateTab(1, self.guiObjects.resolver, 'Resolver', ee + 20, ef - 30, 45)
    self:UpdateTab(2, self.guiObjects.resolver2, 'Resolver', ee + 260, ef - 30, 45)
    self:UpdateTab(1, self.guiObjects.misc, 'Misc', ee + 20, ef - 30, 45)
    self:UpdateTab(2, self.guiObjects.misc2, 'Misc', ee + 250, ef - 30, 45)
    self:UpdateTab(1, self.guiObjects.indicators, 'Indicators', ee + 20, ef - 30, 45)
    self:UpdateTab(2, self.guiObjects.indicators2, 'Indicators', ee + 210, ef - 30, 45)
    self:UpdateTab(1, self.guiObjects.visuals, 'Visuals', ee + 20, ef - 30, 45)
    self:UpdateTab(1, self.guiObjects.settings, 'Settings', ee + 20, ef - 30, 45)
    self:UpdateTab(2, self.guiObjects.settings2, 'Settings', ee + 250, ef - 30, 45)
    for I = 1, #self.guiObjects.wepcfg do
        local eq = self.guiObjects.wepcfg[I]
        for cl = 1, #eq do
            local ed = eq[cl]
            if self.visible or ed.type == 'keybox' then
                local db = q.get_bounds_alpha(self.pos.x, self.pos.y, self.width, self.height, ed.pos.x, ed.pos.y)
                ed.alpha = db;
                if ed ~= nil then
                    if ed.type == "combobox" or ed.type == "multibox" then
                        if ed.maxSize > ed.height and self.overlap ~= ed.maxSize then
                            self.overlap = ed.pos.y + ed.maxSize;
                            self.overlap_object = cl;
                            mariolua.log("Overlap pos: " .. self.overlap)
                        elseif self.type == "multibox" and self.overlap > 0 and ed.type ~= "combobox" then
                            self.overlap = 0;
                            self.overlap_object = 0
                        end
                    end ;
                    local cQ, cR = renderer.measure_text("c", ed.label)
                    if self.overlap_object > 0 and self.cur_tab == 'Weapons' and n.wep_tab == I then
                        if eq[self.overlap_object] then
                            if eq[self.overlap_object].maxSize == nil then
                                eq[self.overlap_object].maxSize = 0
                            end ;
                            if cl ~= self.overlap_object and ed.pos.y - cR <= self.overlap and ed.pos.y - cR >= self.overlap - eq[self.overlap_object].maxSize then
                                mariolua.log("Overlaped Object: " .. ed.label)
                                self.overlaped_obj = cl;
                                ed.visible = false;
                                self.isOverlap = true
                            elseif cl == self.overlaped_obj and self.isOverlap then
                                self.isOverlap = false
                            end
                        end
                    end ;
                    if not ed.force_invisible then
                        if ed.type == 'slider' then
                            ed:SetPosition(ee + 25, ef + cl * 45)
                        elseif ed.type == 'groupbox' then
                            ed:SetPosition(ee + 20, ef + 20 + cl * 45)
                        elseif ed.type == 'checkbox' then
                            ed:SetPosition(ee + 25, ef + 10 + cl * 45)
                        else
                            ed:SetPosition(ee + 25, ef + 15 + cl * 45)
                        end
                    end ;
                    ed:Update()
                end
            end
        end
    end ;
    for I = 1, #self.guiObjects.wepcfg2 do
        local eq = self.guiObjects.wepcfg2[I]
        for cl = 1, #eq do
            local ed = eq[cl]
            if self.visible or ed.type == 'keybox' then
                local db = q.get_bounds_alpha(self.pos.x, self.pos.y, self.width, self.height, ed.pos.x, ed.pos.y)
                ed.alpha = db;
                if ed ~= nil then
                    if ed.type == "combobox" or ed.type == "multibox" then
                        if ed.maxSize > ed.height and self.overlap ~= ed.maxSize then
                            self.overlap = ed.pos.y + ed.maxSize;
                            self.overlap_object = cl;
                            mariolua.log("Overlap pos: " .. self.overlap)
                        elseif self.type == "multibox" and self.overlap > 0 and ed.type ~= "combobox" then
                            self.overlap = 0;
                            self.overlap_object = 0
                        end
                    end ;
                    local cQ, cR = renderer.measure_text("c", ed.label)
                    if self.overlap_object > 0 and self.cur_tab == 'Weapons' and n.wep_tab == I then
                        if eq[self.overlap_object].maxSize == nil then
                            eq[self.overlap_object].maxSize = 0
                        end ;
                        if cl ~= self.overlap_object and ed.pos.y - cR <= self.overlap and ed.pos.y - cR >= self.overlap - eq[self.overlap_object].maxSize then
                            mariolua.log("Overlaped Object: " .. ed.label)
                            self.overlaped_obj = cl;
                            ed.visible = false;
                            self.isOverlap2 = true
                        elseif cl == self.overlaped_obj and self.isOverlap2 then
                            self.isOverlap2 = false
                        end
                    end ;
                    if not ed.force_invisible then
                        if ed.type == 'slider' then
                            ed:SetPosition(ee + 255, ef + cl * 45)
                        elseif ed.type == 'groupbox' then
                            ed:SetPosition(ee + 250, ef + 20 + cl * 45)
                        elseif ed.type == 'checkbox' then
                            ed:SetPosition(ee + 255, ef + 10 + cl * 45)
                        else
                            ed:SetPosition(ee + 255, ef + 15 + cl * 45)
                        end
                    end ;
                    ed:Update()
                end
            end
        end
    end
end;
function q.on_render_ui(self)
    for I = 1, #self.guiObjects.tab do
        local ed = self.guiObjects.tab[I]
        if self.visible and ed.visible or I == 1 then
            ed:Render()
        end
    end ;
    if self.visible then
        self:RenderTab(1, self.guiObjects.aimbot.tabs, 'Aimbot')
        self:RenderTab(1, self.guiObjects.aimbot.keybinds, 'Aimbot', { n.aimbot_tab, 'Keybinds' })
        self:RenderTab(2, self.guiObjects.aimbot.keybinds2, 'Aimbot', { n.aimbot_tab, 'Keybinds' })
        self:RenderTab(1, self.guiObjects.aimbot.other, 'Aimbot', { n.aimbot_tab, 'Other' })
        self:RenderTab(2, self.guiObjects.aimbot.other2, 'Aimbot', { n.aimbot_tab, 'Other' })
        self:RenderTab(1, self.guiObjects.resolver, 'Resolver')
        self:RenderTab(2, self.guiObjects.resolver2, 'Resolver')
        self:RenderTab(1, self.guiObjects.antiaim.tabs, 'Anti-Aim')
        self:RenderTab(1, self.guiObjects.antiaim['conditions'], 'Anti-Aim', { n.aa_tab, 'AA' })
        self:RenderTab(1, self.guiObjects.antiaim.tab_1['standing'][1], 'Anti-Aim', { n.aa_tab, 'AA', n.aa_condition_tab, 'Standing' })
        self:RenderTab(2, self.guiObjects.antiaim.tab_1['standing'][2], 'Anti-Aim', { n.aa_tab, 'AA', n.aa_condition_tab, 'Standing' })
        self:RenderTab(1, self.guiObjects.antiaim.tab_1['moving'][1], 'Anti-Aim', { n.aa_tab, 'AA', n.aa_condition_tab, 'Moving' })
        self:RenderTab(2, self.guiObjects.antiaim.tab_1['moving'][2], 'Anti-Aim', { n.aa_tab, 'AA', n.aa_condition_tab, 'Moving' })
        self:RenderTab(1, self.guiObjects.antiaim.tab_1['slowmotion'][1], 'Anti-Aim', { n.aa_tab, 'AA', n.aa_condition_tab, 'Slow Motion' })
        self:RenderTab(2, self.guiObjects.antiaim.tab_1['slowmotion'][2], 'Anti-Aim', { n.aa_tab, 'AA', n.aa_condition_tab, 'Slow Motion' })
        self:RenderTab(1, self.guiObjects.antiaim.tab_2[1], 'Anti-Aim', { n.aa_tab, 'AA 2' })
        self:RenderTab(2, self.guiObjects.antiaim.tab_2[2], 'Anti-Aim', { n.aa_tab, 'AA 2' })
        self:RenderTab(1, self.guiObjects.misc, 'Misc')
        self:RenderTab(2, self.guiObjects.misc2, 'Misc')
        self:RenderTab(1, self.guiObjects.indicators, 'Indicators')
        self:RenderTab(2, self.guiObjects.indicators2, 'Indicators')
        self:RenderTab(1, self.guiObjects.visuals, 'Visuals')
        self:RenderTab(1, self.guiObjects.settings, 'Settings')
        self:RenderTab(2, self.guiObjects.settings2, 'Settings')
        for I = 1, #self.guiObjects.weapons do
            local ed = self.guiObjects.weapons[I]
            if self.cur_tab == 'Weapons' then
                ed.visible = self.visible;
                ed:Render()
            elseif ed.visible then
                ed.visible = false
            end
        end ;
        for I = 1, #self.guiObjects.wepcfg_top do
            local ed = self.guiObjects.wepcfg_top[I]
            if self.cur_tab == 'Weapons' then
                ed.visible = self.visible;
                ed:Render()
            elseif ed.visible then
                ed.visible = false
            end
        end ;
        for I = 1, #self.guiObjects.wepcfg do
            local eq = self.guiObjects.wepcfg[I]
            for cl = 1, #eq do
                local ed = eq[cl]
                if self.cur_tab == 'Weapons' and n.wep_tab == I then
                    if (self.isOverlap == false or self.visible == false) and ed.force_invisible == false then
                        ed.visible = self.visible
                    elseif self.force_invisible then
                        ed.visible = false
                    end ;
                    ed:Render()
                elseif ed.visible then
                    ed.visible = false
                end
            end
        end ;
        for I = 1, #self.guiObjects.wepcfg2 do
            local eq = self.guiObjects.wepcfg2[I]
            for cl = 1, #eq do
                local ed = eq[cl]
                if self.cur_tab == 'Weapons' and n.wep_tab == I then
                    if (self.isOverlap2 == false or self.visible == false) and ed.force_invisible == false then
                        ed.visible = self.visible
                    elseif self.force_invisible then
                        ed.visible = false
                    end ;
                    ed:Render()
                elseif ed.visible then
                    ed.visible = false
                end
            end
        end
    end
end;
local er = bq.Window:new('Main', 100, 200, 510, 585, q.on_render_ui, q.on_update_ui)
er.cur_tab = 'Aimbot'
n.aimbot_tab = 'Keybinds'
n.aa_tab = 'AA'
n.aa_condition_tab = 'Standing'
n.current_wep_tab = 'Pistols'
n.moving_window = false;
n.is_window_hidden = false;
function q.show_window()
    n.temp_menu_pos_x = n.menu.x;
    n.temp_menu_pos_y = n.menu.y;
    n.gs_menu_x, n.gs_menu_y = ui.menu_position()
    if n.menu.x <= n.gs_menu_x - n.temp_w then
        n.is_window_hidden = false;
        n.moving_window = false;
        client.unset_event_callback('paint_ui', q.show_window)
    else
        er:SetWindowPos(n.menu.x - 10, n.gs_menu_y + 24)
        client.set_event_callback('paint_ui', q.show_window)
    end
end;
function q.hide_window()
    n.gs_menu_x, n.gs_menu_y = ui.menu_position()
    if n.menu.x >= n.gs_menu_x then
        n.is_window_hidden = true;
        n.moving_window = false;
        er:SetActive(false)
        client.unset_event_callback('paint_ui', q.hide_window)
    else
        er:SetWindowPos(n.menu.x + 10, n.gs_menu_y + 24)
        client.set_event_callback('paint_ui', q.hide_window)
    end
end;
function q.hide_mariolua_menu()
    if n.moving_window then
        return
    end ;
    n.gs_menu_x, n.gs_menu_y = ui.menu_position()
    n.temp_w = n.menu.w;
    n.temp_h = n.menu.h;
    n.moving_window = true;
    if n.is_window_hidden then
        er:SetWindowPos(n.gs_menu_x, n.gs_menu_y)
        er:SetActive(true)
        q.show_window()
    else
        q.hide_window()
    end
end;
er.guiObjects = { tab = { bq.Tab:new('tab.hide', '-', 0, 0, 18, 18, 'hide', q.hide_mariolua_menu), bq.Tab:new('tab.aimbot', 'Aimbot', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Aimbot'
    mariolua.log('Aimbot tab pressed')
end, nil, { 'Keybinds', 'Other' }, true), bq.Tab:new('tab.weapons', 'Weapons', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Weapons'
    mariolua.log('Weapons tab pressed')
end, nil, { 'Pistols', 'H. Pistols', 'SMGs', 'Rifles', 'Scout', 'AWP', 'A. Sniper', 'LMGs', 'Other' }, true), bq.Tab:new('tab.resolver', 'Resolver', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Resolver'
    mariolua.log('Resolver tab pressed')
end, nil, {}), bq.Tab:new('tab.legitaa', 'Anti-Aim', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Anti-Aim'
    mariolua.log('AntiAim tab pressed')
end, nil, { 'AA', 'AA 2' }, true), bq.Tab:new('tab.misc', 'Misc', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Misc'
    mariolua.log('Misc tab pressed')
end, nil, {}), bq.Tab:new('tab.indicators', 'Indicators', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Indicators'
    mariolua.log('Indicators tab pressed')
end, nil, {}, true), bq.Tab:new('tab.visuals', 'Visuals', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Visuals'
    mariolua.log('Visuals tab pressed')
end, nil, {}, true), bq.Tab:new('tab.settings', 'Settings', 0, 0, 75, 32, 'tab', function(self)
    self:SetCurrentTab()
    er.cur_tab = 'Settings'
    mariolua.log('Settings tab pressed')
end, nil, {}, true) }, aimbot = { tabs = { bq.Tab:new('aimbot.keybinds.tab', 'Keybinds', 0, 0, 80, 35, 'aimbot', function(self)
    self:SetCurrentTab()
    n.aimbot_tab = 'Keybinds'
    mariolua.log('Aimbot Keybinds tab pressed')
end, nil), bq.Tab:new('aimbot.other.tab', 'Other', 0, 0, 80, 35, 'aimbot', function(self)
    self:SetCurrentTab()
    n.aimbot_tab = 'Other'
    mariolua.log('Aimbot Other tab pressed')
end, nil) }, keybinds = { bq.Groupbox:new('aimbot.keybinds', 'Keybinds', 0, 0, 210, 420), bq.Checkbox:new('trigger.ragetrigger', 'Rage Trigger', 0, 0, 18, 18, nil), bq.Combobox:new('trigger.ragetrigger.mode', 'Rage Trigger Mode', 0, 0, 185, 22, { 'Toggle', 'Hold', 'Always' }, nil), bq.Keybox:new('trigger.triggerkey', 'Rage Trigger Key', 0, 0, 185, 22, nil), bq.Checkbox:new('trigger.autowall', 'Auto Wall', 0, 0, 18, 18, nil), bq.Combobox:new('trigger.autowall.mode', 'Auto Wall Mode', 0, 0, 185, 22, { 'Toggle', 'Hold', 'Always' }, nil), bq.Keybox:new('trigger.autowallkey', 'Auto Wall Key', 0, 0, 185, 22, nil), bq.Checkbox:new('trigger.forcebaim', 'Force Body Aim', 0, 0, 18, 18, nil), bq.Combobox:new('trigger.forcebaim.mode', 'Force Body Aim Mode', 0, 0, 185, 22, { 'Toggle', 'Hold', 'Always' }, nil), bq.Keybox:new('trigger.forcebaimkey', 'Force Body Aim Key', 0, 0, 185, 22, nil) }, keybinds2 = { bq.Groupbox:new('aimbot.keybinds2', 'Keybinds', 0, 0, 210, 420), bq.Checkbox:new('trigger.damage.override', 'Min Damage Override', 0, 0, 18, 18, nil), bq.Combobox:new('trigger.damage.override.mode', 'Min Damage Override Mode', 0, 0, 185, 22, { 'Toggle', 'Hold' }, nil), bq.Keybox:new('trigger.damage.override.key', 'Min Damage Override Key', 0, 0, 185, 22, nil), bq.Checkbox:new('aimbot.keybinds.onshot', 'Force OnShot', 0, 0, 18, 18, nil), bq.Combobox:new('aimbot.keybinds.onshot.mode', 'Force OnShot Mode', 0, 0, 185, 22, { 'Toggle', 'Hold', 'Always' }, nil), bq.Keybox:new('aimbot.keybinds.onshot.key', 'Force OnShot Key', 0, 0, 185, 22, nil), bq.Checkbox:new('aimbot.dormant', 'Dormant Aimbot', 0, 0, 18, 18, nil), bq.Combobox:new('aimbot.dormant.mode', 'Dormant Aimbot Mode', 0, 0, 185, 22, { 'Toggle', 'Hold', 'Always' }, nil), bq.Keybox:new('aimbot.dormant.key', 'Dormant Aimbot Key', 0, 0, 185, 22, nil) }, other = { bq.Groupbox:new('aimbot.legitautowall', 'Legit Auto Wall', 0, 0, 210, 160), bq.Checkbox:new('trigger.legitautowall.enabled', 'Enable', 0, 0, 18, 18, nil), bq.Multibox:new('trigger.legitautowall.hitbox', 'Trace Hitbox', 0, 0, 185, 22, { bq.MultiboxItem:new('trigger', 'Head'), bq.MultiboxItem:new('trigger', 'Chest'), bq.MultiboxItem:new('trigger', 'Stomach'), bq.MultiboxItem:new('trigger', 'Arms'), bq.MultiboxItem:new('trigger', 'Hands'), bq.MultiboxItem:new('trigger', 'Legs'), bq.MultiboxItem:new('trigger', 'Feet') }, nil), bq.Slider:new('trigger.legitautowall.extrapolated', 'Extrapolate Position', 0, 0, 180, 12, 0, 0, 32), bq.Text:new('trigger.dynamicfov.space', '', 0, 0, 0, 0, 'b', nil), bq.Groupbox:new('aimbot.dynamicfov', 'Dynamic Fov', 0, 0, 210, 250), bq.Combobox:new('trigger.dynamicfov.mode', 'Dynamic Fov Mode', 0, 0, 180, 22, { 'Off', 'Static', 'Automatic' }, nil), bq.Slider:new('trigger.dynamicfov.min', 'Minimum Fov', 0, 0, 180, 12, 1, 1, 180), bq.Slider:new('trigger.dynamicfov.max', 'Maximum Fov', 0, 0, 180, 12, 1, 1, 180), bq.Slider:new('trigger.dynamicfov.dynamicfactor', 'Automatic Factor', 0, 0, 180, 12, 0, 0, 250), bq.Checkbox:new('trigger.dynamicfov.draw', 'Draw Fov', 0, 0, 18, 18, nil) }, other2 = { bq.Groupbox:new('aimbot.dormant', 'Dormant Aimbot', 0, 0, 210, 160), bq.Multibox:new('aimbot.dormant.extra', 'Options', 0, 0, 180, 22, { bq.MultiboxItem:new('multibox_item', 'Force Baim'), bq.MultiboxItem:new('multibox_item', 'Quick Stop'), bq.MultiboxItem:new('multibox_item', 'Automatic Scope') }, nil), bq.Slider:new('aimbot.dormant.hitchance', 'Minimum Hit Chance', 0, 0, 180, 12, 1, 1, 100), bq.Slider:new('aimbot.dormant.mindmg', 'Minimum Damage', 0, 0, 180, 12, 1, 1, 100), bq.Text:new('aimbot.blank.headline', '', 0, 0, 0, 0, 'b', nil), bq.Groupbox:new('aimbot.dynamicfov', 'Double Tap', 0, 0, 210, 60), bq.Combobox:new('aimbot.doubletap.speed', 'Double Tap Speed', 0, 0, 180, 22, { 'Off', 'Fast', '+Fast', 'Max' }, nil) } }, weapons = { bq.Tab:new('weapons.pistols', 'Pistols', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 1;
    mariolua.log('Pistols tab pressed')
end, 'usp_silencer'), bq.Tab:new('weapons.hpistols', 'H. Pistols', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 2;
    mariolua.log('Heavy Pistols tab pressed')
end, 'deagle'), bq.Tab:new('weapons.smgs', 'SMGs', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 3;
    mariolua.log('SMGs tab pressed')
end, 'mp7'), bq.Tab:new('weapons.rifles', 'Rifles', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 4;
    mariolua.log('Rifles tab pressed')
end, 'ak47'), bq.Tab:new('weapons.scout', 'Scout', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 5;
    mariolua.log('Scout tab pressed')
end, 'ssg08'), bq.Tab:new('weapons.awp', 'AWP', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 6;
    mariolua.log('AWP tab pressed')
end, 'awp'), bq.Tab:new('weapons.auto', 'A. Sniper', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 7;
    mariolua.log('Auto Sniper tab pressed')
end, 'scar20'), bq.Tab:new('weapons.lmg', 'LMGs', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 8;
    mariolua.log('LMGs tab pressed')
end, 'negev'), bq.Tab:new('weapons.other', 'Other', 0, 0, 54, 28, 'weapons', function(self)
    self:SetCurrentTab()
    n.wep_tab = 9;
    mariolua.log('Others tab pressed')
end, 'taser') }, wepcfg_top = { bq.Checkbox:new('settings.adaptivewep', 'Enable Adaptive Weapon Config', 0, 0, 18, 18, nil) }, wepcfg = q.temp_wepcfg(), wepcfg2 = q.temp_wepcfg2(), resolver = { bq.Groupbox:new('resolver.gb', 'MarioLua Resolver', 0, 0, 220, 480), bq.Checkbox:new('resolver.enable', 'Enable', 0, 0, 18, 18, nil), bq.Checkbox:new('resolver.lowdelta', 'Force Low Delta', 0, 0, 18, 18, nil), bq.Keybox:new('resolver.toggle', 'Resolver On/Off Key', 0, 0, 200, 22, nil), bq.Combobox:new('resolver.performance', 'Resolver Performance', 0, 0, 200, 22, { 'Low', 'Medium', 'High', 'Very High' }, nil), bq.Text:new('resolver.headline4', '[Others]', 0, 0, 0, 0, 'b', nil), bq.Checkbox:new('resolver.indicator', 'Draw Side Indicator', 0, 0, 18, 18, nil), bq.Checkbox:new('resolver.log.miss', 'Chat Log Missed Shots', 0, 0, 18, 18, nil), bq.Checkbox:new('resolver.log.hit', 'Chat Log Hit Shots', 0, 0, 18, 18, nil), bq.Button:new('resolver.reset', 'Reset MarioLua Resolver', 0, 0, 200, 28, function()
    if n.resolver_t ~= nil then
        r.full_reset()
    end
end), bq.Button:new('settings.resolverstats', 'Print Resolver Stats In Console', 0, 0, 200, 28, function()
    mariolua.PrintInChat(r.print_resolver_stats[1])
    mariolua.PrintInChat(r.print_resolver_stats[2])
    mariolua.PrintInChat(r.print_resolver_stats[3])
    mariolua.PrintInChat(r.print_resolver_stats[4])
    mariolua.print(r.print_resolver_stats[1])
    mariolua.print(r.print_resolver_stats[2])
    mariolua.print(r.print_resolver_stats[3])
    mariolua.print(r.print_resolver_stats[4])
end) }, resolver2 = { bq.Text:new('resolver.headline3', '[ DEBUG ]', 0, 0, 0, 0, 'b', nil), bq.Multibox:new('resolver.module', 'Resolver Modules', 0, 0, 200, 22, { bq.MultiboxItem:new('module', 'Edge'), bq.MultiboxItem:new('module', 'Edge2'), bq.MultiboxItem:new('module', 'Trace'), bq.MultiboxItem:new('module', 'Trace2'), bq.MultiboxItem:new('module', 'Fraction'), bq.MultiboxItem:new('module', 'Fraction2'), bq.MultiboxItem:new('module', 'Predict'), bq.MultiboxItem:new('module', 'Damage'), bq.MultiboxItem:new('module', 'Damage2'), bq.MultiboxItem:new('module', 'Simple'), bq.MultiboxItem:new('module', 'Position'), bq.MultiboxItem:new('module', 'Condition'), bq.MultiboxItem:new('module', 'Lby'), bq.MultiboxItem:new('module', 'Animlayer Side'), bq.MultiboxItem:new('module', 'Animlayer Switch'), bq.MultiboxItem:new('module', 'Animlayer Low Delta'), bq.MultiboxItem:new('module', 'Pattern'), bq.MultiboxItem:new('module', 'Module Accuracy'), bq.MultiboxItem:new('module', 'Bruteforce'), bq.MultiboxItem:new('module', 'Low Delta'), bq.MultiboxItem:new('module', 'Fakeduck'), bq.MultiboxItem:new('module', 'Desync Detection') }, nil), bq.Slider:new('resolver.predict.localticks', 'Local Position-Prediction Ticks', 0, 0, 200, 12, 2, 0, 50), bq.Slider:new('resolver.predict.enemyticks', 'Enemy Position-Prediction Ticks', 0, 0, 200, 12, 2, 0, 50), bq.Slider:new('resolver.fakelimit', 'Yaw Limit', 0, 0, 200, 12, 60, 0, 60), bq.Checkbox:new('resolver.lby.pref', 'Prefer Lby While Standing', 0, 0, 18, 18, nil), bq.Checkbox:new('resolver.animlayer.pref', 'Prefer Animlayer Side', 0, 0, 18, 18, true), bq.Text:new('resolver.fdheadline', 'Fake duck detection', 0, 0, 0, 0, 'b', nil), bq.Slider:new('resolver.fakeduck.tick', 'Crouched Ticks', 0, 0, 200, 12, 5, 0, 64), bq.Slider:new('resolver.fakeduck.lby', 'Lby lower than', 0, 0, 200, 12, 10, 0, 60) }, antiaim = { tabs = { bq.Tab:new('antiaim.tab', 'AA', 0, 0, 80, 35, 'antiaim', function(self)
    self:SetCurrentTab()
    n.aa_tab = 'AA'
    mariolua.log('Anti-Aim tab pressed')
end, nil), bq.Tab:new('antiaim.tab2', 'AA 2', 0, 0, 80, 35, 'antiaim', function(self)
    self:SetCurrentTab()
    n.aa_tab = 'AA 2'
    mariolua.log('Anti-Aim 2 tab pressed')
end, nil) }, ['conditions'] = { bq.Tab:new('antiaim.tab.standing', 'Standing', 0, 0, 65, 30, 'antiaim.tab', function(self)
    self:SetCurrentTab()
    n.aa_condition_tab = 'Standing'
    mariolua.log('Anti-Aim Standing tab pressed')
end, nil), bq.Tab:new('antiaim.tab.moving', 'Moving', 0, 0, 65, 30, 'antiaim.tab', function(self)
    self:SetCurrentTab()
    n.aa_condition_tab = 'Moving'
    mariolua.log('Anti-Aim Moving tab pressed')
end, nil), bq.Tab:new('antiaim.tab.slowmotion', 'Slow Motion', 0, 0, 65, 30, 'antiaim.tab', function(self)
    self:SetCurrentTab()
    n.aa_condition_tab = 'Slow Motion'
    mariolua.log('Anti-Aim Slow Motion tab pressed')
end, nil) }, tab_1 = q.generate_aa_tab(), tab_2 = { [1] = { bq.Groupbox:new('antiaim.gb.keybinds', 'Keybinds', 0, 0, 230, 105), bq.Keybox:new('antiaim.switchkey', 'Legit Anti-Aim Switch Key', 0, 0, 200, 22, nil), bq.Keybox:new('antiaim.offkey', 'Legit Anti-Aim Off Key', 0, 0, 200, 22, nil), bq.Groupbox:new('antiaim.exception.gb', 'Anti-Aim Exceptions', 0, 20, 230, 240), bq.Checkbox:new('antiaim.exception', 'Enable', 0, 0, 18, 18, nil), bq.Slider:new('antiaim.exception.ping', 'Disable On Ping', 0, 0, 200, 12, 100, 0, 1000), bq.Slider:new('antiaim.exception.fps', 'Disable On Fps', 0, 0, 200, 12, 45, 0, 100), bq.Slider:new('antiaim.exception.loss', 'Disable On Loss', 0, 0, 200, 12, 50, 0, 100), bq.Slider:new('antiaim.exception.choke', 'Disable On Choke', 0, 0, 200, 12, 50, 0, 100), bq.Groupbox:new('antiaim.other', 'Other', 0, 20, 210, 60), bq.Checkbox:new('antiaim.freezetime', 'Freeze-time Anti-Aim', 0, 0, 18, 18, nil) }, [2] = { bq.Groupbox:new('antiaim.epeek', 'E-Peek', 0, 0, 210, 200), bq.Checkbox:new('antiaim.epeek.enabled', 'Enable', 0, 0, 18, 18, nil), bq.Combobox:new('antiaim.epeek.method', 'E-Peek Method', 0, 0, 185, 22, { 'Default', 'Automatic' }, nil), bq.Combobox:new('antiaim.epeek.mode', 'E-Peek Mode', 0, 0, 185, 22, { 'Toggle', 'Hold', 'Always' }, nil), bq.Keybox:new('antiaim.epeek.key', 'E-Peek Key', 0, 0, 185, 22, nil), bq.Groupbox:new('antiaim.config.gb', 'Anti-Aim Presets', 0, 20, 210, 250), bq.Combobox:new('antiaim.config.list', 'Presets', 0, 0, 185, 22, {}, 1), bq.Editbox:new('antiaim.config.input', '', 0, 0, 185, 22), bq.Button:new('antiaim.config.load', 'Load', 0, 0, 185, 30, function()
    n.antiaim.LoadConfig()
end), bq.Button:new('antiaim.config.save', 'Save', 0, 0, 185, 30, function()
    n.antiaim.SaveConfig()
end), bq.Button:new('antiaim.config.delete', 'Delete', 0, 0, 185, 30, function()
    n.antiaim.RemoveConfig()
end) } } }, misc = { bq.Groupbox:new('misc.thirdperson', 'Misc', 0, 0, 220, 600), bq.Keybox:new('misc.thirdpersonkey', 'Thirdperson Key', 0, 0, 200, 22, nil), bq.Slider:new('misc.thirdperson.dist', 'Thirdperson Distance', 0, 0, 190, 12, 120, 1, 200), bq.Checkbox:new('misc.thirdperson.collison', 'Disable Thirdperson Cam Collision', 0, 0, 18, 18, nil), bq.Button:new('misc.reportallenemies', 'Report All Enemies', 0, 0, 200, 28, function()
    if n.report.should_report ~= true then
        mariolua.PrintInChat("Reporting all enemies...")
    end ;
    n.report.should_report = true
end), bq.Button:new('misc.reportbotallenemies', 'Community Report All Enemies', 0, 0, 200, 28, function()
    local cc = 0;
    for ent = 1, globals.maxplayers() do
        if entity.is_enemy(ent) then
            cc = cc + 2;
            client.delay_call(-1 + cc, function()
                q.community_report_all_enemies(ent)
            end)
        end
    end
end), bq.Checkbox:new('misc.reportwrite', 'Write Report In Chat', 0, 0, 18, 18, nil), bq.Multibox:new('misc.features', 'Features', 0, 0, 200, 22, { bq.MultiboxItem:new('feature', 'Slide Walk'), bq.MultiboxItem:new('feature', 'Disable Engine Sleep'), bq.MultiboxItem:new('feature', 'Auto Hold Bot'), bq.MultiboxItem:new('feature', 'Vote Revealer'), bq.MultiboxItem:new('feature', 'Legit Fake Duck Fix'), bq.MultiboxItem:new('feature', 'Bypass sv_pure Fix') }, nil), bq.Button:new('misc.stopqueue', 'Stop Match Search', 0, 0, 200, 28, function()
    return g.StopMatchmaking()
end), bq.Checkbox:new('misc.clantag.enabled', 'Clantag Changer', 0, 0, 18, 18, nil), bq.Combobox:new('misc.clantag.tag', 'Clantag Presets', 0, 0, 200, 22, { 'Custom', 'MarioLua', 'MarioLua 2', 'Aimware', 'Cooking', 'pphud', 'Iniuria', 'Neverlose' }, nil), bq.Editbox:new('misc.clantag.input', 'Custom Clantag', 0, 0, 200, 22), bq.Combobox:new('misc.clantag.anim', 'Clantag Animation', 0, 0, 200, 22, { 'Default', 'Static', 'Time', 'Reverse', 'Classic', 'Loop' }, nil), bq.Slider:new('misc.clantag.speed', 'Clantag Speed', 0, 0, 190, 12, 25, 0, 100) }, misc2 = { bq.Groupbox:new('misc.fakelag', 'Fakelag', 0, 0, 220, 230), bq.Checkbox:new('misc.fakelag.enabled', 'Fakelag On-Peek', 0, 0, 18, 18, nil), bq.Checkbox:new('misc.fakelag.drawprediction', 'Draw Prediction', 0, 0, 18, 18, nil), bq.Slider:new('misc.fakelag.prediction', 'Peek Prediction', 0, 0, 190, 12, 7, 5, 15), bq.Slider:new('misc.fakelag.time', 'Lag Time', 0, 0, 190, 12, 75, 0, 300), bq.Groupbox:new('misc.namespam.gb', 'Name Spamer', 0, 45, 220, 260), bq.Combobox:new('misc.namespam.name', 'Spam Name', 0, 0, 200, 22, {}, 1), bq.Button:new('misc.namespam', 'Apply Name Spam', 0, 0, 200, 30, function()
    n.should_namespam = true;
    client.delay_call(10, function()
        n.should_namespam = false;
        n.spam_counter = 0
    end)
end), bq.Button:new('misc.namespam.addname', 'Add Name', 0, 0, 200, 25, function()
    n.should_addnamespam = true;
    if n.should_addnamespam then
        q.NameSpamAdd()
    end
end), bq.Button:new('misc.namespam.removename', 'Remove Name', 0, 0, 200, 25, function()
    n.should_removenamespam = true;
    if n.should_removenamespam then
        q.NameSpamRemove()
    end
end), bq.Checkbox:new('misc.namespam.restore', 'Restore Name', 0, 0, 18, 18, nil) }, indicators = { bq.Groupbox:new('indicators.gb', 'Indicators', 0, 0, 185, 360), bq.Multibox:new('indicators.itemlist', 'Indicators', 0, 0, 170, 22, {}, nil), bq.Combobox:new('indicators.font', 'Indicator Font', 0, 0, 170, 22, { 'Arial', 'Arial Black', 'Calibri', 'Comic Sans MS', 'Courier', 'Courier New', 'Impact', 'Lucida Console', 'Malgun Gothic', 'Microsoft Himalaya', 'Microsoft Sans Serif', 'Modern', 'MS Gothic', 'Nirmala UI', 'Segoe Print', 'Segoe Script', 'Segoe UI', 'Segoe UI Black', 'Segoe UI Symbol', 'System', 'Tahoma', 'Times New Roman', 'Verdana' }, nil), bq.Combobox:new('indicators.container.style', 'Container Style', 0, 0, 170, 22, { 'Gamesense', 'Aimware', 'Shadow' }, nil), bq.Combobox:new('indicators.arrow.style', 'Arrow Indicator Style', 0, 0, 170, 22, { ch['left_1'] .. ' ' .. ch['right_1'], ch['left_2'] .. ' ' .. ch['right_2'], ch['left_3'] .. ' ' .. ch['right_3'], ch['4'] .. ' ' .. ch['4'] }, nil), bq.Multibox:new('indicators.extras', 'Indicator Extras', 0, 0, 170, 22, { bq.MultiboxItem:new('extra', 'Draw Shadow'), bq.MultiboxItem:new('extra', 'Draw While Active'), bq.MultiboxItem:new('extra', 'Short Text'), bq.MultiboxItem:new('extra', 'Draw Container'), bq.MultiboxItem:new('extra', 'Rainbow Header'), bq.MultiboxItem:new('extra', 'Antialias'), bq.MultiboxItem:new('extra', 'Hide Skeet Indicators'), bq.MultiboxItem:new('extra', 'Use Skeet Indicators') }, nil), bq.Button:new('indicators.arrow.center', 'Center Arrow Indicators', 0, 0, 170, 28, function()
    q.center_arrow_indicator()
end), bq.Button:new('indicators.color.button', 'Apply Color From Clipboard', 0, 0, 170, 28, function()
    if n.clipboard == nil then
        return mariolua.log('Cant set color, clipboard is nil!')
    end ;
    if n.clipboard:gsub(n.clipboard:sub(-n.clipboard:len() + 1), '') == '#' then
        local ap, av, a5 = s.hex2rgb(n.clipboard)
        mariolua.log('Indicator color set to ' .. u.table_to_string3({ ap, av, a5, 255 }))
        p.indicator_color:SetValue({ ap, av, a5, 255 })
    else
        mariolua.log('Incompartible color code! Only hex colors. ' .. n.clipboard:gsub(n.clipboard:sub(-n.clipboard:len() + 1), ''))
    end
end) }, indicators2 = { bq.Groupbox:new('indicators.others.gb', 'Others', 0, 0, 260, 330), bq.Slider:new('indicators.alpha', 'Indicator Alpha', 0, 0, 230, 12, 255, 0, 255), bq.Slider:new('indicators.size', 'Indicator Size', 0, 0, 230, 12, 14, 0, 150), bq.Slider:new('indicators.arrow.alpha', 'Arrow Indicator Alpha', 0, 0, 230, 12, 255, 0, 255), bq.Slider:new('indicators.arrow.size', 'Arrow Indicator Size', 0, 0, 230, 12, 20, 0, 150), bq.Slider:new('indicators.arrow.spacing', 'Arrow Indicator Spacing', 0, 0, 230, 12, 30, 0, 300), bq.Slider:new('indicators.skeet.pos', 'Skeet Indicator Position', 0, 0, 230, 12, 0, 0, 20) }, visuals = { bq.Groupbox:new('visuals.gb', 'Visuals', 0, 0, 210, 440), bq.Multibox:new('visuals.flags.items', 'ESP Flags', 0, 0, 180, 22, { bq.MultiboxItem:new('watermark', 'Lethal'), bq.MultiboxItem:new('watermark', 'Resolving'), bq.MultiboxItem:new('watermark', 'Low-Delta'), bq.MultiboxItem:new('watermark', 'Slow-walk') }, nil), bq.Checkbox:new('visuals.watermark', 'Watermark', 0, 0, 18, 18, nil), bq.Multibox:new('visuals.watermark.items', 'Watermark Items', 0, 0, 180, 22, { bq.MultiboxItem:new('watermark', 'Username'), bq.MultiboxItem:new('watermark', 'Time'), bq.MultiboxItem:new('watermark', 'FPS'), bq.MultiboxItem:new('watermark', 'Latency'), bq.MultiboxItem:new('watermark', 'KDR'), bq.MultiboxItem:new('watermark', 'Velocity'), bq.MultiboxItem:new('watermark', 'Server tickrate') }, nil), bq.Combobox:new('visuals.watermark.style', 'Watermark Style', 0, 0, 180, 22, { 'Minimal', 'Gamesense', 'Aimware' }, nil), bq.Multibox:new('visuals.angle', 'Enemy Angles', 0, 0, 180, 22, { bq.MultiboxItem:new('angle', 'Real'), bq.MultiboxItem:new('angle', 'Fake'), bq.MultiboxItem:new('angle', 'LBY') }, nil), bq.Checkbox:new('visuals.fakelagchams', 'Fakelag Chams', 0, 0, 18, 18, nil), bq.Checkbox:new('visuals.angle.circle', 'Angle Circle', 0, 0, 18, 18, nil), bq.Checkbox:new('visuals.penetration.damage', 'Penetration Damage', 0, 0, 18, 18, nil), bq.Checkbox:new('visuals.skeleton', 'Skeleton', 0, 0, 18, 18, nil) }, settings = { bq.Groupbox:new('settings.gb', 'Settings', 0, 0, 210, 480), bq.Combobox:new('settings.guistyle', 'GUI Style', 0, 0, 190, 22, { 'Gamesense', 'Aimware', 'Fuhrer', 'UwU', 'Minimal' }, nil), bq.Checkbox:new('settings.custombackground', 'Custom GUI Background', 0, 0, 18, 18, nil), bq.Button:new('settings.importjpg', 'Load JPG/PNG From URL', 0, 0, 190, 28, function()
    mariolua.notify(5, 'Loading custom background image')
    local ao = [[
				'url': ']] .. n.clipboard .. [[',
				'user': ']] .. mariolua.userdata.name .. [['
			]]
    local eh = n.clipboard;

    aO.post('https://mariolua.at/hdf/auth/encode_image.php', ao, function(aQ)
        n.img_type = n.clipboard:match('.jpg') and 'jpg' or 'png'
        local es = t.decode(aQ)
        local en = readfile('mariolua_bg.dat')
        en = en or 'return {\n}'
        if en:match(eh) then
            ui.set(n.config_bg_string, eh)
            return
        end ;
        en = en:sub(1, #en - 1)
        writefile('mariolua_bg.dat', en .. '["' .. eh .. '"] = [[' .. aQ .. ']],\n}')
        ui.set(n.config_bg_string, eh)
        w.gpx.jpg.custom_bg = es
    end, nil, 'custom_background')

end), bq.Checkbox:new('settings.backup', 'Auto Backup Config', 0, 0, 18, 18, mariolua.userdata.backup, nil, function()
    database.write("mariolua_db_backup", true)
    print("true")
end, function()
    database.write("mariolua_db_backup", false)
    print("false")
end), bq.Multibox:new('settings.debugmode', 'Debug', 0, 0, 190, 22, { bq.MultiboxItem:new('debug', 'Logs'), bq.MultiboxItem:new('debug', 'Show In Bounds'), bq.MultiboxItem:new('debug', 'Show Debug Gui Objects'), bq.MultiboxItem:new('debug', 'Event Infos'), bq.MultiboxItem:new('debug', 'Player Infos'), bq.MultiboxItem:new('debug', 'Side Tracing'), bq.MultiboxItem:new('debug', 'Player Prediction') }, nil), bq.Button:new('settings.runstring', 'Run String From Clipboard', 0, 0, 190, 28, function()
    if not n.clipboard then
        return
    end ;
    mariolua.notify(5, 'Running lua string from clipboard')
    return loadstring(n.clipboard)()
end), bq.Checkbox:new('settings.guilock', 'Unlock GUI', 0, 0, 18, 18, nil), bq.Button:new('settings.exportcfg', 'Export Config To Clipboard', 0, 0, 190, 28, function()
    bq.SaveConfig()
    o.set_clipboard_text(o.VGUI_System, ui.get(n.config_string), ui.get(n.config_string):len())
    mariolua.notify(5, 'Exported Config to Clipboard and Console')
end), bq.Button:new('settings.importcfg', 'Import Config From Clipboard', 0, 0, 190, 28, function()
    if not n.clipboard then
        return
    end ;
    bq.LoadConfig(n.clipboard)
    mariolua.notify(5, 'Loaded Config from Clipboard')
    bq.SaveConfig()
end), bq.Text:new('settings.clipboardtext', 'Clipboard: no text', 0, 0, 0, 0, 'b', nil) }, settings2 = { bq.Groupbox:new('settings.gb2', 'Community Reportbot', 0, 0, 210, 170), bq.Button:new('settings.token.set', 'Set API Token', 0, 0, 190, 28, function()
    if not n.clipboard then
        return
    end ;
    database.write("mariolua_db_token", n.clipboard)
    mariolua.userdata.token = n.clipboard;
    mariolua.notify(5, 'Reportbot token set')
end), bq.Button:new('settings.token.remove', 'Remove API Token', 0, 0, 190, 28, function()
    database.write("mariolua_db_token", '')
    mariolua.userdata.token = ''
    mariolua.notify(5, 'Reportbot token removed')
end), bq.Button:new('settings.token.print', 'Print Set API Token', 0, 0, 190, 28, function()
    mariolua.print('Reportbot token: ' .. database.read("mariolua_db_token"))
    mariolua.PrintInChat('Reportbot token: ' .. database.read("mariolua_db_token"))
    mariolua.notify(5, 'Reportbot token: ' .. database.read("mariolua_db_token"))
end) } }
p.aimbot_enable = bq.Reference('trigger.ragetrigger')
p.aimbot_mode = bq.Reference('trigger.ragetrigger.mode')
p.aimbot_key = bq.Reference('trigger.triggerkey')
p.forcebaim_enable = bq.Reference('trigger.forcebaim')
p.forcebaim_mode = bq.Reference('trigger.forcebaim.mode')
p.forcebaim_key = bq.Reference('trigger.forcebaimkey')
p.autowall_enable = bq.Reference('trigger.autowall')
p.autowall_mode = bq.Reference('trigger.autowall.mode')
p.autowall_key = bq.Reference('trigger.autowallkey')
p.dmg_override_enable = bq.Reference('trigger.damage.override')
p.dmg_override_mode = bq.Reference('trigger.damage.override.mode')
p.dmg_override_key = bq.Reference('trigger.damage.override.key')
p.aimbot_wait_onshot = bq.Reference('aimbot.keybinds.onshot')
p.aimbot_wait_onshot_mode = bq.Reference('aimbot.keybinds.onshot.mode')
p.aimbot_wait_onshot_key = bq.Reference('aimbot.keybinds.onshot.key')
p.dormant_enable = bq.Reference('aimbot.dormant')
p.dormant_mode = bq.Reference('aimbot.dormant.mode')
p.dormant_key = bq.Reference('aimbot.dormant.key')
p.dormant_hitchance = bq.Reference('aimbot.dormant.hitchance')
p.dormant_mindmg = bq.Reference('aimbot.dormant.mindmg')
p.dormant_extra = bq.Reference('aimbot.dormant.extra')
p.dyn_fov_mode = bq.Reference('trigger.dynamicfov.mode')
p.dyn_fov_factor = bq.Reference('trigger.dynamicfov.dynamicfactor')
p.dyn_fov_draw = bq.Reference('trigger.dynamicfov.draw')
p.dyn_fov_min = bq.Reference('trigger.dynamicfov.min')
p.dyn_fov_max = bq.Reference('trigger.dynamicfov.max')
p.tr_legitaw_enabled = bq.Reference('trigger.legitautowall.enabled')
p.tr_legitaw_hitbox = bq.Reference('trigger.legitautowall.hitbox')
p.tr_legitaw_extrapolated = bq.Reference('trigger.legitautowall.extrapolated')
p.double_tap_speed = bq.Reference('aimbot.doubletap.speed')
p.resolver_enable = bq.Reference('resolver.enable')
p.resolver_experimental = bq.Reference('resolver.experimental')
p.resolver_force_lowdelta = bq.Reference('resolver.lowdelta')
p.resolver_toggle = bq.Reference('resolver.toggle')
p.resolver_performance = bq.Reference('resolver.performance')
p.resolver_draw_side_indicator = bq.Reference('resolver.indicator')
p.resolver_log_miss = bq.Reference('resolver.log.miss')
p.resolver_log_hit = bq.Reference('resolver.log.hit')
p.resolver_debug_headline = bq.Reference('resolver.headline3')
p.resolver_fdheadline = bq.Reference('resolver.fdheadline')
p.resolver_fakeduck_ticks = bq.Reference('resolver.fakeduck.tick')
p.resolver_fakeduck_lby = bq.Reference('resolver.fakeduck.lby')
p.resolver_pl_show = bq.Reference('resolver.pl.show')
p.resolver_modules = bq.Reference('resolver.module')
p.resolver_predict_local_ticks = bq.Reference('resolver.predict.localticks')
p.resolver_predict_enemy_ticks = bq.Reference('resolver.predict.enemyticks')
p.resolver_yawlimit = bq.Reference('resolver.fakelimit')
p.resolver_prefer_lby = bq.Reference('resolver.lby.pref')
p.resolver_prefer_animlayer = bq.Reference('resolver.animlayer.pref')
p.antiaim_enable = bq.Reference('antiaim.standing.enable')
p.antiaim_state = bq.Reference('antiaim.standing.state')
p.antiaim_fake = bq.Reference('antiaim.standing.fake')
p.antiaim_fake_jitter = bq.Reference('antiaim.standing.fake.jitter')
p.antiaim_fake_jitter_enable = bq.Reference('antiaim.standing.fake.jitter.enable')
p.antiaim_fake_jitter_speed = bq.Reference('antiaim.standing.fake.jitter.speed')
p.antiaim_body = bq.Reference('antiaim.standing.body')
p.antiaim_body_mode = bq.Reference('antiaim.standing.body.mode')
p.antiaim_lbyextras_mode = bq.Reference('antiaim.standing.lbyextras')
p.antiaim_freestanding = bq.Reference('antiaim.standing.mode')
p.antiaim_switch_key = bq.Reference('antiaim.switchkey')
p.antiaim_off_key = bq.Reference('antiaim.offkey')
p.antiaim_lby_mode = bq.Reference('antiaim.standing.lby')
p.antiaim_slowwalk = bq.Reference('antiaim.standing.slowwalk.enabled')
p.antiaim_slowwalk_speed = bq.Reference('antiaim.standing.slowwalk.speed')
p.antiaim_enable_anti_bruteforce = bq.Reference('antiaim.standing.antibruteforce.enable')
p.antiaim_anti_bruteforce_timeout = bq.Reference('antiaim.standing.antibruteforce.timeout')
p.antiaim_default_yaw_offset = bq.Reference('antiaim.standing.antibruteforce.yaw.default')
p.antiaim_max_yaw_delta = bq.Reference('antiaim.standing.antibruteforce.yaw.max')
p.antiaim_yaw_step = bq.Reference('antiaim.standing.antibruteforce.yaw.step')
p.antiaim_default_body_yaw_offset = bq.Reference('antiaim.standing.antibruteforce.bodyyaw.default')
p.antiaim_max_body_yaw_delta = bq.Reference('antiaim.standing.antibruteforce.bodyyaw.max')
p.antiaim_body_yaw_step = bq.Reference('antiaim.standing.antibruteforce.bodyyaw.step')
p.antiaim_exception_enable = bq.Reference('antiaim.exception')
p.antiaim_exception_fps = bq.Reference('antiaim.exception.fps')
p.antiaim_exception_ping = bq.Reference('antiaim.exception.ping')
p.antiaim_exception_choke = bq.Reference('antiaim.exception.choke')
p.antiaim_exception_loss = bq.Reference('antiaim.exception.loss')
p.antiaim_epeek = bq.Reference('antiaim.epeek.enabled')
p.antiaim_epeek_mode = bq.Reference('antiaim.epeek.mode')
p.antiaim_epeek_method = bq.Reference('antiaim.epeek.method')
p.antiaim_epeek_key = bq.Reference('antiaim.epeek.key')
p.antiaim_freezetime = bq.Reference('antiaim.freezetime')
p.antiaim_config_list = bq.Reference('antiaim.config.list')
p.antiaim_config_input = bq.Reference('antiaim.config.input')
p.antiaim_configs = bq.SaveVar:new('antiaim.config.saves', {})
p.clantag_enabled = bq.Reference('misc.clantag.enabled')
p.clantag_tag = bq.Reference('misc.clantag.tag')
p.clantag_speed = bq.Reference('misc.clantag.speed')
p.clantag_anim = bq.Reference('misc.clantag.anim')
p.clantag_custom = bq.Reference('misc.clantag.input')
p.thirdperson_key = bq.Reference('misc.thirdpersonkey')
p.thirdperson_dist = bq.Reference('misc.thirdperson.dist')
p.thirdperson_collision = bq.Reference('misc.thirdperson.collison')
p.misc_features = bq.Reference('misc.features')
p.report_write_chat = bq.Reference('misc.reportwrite')
p.misc_maxusrcmdprocessticks = bq.Reference('misc.maxusrcmdprocessticks')
p.misc_fakelagonpeek = bq.Reference('misc.fakelag.enabled')
p.misc_fakelagonpeek_drawprediction = bq.Reference('misc.fakelag.drawprediction')
p.misc_fakelagonpeek_prediction = bq.Reference('misc.fakelag.prediction')
p.misc_fakelagonpeek_time = bq.Reference('misc.fakelag.time')
p.misc_forcehvh = bq.Reference('misc.forcehvh')
p.misc_aimbot_log = bq.Reference('misc.aim.log')
p.misc_namespam_restore = bq.Reference('misc.namespam.restore')
p.misc_namespam_name = bq.Reference('misc.namespam.name')
p.misc_namespam_setname = bq.Reference('misc.namespam.setname')
p.misc_namespam_addname = bq.Reference('misc.namespam.addname')
p.misc_namespam_removename = bq.Reference('misc.namespam.removename')
p.indicator = bq.Indicator:new('main')
p.indicator_size = bq.Reference('indicators.size')
p.indicator_alpha = bq.Reference('indicators.alpha')
p.indicator_extras = bq.Reference('indicators.extras')
p.indicator_container = bq.Reference('indicators.container.style')
p.indicator_arrow_style = bq.Reference('indicators.arrow.style')
p.indicator_arrow_size = bq.Reference('indicators.arrow.size')
p.indicator_arrow_alpha = bq.Reference('indicators.arrow.alpha')
p.indicator_arrow_spacing = bq.Reference('indicators.arrow.spacing')
p.indicator_itemlist = bq.Reference('indicators.itemlist')
p.indicator_fontitems = bq.Reference('indicators.font')
p.indicator_skeet_pos = bq.Reference('indicators.skeet.pos')
p.indicator_color = bq.SaveVar:new('indicator.color', n.color)
p.esp_flags = bq.Reference('visuals.flags.items')
p.visuals_fakelagchams = bq.Reference('visuals.fakelagchams')
p.visuals_watermark = bq.Reference('visuals.watermark')
p.visuals_watermark_items = bq.Reference('visuals.watermark.items')
p.visuals_watermark_style = bq.Reference('visuals.watermark.style')
p.visuals_angle_circle = bq.Reference('visuals.angle.circle')
p.visuals_penetration_damage = bq.Reference('visuals.penetration.damage')
p.visuals_angle = bq.Reference('visuals.angle')
p.visuals_skeleton = bq.Reference('visuals.skeleton')
p.settings_guistyle = bq.Reference('settings.guistyle')
p.settings_custombackground = bq.Reference('settings.custombackground')
p.settings_clipboardtext = bq.Reference('settings.clipboardtext')
p.settings_debugmode = bq.Reference('settings.debugmode')
p.settings_guilock = bq.Reference('settings.guilock')
p.settings_backup = bq.Reference('settings.backup')
p.settings_adaptivewep = bq.Reference('settings.adaptivewep')
p.settings_crack_target = bq.Reference('settings.crack.target')
p.settings_crack_start = bq.Reference('settings.crack.start')
p.wep_pistol_targethitbox = bq.Reference('weapon.pistol.targethitbox')
p.wep_pistol_multipoint = bq.Reference('weapon.pistol.multipoint')
p.wep_pistol_multipoint_scale = bq.Reference('weapon.pistol.multipoint.scale')
p.wep_pistol_safepoint_prefer = bq.Reference('weapon.pistol.safepoint.prefer')
p.wep_pistol_avoid = bq.Reference('weapon.pistol.avoid')
p.wep_pistol_autofire = bq.Reference('weapon.pistol.autofire')
p.wep_pistol_silentaim = bq.Reference('weapon.pistol.silentaim')
p.wep_pistol_hitchance = bq.Reference('weapon.pistol.hitchance')
p.wep_pistol_damage = bq.Reference('weapon.pistol.damage')
p.wep_pistol_damage_override = bq.Reference('weapon.pistol.damage.override')
p.wep_pistol_removerecoil = bq.Reference('weapon.pistol.removerecoil')
p.wep_pistol_delayshot = bq.Reference('weapon.pistol.delayshot')
p.wep_pistol_quickstop = bq.Reference('weapon.pistol.quickstop')
p.wep_pistol_quickstop_options = bq.Reference('weapon.pistol.quickstop.options')
p.wep_pistol_bodyaim_lethal = bq.Reference('weapon.pistol.bodyaim.lethal')
p.wep_pistol_bodyaim_prefer = bq.Reference('weapon.pistol.bodyaim.prefer')
p.wep_pistol_bodyaim_disablers = bq.Reference('weapon.pistol.bodyaim.disablers')
p.wep_pistol_doubletap = bq.Reference('weapon.pistol.doubletap')
p.wep_pistol_doubletap_mode = bq.Reference('weapon.pistol.doubletap.mode')
p.wep_pistol_doubletap_hitchance = bq.Reference('weapon.pistol.doubletap.hitchance')
p.wep_pistol_doubletap_fakelaglimit = bq.Reference('weapon.pistol.doubletap.fakelaglimit')
p.wep_pistol_doubletap_quickstop = bq.Reference('weapon.pistol.doubletap.quickstop')
p.wep_hpistol_targethitbox = bq.Reference('weapon.hpistol.targethitbox')
p.wep_hpistol_multipoint = bq.Reference('weapon.hpistol.multipoint')
p.wep_hpistol_multipoint_scale = bq.Reference('weapon.hpistol.multipoint.scale')
p.wep_hpistol_safepoint_prefer = bq.Reference('weapon.hpistol.safepoint.prefer')
p.wep_hpistol_avoid = bq.Reference('weapon.hpistol.avoid')
p.wep_hpistol_autofire = bq.Reference('weapon.hpistol.autofire')
p.wep_hpistol_silentaim = bq.Reference('weapon.hpistol.silentaim')
p.wep_hpistol_hitchance = bq.Reference('weapon.hpistol.hitchance')
p.wep_hpistol_damage = bq.Reference('weapon.hpistol.damage')
p.wep_hpistol_damage_override = bq.Reference('weapon.hpistol.damage.override')
p.wep_hpistol_removerecoil = bq.Reference('weapon.hpistol.removerecoil')
p.wep_hpistol_delayshot = bq.Reference('weapon.hpistol.delayshot')
p.wep_hpistol_quickstop = bq.Reference('weapon.hpistol.quickstop')
p.wep_hpistol_quickstop_options = bq.Reference('weapon.hpistol.quickstop.options')
p.wep_hpistol_bodyaim_lethal = bq.Reference('weapon.hpistol.bodyaim.lethal')
p.wep_hpistol_bodyaim_prefer = bq.Reference('weapon.hpistol.bodyaim.prefer')
p.wep_hpistol_bodyaim_disablers = bq.Reference('weapon.hpistol.bodyaim.disablers')
p.wep_hpistol_doubletap = bq.Reference('weapon.hpistol.doubletap')
p.wep_hpistol_doubletap_mode = bq.Reference('weapon.hpistol.doubletap.mode')
p.wep_hpistol_doubletap_hitchance = bq.Reference('weapon.hpistol.doubletap.hitchance')
p.wep_hpistol_doubletap_fakelaglimit = bq.Reference('weapon.hpistol.doubletap.fakelaglimit')
p.wep_hpistol_doubletap_quickstop = bq.Reference('weapon.hpistol.doubletap.quickstop')
p.wep_smg_targethitbox = bq.Reference('weapon.smg.targethitbox')
p.wep_smg_multipoint = bq.Reference('weapon.smg.multipoint')
p.wep_smg_multipoint_scale = bq.Reference('weapon.smg.multipoint.scale')
p.wep_smg_safepoint_prefer = bq.Reference('weapon.smg.safepoint.prefer')
p.wep_smg_avoid = bq.Reference('weapon.smg.avoid')
p.wep_smg_autofire = bq.Reference('weapon.smg.autofire')
p.wep_smg_silentaim = bq.Reference('weapon.smg.silentaim')
p.wep_smg_hitchance = bq.Reference('weapon.smg.hitchance')
p.wep_smg_damage = bq.Reference('weapon.smg.damage')
p.wep_smg_damage_override = bq.Reference('weapon.smg.damage.override')
p.wep_smg_removerecoil = bq.Reference('weapon.smg.removerecoil')
p.wep_smg_delayshot = bq.Reference('weapon.smg.delayshot')
p.wep_smg_quickstop = bq.Reference('weapon.smg.quickstop')
p.wep_smg_quickstop_options = bq.Reference('weapon.smg.quickstop.options')
p.wep_smg_bodyaim_lethal = bq.Reference('weapon.smg.bodyaim.lethal')
p.wep_smg_bodyaim_prefer = bq.Reference('weapon.smg.bodyaim.prefer')
p.wep_smg_bodyaim_disablers = bq.Reference('weapon.smg.bodyaim.disablers')
p.wep_smg_doubletap = bq.Reference('weapon.smg.doubletap')
p.wep_smg_doubletap_mode = bq.Reference('weapon.smg.doubletap.mode')
p.wep_smg_doubletap_hitchance = bq.Reference('weapon.smg.doubletap.hitchance')
p.wep_smg_doubletap_fakelaglimit = bq.Reference('weapon.smg.doubletap.fakelaglimit')
p.wep_smg_doubletap_quickstop = bq.Reference('weapon.smg.doubletap.quickstop')
p.wep_rifle_targethitbox = bq.Reference('weapon.rifle.targethitbox')
p.wep_rifle_multipoint = bq.Reference('weapon.rifle.multipoint')
p.wep_rifle_multipoint_scale = bq.Reference('weapon.rifle.multipoint.scale')
p.wep_rifle_safepoint_prefer = bq.Reference('weapon.rifle.safepoint.prefer')
p.wep_rifle_avoid = bq.Reference('weapon.rifle.avoid')
p.wep_rifle_autofire = bq.Reference('weapon.rifle.autofire')
p.wep_rifle_silentaim = bq.Reference('weapon.rifle.silentaim')
p.wep_rifle_hitchance = bq.Reference('weapon.rifle.hitchance')
p.wep_rifle_damage = bq.Reference('weapon.rifle.damage')
p.wep_rifle_damage_override = bq.Reference('weapon.rifle.damage.override')
p.wep_rifle_removerecoil = bq.Reference('weapon.rifle.removerecoil')
p.wep_rifle_delayshot = bq.Reference('weapon.rifle.delayshot')
p.wep_rifle_quickstop = bq.Reference('weapon.rifle.quickstop')
p.wep_rifle_quickstop_options = bq.Reference('weapon.rifle.quickstop.options')
p.wep_rifle_bodyaim_lethal = bq.Reference('weapon.rifle.bodyaim.lethal')
p.wep_rifle_bodyaim_prefer = bq.Reference('weapon.rifle.bodyaim.prefer')
p.wep_rifle_bodyaim_disablers = bq.Reference('weapon.rifle.bodyaim.disablers')
p.wep_rifle_doubletap = bq.Reference('weapon.rifle.doubletap')
p.wep_rifle_doubletap_mode = bq.Reference('weapon.rifle.doubletap.mode')
p.wep_rifle_doubletap_hitchance = bq.Reference('weapon.rifle.doubletap.hitchance')
p.wep_rifle_doubletap_fakelaglimit = bq.Reference('weapon.rifle.doubletap.fakelaglimit')
p.wep_rifle_doubletap_quickstop = bq.Reference('weapon.rifle.doubletap.quickstop')
p.wep_scout_targethitbox = bq.Reference('weapon.scout.targethitbox')
p.wep_scout_multipoint = bq.Reference('weapon.scout.multipoint')
p.wep_scout_multipoint_scale = bq.Reference('weapon.scout.multipoint.scale')
p.wep_scout_safepoint_prefer = bq.Reference('weapon.scout.safepoint.prefer')
p.wep_scout_avoid = bq.Reference('weapon.scout.avoid')
p.wep_scout_autofire = bq.Reference('weapon.scout.autofire')
p.wep_scout_silentaim = bq.Reference('weapon.scout.silentaim')
p.wep_scout_hitchance = bq.Reference('weapon.scout.hitchance')
p.wep_scout_damage = bq.Reference('weapon.scout.damage')
p.wep_scout_damage_override = bq.Reference('weapon.scout.damage.override')
p.wep_scout_removerecoil = bq.Reference('weapon.scout.removerecoil')
p.wep_scout_delayshot = bq.Reference('weapon.scout.delayshot')
p.wep_scout_quickstop = bq.Reference('weapon.scout.quickstop')
p.wep_scout_quickstop_options = bq.Reference('weapon.scout.quickstop.options')
p.wep_scout_bodyaim_lethal = bq.Reference('weapon.scout.bodyaim.lethal')
p.wep_scout_bodyaim_prefer = bq.Reference('weapon.scout.bodyaim.prefer')
p.wep_scout_bodyaim_disablers = bq.Reference('weapon.scout.bodyaim.disablers')
p.wep_scout_doubletap = bq.Reference('weapon.scout.doubletap')
p.wep_scout_doubletap_mode = bq.Reference('weapon.scout.doubletap.mode')
p.wep_scout_doubletap_hitchance = bq.Reference('weapon.scout.doubletap.hitchance')
p.wep_scout_doubletap_fakelaglimit = bq.Reference('weapon.scout.doubletap.fakelaglimit')
p.wep_scout_doubletap_quickstop = bq.Reference('weapon.scout.doubletap.quickstop')
p.wep_awp_targethitbox = bq.Reference('weapon.awp.targethitbox')
p.wep_awp_multipoint = bq.Reference('weapon.awp.multipoint')
p.wep_awp_multipoint_scale = bq.Reference('weapon.awp.multipoint.scale')
p.wep_awp_safepoint_prefer = bq.Reference('weapon.awp.safepoint.prefer')
p.wep_awp_avoid = bq.Reference('weapon.awp.avoid')
p.wep_awp_autofire = bq.Reference('weapon.awp.autofire')
p.wep_awp_silentaim = bq.Reference('weapon.awp.silentaim')
p.wep_awp_hitchance = bq.Reference('weapon.awp.hitchance')
p.wep_awp_damage = bq.Reference('weapon.awp.damage')
p.wep_awp_damage_override = bq.Reference('weapon.awp.damage.override')
p.wep_awp_removerecoil = bq.Reference('weapon.awp.removerecoil')
p.wep_awp_delayshot = bq.Reference('weapon.awp.delayshot')
p.wep_awp_quickstop = bq.Reference('weapon.awp.quickstop')
p.wep_awp_quickstop_options = bq.Reference('weapon.awp.quickstop.options')
p.wep_awp_bodyaim_lethal = bq.Reference('weapon.awp.bodyaim.lethal')
p.wep_awp_bodyaim_prefer = bq.Reference('weapon.awp.bodyaim.prefer')
p.wep_awp_bodyaim_disablers = bq.Reference('weapon.awp.bodyaim.disablers')
p.wep_awp_doubletap = bq.Reference('weapon.awp.doubletap')
p.wep_awp_doubletap_mode = bq.Reference('weapon.awp.doubletap.mode')
p.wep_awp_doubletap_hitchance = bq.Reference('weapon.awp.doubletap.hitchance')
p.wep_awp_doubletap_fakelaglimit = bq.Reference('weapon.awp.doubletap.fakelaglimit')
p.wep_awp_doubletap_quickstop = bq.Reference('weapon.awp.doubletap.quickstop')
p.wep_asniper_targethitbox = bq.Reference('weapon.asniper.targethitbox')
p.wep_asniper_multipoint = bq.Reference('weapon.asniper.multipoint')
p.wep_asniper_multipoint_scale = bq.Reference('weapon.asniper.multipoint.scale')
p.wep_asniper_safepoint_prefer = bq.Reference('weapon.asniper.safepoint.prefer')
p.wep_asniper_avoid = bq.Reference('weapon.asniper.avoid')
p.wep_asniper_autofire = bq.Reference('weapon.asniper.autofire')
p.wep_asniper_silentaim = bq.Reference('weapon.asniper.silentaim')
p.wep_asniper_hitchance = bq.Reference('weapon.asniper.hitchance')
p.wep_asniper_damage = bq.Reference('weapon.asniper.damage')
p.wep_asniper_damage_override = bq.Reference('weapon.asniper.damage.override')
p.wep_asniper_removerecoil = bq.Reference('weapon.asniper.removerecoil')
p.wep_asniper_delayshot = bq.Reference('weapon.asniper.delayshot')
p.wep_asniper_quickstop = bq.Reference('weapon.asniper.quickstop')
p.wep_asniper_quickstop_options = bq.Reference('weapon.asniper.quickstop.options')
p.wep_asniper_bodyaim_lethal = bq.Reference('weapon.asniper.bodyaim.lethal')
p.wep_asniper_bodyaim_prefer = bq.Reference('weapon.asniper.bodyaim.prefer')
p.wep_asniper_bodyaim_disablers = bq.Reference('weapon.asniper.bodyaim.disablers')
p.wep_asniper_doubletap = bq.Reference('weapon.asniper.doubletap')
p.wep_asniper_doubletap_mode = bq.Reference('weapon.asniper.doubletap.mode')
p.wep_asniper_doubletap_hitchance = bq.Reference('weapon.asniper.doubletap.hitchance')
p.wep_asniper_doubletap_fakelaglimit = bq.Reference('weapon.asniper.doubletap.fakelaglimit')
p.wep_asniper_doubletap_quickstop = bq.Reference('weapon.asniper.doubletap.quickstop')
p.wep_lmg_targethitbox = bq.Reference('weapon.lmg.targethitbox')
p.wep_lmg_multipoint = bq.Reference('weapon.lmg.multipoint')
p.wep_lmg_multipoint_scale = bq.Reference('weapon.lmg.multipoint.scale')
p.wep_lmg_safepoint_prefer = bq.Reference('weapon.lmg.safepoint.prefer')
p.wep_lmg_avoid = bq.Reference('weapon.lmg.avoid')
p.wep_lmg_autofire = bq.Reference('weapon.lmg.autofire')
p.wep_lmg_silentaim = bq.Reference('weapon.lmg.silentaim')
p.wep_lmg_hitchance = bq.Reference('weapon.lmg.hitchance')
p.wep_lmg_damage = bq.Reference('weapon.lmg.damage')
p.wep_lmg_damage_override = bq.Reference('weapon.lmg.damage.override')
p.wep_lmg_removerecoil = bq.Reference('weapon.lmg.removerecoil')
p.wep_lmg_delayshot = bq.Reference('weapon.lmg.delayshot')
p.wep_lmg_quickstop = bq.Reference('weapon.lmg.quickstop')
p.wep_lmg_quickstop_options = bq.Reference('weapon.lmg.quickstop.options')
p.wep_lmg_bodyaim_lethal = bq.Reference('weapon.lmg.bodyaim.lethal')
p.wep_lmg_bodyaim_prefer = bq.Reference('weapon.lmg.bodyaim.prefer')
p.wep_lmg_bodyaim_disablers = bq.Reference('weapon.lmg.bodyaim.disablers')
p.wep_lmg_doubletap = bq.Reference('weapon.lmg.doubletap')
p.wep_lmg_doubletap_mode = bq.Reference('weapon.lmg.doubletap.mode')
p.wep_lmg_doubletap_hitchance = bq.Reference('weapon.lmg.doubletap.hitchance')
p.wep_lmg_doubletap_fakelaglimit = bq.Reference('weapon.lmg.doubletap.fakelaglimit')
p.wep_lmg_doubletap_quickstop = bq.Reference('weapon.lmg.doubletap.quickstop')
function q.lock_indicators()
    local et;
    if n.mouse1_key_state and s.inBounds(er.pos.x, er.pos.y - 24, er.pos.x + er.width + n.gs_menu_w, er.pos.y + n.gs_menu_h - 24, 10) or n.mouse1_key_state and et then
        et = true;
        n.block_moving_indicator = true
    elseif n.mouse1_key_state and not s.inBounds(er.pos.x, er.pos.y - 24, er.pos.x + er.width + n.gs_menu_w, er.pos.y + n.gs_menu_h - 24, 10) and et then
        n.block_moving_indicator = true
    elseif not n.mouse1_key_state and s.inBounds(er.pos.x, er.pos.y - 24, er.pos.x + er.width + n.gs_menu_w, er.pos.y + n.gs_menu_h - 24, 10) then
        et = false
    end ;
    if not n.mouse1_key_state then
        n.block_moving_indicator = false
    end
end;
n.enabled_resolver_modules = { 'Damage', 'Condition', 'Animlayer Side', 'Animlayer Low Delta', 'Module Accuracy', 'Bruteforce', 'Low Delta', 'Desync Detection' }
n.all_resolver_modules = { 'Edge', 'Edge2', 'Trace', 'Trace2', 'Fraction', 'Fraction2', 'Predict', 'Damage', 'Damage2', 'Simple', 'Position', 'Lby', 'Animlayer Side' }
n.resolver_performance = nil;
n.resolver_modules = { ['Low'] = { 'Fraction2', 'Animlayer Side' }, ['Medium'] = { 'Damage2', 'Animlayer Side' }, ['High'] = { 'Edge2', 'Damage2', 'Animlayer Side' }, ['Very High'] = { 'Edge2', 'Damage', 'Damage2', 'Animlayer Side' } }
for I = 1, #n.enabled_resolver_modules do
    p.resolver_modules:GetByName(n.enabled_resolver_modules[I]):SetValue(true)
end ;
function q.disable_all_resolver_modules()
    for I = 1, #n.all_resolver_modules do
        p.resolver_modules:GetByName(n.all_resolver_modules[I]):SetValue(false)
    end
end;
p.resolver_prefer_lby:SetValue(false)
p.resolver_prefer_animlayer:SetValue(true)
p.resolver_performance:SetValue('Medium')
function q.set_resolver_modules()
    local eu = p.resolver_performance:GetItemName()
    if n.resolver_performance == eu then
        return
    end ;
    q.disable_all_resolver_modules()
    for I = 1, #n.resolver_modules[eu] do
        p.resolver_modules:GetByName(n.resolver_modules[eu][I]):SetValue(true)
    end ;
    if r.data ~= nil then
        r.data = {}
    end ;
    n.resolver_performance = eu
end;
n.set_debug_object_vis = nil;
function q.InvisibleObjects()
    if not p.settings_debugmode:IsEnabled('Show Debug Gui Objects') and n.set_debug_object_vis then
        p.resolver_modules:SetInvisible(true)
        p.resolver_predict_local_ticks:SetInvisible(true)
        p.resolver_predict_enemy_ticks:SetInvisible(true)
        p.resolver_yawlimit:SetInvisible(true)
        p.resolver_debug_headline:SetInvisible(true)
        p.resolver_fdheadline:SetInvisible(true)
        p.resolver_fakeduck_ticks:SetInvisible(true)
        p.resolver_fakeduck_lby:SetInvisible(true)
        p.resolver_prefer_lby:SetInvisible(true)
        p.resolver_prefer_animlayer:SetInvisible(true)
        n.set_debug_object_vis = false
    elseif p.settings_debugmode:IsEnabled('Show Debug Gui Objects') and not n.set_debug_object_vis then
        p.resolver_modules:SetInvisible(false)
        p.resolver_predict_local_ticks:SetInvisible(false)
        p.resolver_predict_enemy_ticks:SetInvisible(false)
        p.resolver_yawlimit:SetInvisible(false)
        p.resolver_debug_headline:SetInvisible(false)
        p.resolver_fdheadline:SetInvisible(false)
        p.resolver_fakeduck_ticks:SetInvisible(false)
        p.resolver_fakeduck_lby:SetInvisible(false)
        p.resolver_prefer_lby:SetInvisible(false)
        p.resolver_prefer_animlayer:SetInvisible(false)
        n.set_debug_object_vis = true
    end
end;
n.set_wep_tab = nil;
function q.handle_weapon_tabs()
    if ui.is_menu_open() and not n.set_wep_tab then
        local ev = x.GetWeapon(local_player)
        if entity.is_alive(local_player) and ev then
            for I = 1, #n.wepcfg_wepgroups do
                if u.Contains(n.wepcfg_wepgroups[I], ev) then
                    n.wep_tab = I;
                    n.current_wep_tab = n.weapon_tabs[I]
                end
            end
        end ;
        n.set_wep_tab = true
    elseif n.set_wep_tab and not ui.is_menu_open() then
        n.set_wep_tab = false
    end
end;
function q.handleWindow()
    mariolua.debug.draw['in_bounds'] = p.settings_debugmode:IsEnabled('Show In Bounds')
    mariolua.debug.draw['event_infos'] = p.settings_debugmode:IsEnabled('Event Infos')
    mariolua.debug.draw['player_infos'] = p.settings_debugmode:IsEnabled('Player Infos')
    mariolua.debug.draw['dmg_trace'] = p.settings_debugmode:IsEnabled('Side Tracing')
    mariolua.debug.draw['player_prediction'] = p.settings_debugmode:IsEnabled('Player Prediction')
    mariolua.debug.print = p.settings_debugmode:IsEnabled('Logs')
    if n.used_Object == nil then
        n.used_Object = ''
    end ;
    if not n.mouse1_key_state and n.used_Object ~= "" then
        mariolua.log(n.used_Object .. " did not reset variable back!")
        n.used_Object = ""
    end ;
    if n.used_Object ~= "" and n.used_Object ~= " " then
        mariolua.log("Current used object: " .. n.used_Object)
    end ;
    if ui.is_menu_open() and not n.is_window_hidden then
        if n.used_Object == "" or n.used_Object == " " then
            q.lock_indicators()
        end ;
        window_w, window_h = er:GetWindowSize()
        if (window_w ~= n.gs_menu_x - 510 or window_y ~= n.gs_menu_y + 24) and not n.moving_window then
            er:SetWindowPos(n.gs_menu_x - 510, n.gs_menu_y + 24)
        end ;
        if window_h ~= n.gs_menu_h - 28 then
            er:SetWindowSize(window_w, n.gs_menu_h - 28)
        end ;
        er:SetActive(true)
    elseif not n.block_moving_indicator then
        n.block_moving_indicator = true;
        er:SetActive(false)
    end ;
    q.InvisibleObjects()
end;
local ew, ex = ui.reference('Visuals', 'Effects', 'Force third person (alive)')
local ey, ez = ui.reference('AA', 'Fake lag', 'Enabled')
local eA, eB = ui.reference('RAGE', 'Aimbot', 'Enabled')
local eC, eD = ui.reference('AA', 'Fake lag', 'Enabled')
local eE, eF = ui.reference('AA', 'Other', 'Slow motion')
local eG = 130;
n.indicator_text_font = w.create_font(p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text, 25, 800, 0)
n.indicator_arrow_font = w.create_font(p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text, 20, 20, 0)
n.IndicateBodyYaw_Font = w.create_font(p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text, 40, 40, 0)
local eH = { { name = "Rage Trigger", short_name = "RT", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "RT"
        else
            eL = "Rage Trigger"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if p.aimbot_enable:GetValue() and (p.aimbot_mode:GetItemName() == "Toggle" and p.aimbot_key:IsKeyToggle() or p.aimbot_mode:GetItemName() == "Hold" and p.aimbot_key:IsKeyDown()) then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, eK, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Auto Wall", short_name = "AW", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "AW"
        else
            eL = "Auto Wall"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if ui.get(n.ref.rage.autowall) then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, eK, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Force Body Aim", short_name = "FB", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "FB"
        else
            eL = "Force Body Aim"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if p.forcebaim_enable:GetValue() and ui.get(n.ref.rage.force_baim_key) then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, eK, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Min Dmg Override", short_name = "MIN DMG", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "MIN DMG"
        else
            eL = "Min Dmg Override"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if p.dmg_override_enable:GetValue() and (p.dmg_override_mode:GetItemName() == "Toggle" and p.dmg_override_key:IsKeyToggle() or p.dmg_override_mode:GetItemName() == "Hold" and p.dmg_override_key:IsKeyDown()) then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, eK, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Force On Shot", short_name = "FOS", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "FOS"
        else
            eL = "Force On Shot"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if p.aimbot_wait_onshot:GetValue() and n.wait_onshot_enabled then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, eK, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Anti-Aim", short_name = "Anti-Aim", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL, eM, eN;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "AA"
            eM = "F-AA"
            eN = "M-AA"
        else
            eL = "Anti-Aim"
            eM = "Freestanding"
            eN = "Manual"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if not ui.get(n.ref.aa.enabled) or n.antiaim.state == "off" then
            local eO, eP = w.get_text_size(n.indicator_text_font, eL .. ' [Off]', p.indicator_extras:IsEnabled('Draw Shadow'))
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(255, 255, 255, eK, eL .. ' [Off]')
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, eO + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL .. ' [Off]', p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        elseif p.antiaim_freestanding:GetItemName() ~= 'Manual' then
            if not (local_player == nil or entity.get_prop(local_player, 'm_lifeState') ~= 0) then
                local eQ = entity.get_prop(local_player, 'm_flPoseParameter', 11)
                if eQ ~= nil then
                    eQ = eQ * 120 - 60;
                    if eQ >= 0 then
                        n.antiaim.real = 'right'
                    else
                        n.antiaim.real = 'left'
                    end
                end
            end ;
            local eO, eP = w.get_text_size(n.indicator_text_font, eM .. ' [L]', p.indicator_extras:IsEnabled('Draw Shadow'))
            if n.antiaim.real == 'left' then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(124, 195, 13, db, eM .. ' [L]')
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, eO + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 124, 195, 13, db, n.indicator_text_font, eM .. ' [L]', p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            elseif n.antiaim.real == 'right' then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 0, 0, db, eM .. ' [R]')
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, eO + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 0, 0, db, n.indicator_text_font, eM .. ' [R]', p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            else
                local eO, eP = w.get_text_size(n.indicator_text_font, eM)
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, db, eM)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, eO + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, db, n.indicator_text_font, eM)
                end
            end
        elseif p.antiaim_freestanding:GetItemName() == 'Manual' then
            local eO, eP = w.get_text_size(n.indicator_text_font, eN .. ' [L]', p.indicator_extras:IsEnabled('Draw Shadow'))
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                if ui.get(n.ref.aa.body_yaw[2]) < 0 then
                    renderer.indicator(124, 195, 13, db, eN .. ' [L]')
                else
                    renderer.indicator(255, 0, 0, db, eN .. ' [R]')
                end
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, eO + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                if ui.get(n.ref.aa.body_yaw[2]) < 0 then
                    w.draw_text(a9, aa, 124, 195, 13, db, n.indicator_text_font, eN .. ' [L]', p.indicator_extras:IsEnabled('Draw Shadow'))
                else
                    w.draw_text(a9, aa, 255, 0, 0, db, n.indicator_text_font, eN .. ' [R]', p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Anti-Aim Arrows", short_name = "Anti-Aim Arrows", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK, eR, eS;
        local eT = s.no_decimals(p.indicator_arrow_spacing:GetValue() + p.indicator_arrow_size:GetValue() / 10)
        local eO, eP = w.get_text_size(n.indicator_arrow_font, eS)
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        local eU = p.indicator_arrow_style:GetItemName()
        if eU == ch['left_1'] .. ' ' .. ch['right_1'] then
            eR = ch['left_1']
            eS = ch['right_1']
        elseif eU == ch['left_2'] .. ' ' .. ch['right_2'] then
            eR = ch['left_2']
            eS = ch['right_2']
        elseif eU == ch['left_3'] .. ' ' .. ch['right_3'] then
            eR = ch['left_3']
            eS = ch['right_3']
        elseif eU == ch['4'] .. ' ' .. ch['4'] then
            eR = ch['4']
            eS = ch['4']
        end ;
        if not entity.is_alive(local_player) and not ui.is_menu_open() or n.antiaim.state == "off" then
            return
        end ;
        if ui.get(n.ref.aa.enabled) and local_player ~= nil then
            if not (local_player == nil or entity.get_prop(local_player, 'm_lifeState') ~= 0) then
                local eQ = entity.get_prop(local_player, 'm_flPoseParameter', 11)
                if eQ ~= nil then
                    eQ = eQ * 120 - 60;
                    if eQ >= 0 then
                        n.antiaim.real = 'right'
                    else
                        n.antiaim.real = 'left'
                    end
                end
            end ;
            if n.antiaim.real == 'left' then
                w.draw_text(a9 - eT, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_arrow_font, eR, p.indicator_extras:IsEnabled('Draw Shadow'))
                w.draw_text(a9 + eT, aa, 200, 200, 200, db / 4, n.indicator_arrow_font, eS, p.indicator_extras:IsEnabled('Draw Shadow'))
            elseif n.antiaim.real == 'right' then
                w.draw_text(a9 + eT, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_arrow_font, eS, p.indicator_extras:IsEnabled('Draw Shadow'))
                w.draw_text(a9 - eT, aa, 200, 200, 200, db / 4, n.indicator_arrow_font, eR, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        elseif ui.is_menu_open() and local_player == nil then
            w.draw_text(a9 - eT, aa, 255, 255, 255, db, n.indicator_arrow_font, eR, p.indicator_extras:IsEnabled('Draw Shadow'))
            w.draw_text(a9 + eT, aa, 255, 255, 255, db, n.indicator_arrow_font, eS, p.indicator_extras:IsEnabled('Draw Shadow'))
        end
    end
end }, { name = "Slow Walk", short_name = "SW", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "SW"
        else
            eL = "Slow Walk"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if ui.get(eF) then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, eK, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Resolver", short_name = "R", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "R"
        else
            eL = "Resolver"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if ui.get(n.ref.rage.resolver_ref) then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, db, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end
    end
end }, { name = "Fake Duck", short_name = "FD", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "FD"
        else
            eL = "Fake Duck"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 40
        end ;
        if ui.get(n.ref.rage.fakeduck) then
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw * 2 + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        else
            if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(255, 255, 255, eK, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            end
        end ;
        local eV, eW = renderer.measure_text("c", eL)
        local eX, eY, eZ, e_ = a9, aa + eW + 3, eV, eW;
        local G = db;
        if ui.get(n.ref.rage.fakeduck) then
            local f0 = globals.tickcount()
            local f1, f2, f3, f4, f5;
            if f0 ~= f1 then
                f2 = f3;
                f3 = f4;
                f4 = entity.get_prop(entity.get_local_player(), "m_flDuckAmount") or 0;
                f1 = f0
            end ;
            if f5 == nil or f4 > f5 then
                f5 = f4
            elseif f3 ~= nil and f2 ~= nil and f3 > f4 and f3 > f2 then
                f5 = f3
            elseif f3 == 0 and f4 == 0 and f2 == 0 then
                f5 = 0
            end ;
            local f6, f7, f8 = math.max(0, math.min(255, n.indicator_color[1] + 4)), math.max(0, math.min(255, n.indicator_color[2] + 4)), math.max(0, math.min(255, n.indicator_color[3] + 4))
            local f9, fa, fb = math.max(0, math.min(255, n.indicator_color[1] - 40)), math.max(0, math.min(255, n.indicator_color[2] - 40)), math.max(0, math.min(255, n.indicator_color[3] - 40))
            if duckammount == nil then
                return
            end ;
            mariolua.log("Duck amount percent: " .. s.percentof(f4, 1))
            local fc = math.floor(eZ * math.max(0, math.min(1, f5)))
            renderer.rectangle(eX, eY, eZ, e_, 14, 14, 14, db, eJ)
            renderer.gradient(eX + 1, eY + 1, fc - 2, e_ - 2, f6, f7, f8, G * 0.25, f9, fa, fb, G * 0.25, false)
            renderer.gradient(eX + 1, eY + 1, eZ * f4 - 2, e_ - 2, f6, f7, f8, G, f9, fa, fb, G, false)
            local fd, fe = renderer.measure_text(nil, s.round(s.percentof(f4, 1), 0) .. "%")
            renderer.text(a9 + cJ / 2 - fd / 2, eY, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, nil, 0, s.round(s.percentof(f4, 1), 0) .. "%")
            renderer.gradient(eX + 1 + math.max(0, fc - 2), eY + 1, math.min(eZ - 2, eZ - fc), e_ - 2, 52, 52, 52, G, 68, 68, 68, G, false)
        end
    end
end }, { name = "Fov", short_name = "FOV", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "FOV"
        else
            eL = "FOV"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        local ff = ui.get(n.ref.rage.rage_fov)
        local eO, eP = w.get_text_size(n.indicator_text_font, eL .. ' ' .. ff, p.indicator_extras:IsEnabled('Draw Shadow'))
        if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
            renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL .. ' ' .. ff)
        else
            if p.indicator_extras:IsEnabled('Draw Container') then
                n.indicator.container(a9 - 10, aa - 10, eO + 22, eP + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
            end ;
            w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL .. ' ' .. ff, p.indicator_extras:IsEnabled('Draw Shadow'))
        end
    end
end }, { name = "Minimum Damage", short_name = "DMG", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "DMG"
        else
            eL = "Min Dmg"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        local dmg = ui.get(n.ref.min_dmg)
        local eO, eP = w.get_text_size(n.indicator_text_font, eL .. ' ' .. dmg, p.indicator_extras:IsEnabled('Draw Shadow'))
        if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
            renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL .. ' ' .. dmg)
        else
            if p.indicator_extras:IsEnabled('Draw Container') then
                n.indicator.container(a9 - 10, aa - 10, eO + 22, eP + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
            end ;
            w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL .. ' ' .. dmg, p.indicator_extras:IsEnabled('Draw Shadow'))
        end
    end
end }, { name = "Fake", short_name = "FAKE", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "FAKE"
        else
            eL = "Fake"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if ui.get(n.ref.aa.enabled) and local_player ~= nil then
            local bn = { 255 - n.indicator.real_yaw * 2.29824561404, n.indicator.real_yaw * 3.42105263158, n.indicator.real_yaw * 0.22807017543 }
            if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                renderer.indicator(bn[1], bn[2], bn[3], db, eL)
            else
                if p.indicator_extras:IsEnabled('Draw Container') then
                    n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                end ;
                w.draw_text(a9, aa, bn[1], bn[2], bn[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
            end
        end
    end
end }, { name = "Dormant Aimbot", short_name = "DA", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "DA"
        else
            eL = "Dormant Aim"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if q.dormant_aim ~= nil and p.dormant_enable:GetValue() then
            if q.dormant_aim.is_key then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            else
                if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                    if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                        renderer.indicator(255, 255, 255, eK, eL)
                    else
                        if p.indicator_extras:IsEnabled('Draw Container') then
                            n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                        end ;
                        w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                    end
                end
            end
        end
    end
end }, { name = "E-Peek", short_name = "EP", draw = function(a9, aa, cJ, aw, eI, db, eJ)
    if eJ then
        local eK;
        local eL;
        if p.indicator_extras:IsEnabled('Short Text') then
            eL = "EP"
        else
            eL = "E-Peek"
        end ;
        if er:IsActive() or local_player ~= nil then
            eK = db
        else
            eK = 10
        end ;
        if q.e_peek ~= nil then
            if p.antiaim_epeek:GetValue() and n.epeek_key_input then
                if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                    renderer.indicator(n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, eL)
                else
                    if p.indicator_extras:IsEnabled('Draw Container') then
                        n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, db, p.indicator_extras:IsEnabled('Rainbow Header'))
                    end ;
                    w.draw_text(a9, aa, n.indicator_color[1], n.indicator_color[2], n.indicator_color[3], db, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                end
            else
                if not p.indicator_extras:IsEnabled('Draw While Active') or ui.is_menu_open() then
                    if p.indicator_extras:IsEnabled('Use Skeet Indicators') then
                        renderer.indicator(255, 255, 255, eK, eL)
                    else
                        if p.indicator_extras:IsEnabled('Draw Container') then
                            n.indicator.container(a9 - 10, aa - 10, cJ + 22, aw + 20, eK, p.indicator_extras:IsEnabled('Rainbow Header'))
                        end ;
                        w.draw_text(a9, aa, 255, 255, 255, eK, n.indicator_text_font, eL, p.indicator_extras:IsEnabled('Draw Shadow'))
                    end
                end
            end
        end
    end
end } }
n.font_flags = { ['Italic'] = 1, ['Underline'] = 2, ['Strikeout'] = 4, ['Symbol'] = 8, ['Antialias'] = 10, ['Gaussianblur'] = 20, ['Rotary'] = 40, ['Droshadow'] = 80, ['Additive'] = 100, ['Outline'] = 200, ['Custom'] = 400, ['Bitmap'] = 800 }
n.font_byte_flags = { FONTFLAG_NONE = 0x000, FONTFLAG_ITALIC = 0x001, FONTFLAG_UNDERLINE = 0x002, FONTFLAG_STRIKEOUT = 0x004, FONTFLAG_SYMBOL = 0x008, FONTFLAG_ANTIALIAS = 0x010, FONTFLAG_GAUSSIANBLUR = 0x020, FONTFLAG_ROTARY = 0x040, FONTFLAG_DROPSHADOW = 0x080, FONTFLAG_ADDITIVE = 0x100, FONTFLAG_OUTLINE = 0x200, FONTFLAG_CUSTOM = 0x400, FONTFLAG_BITMAP = 0x800 }
local fg;
n.cur_font_flags = 0;
n.indicator_color = n.color;
function q.handleIndicators()
    local fh, fi;
    local fj = p.indicator_container:GetItemName()
    local fk = p.indicator_size:GetValue()
    local fl = p.indicator_alpha:GetValue()
    local fm = p.indicator_arrow_size:GetValue()
    local fn = p.indicator_arrow_alpha:GetValue()
    local fo = p.indicator_color:GetValue()
    n.indicator_color = fo;
    if p.indicator_extras:IsEnabled('Hide Skeet Indicators') then
        for I = 1, 50 do
            renderer.indicator(0, 0, 0, 0, " ")
        end
    elseif s.no_decimals(p.indicator_skeet_pos:GetValue()) > 0 then
        for I = 0, s.no_decimals(p.indicator_skeet_pos:GetValue()) do
            renderer.indicator(0, 0, 0, 0, " ")
        end
    end ;
    if p.indicator_size == nil then
        fh = 14
    else
        fh = s.no_decimals(fk)
    end ;
    if p.indicator_arrow_size == nil then
        fi = 20
    else
        fi = s.no_decimals(p.indicator_arrow_size:GetValue())
    end ;
    if p.indicator_extras:IsEnabled('Antialias') and n.cur_font_flags ~= { 16, 128 } then
        n.cur_font_flags = { 16, 128 }
    elseif n.cur_font_flags ~= 0 then
        n.cur_font_flags = 0
    end ;
    if fj == 'Gamesense' then
        n.indicator.container = w.gs_indicator_container
    elseif fj == 'Aimware' then
        n.indicator.container = w.aimware_container
    elseif fj == 'Shadow' then
        n.indicator.container = w.shadow_container
    elseif n.indicator.container == nil then
        n.indicator.container = w.shadow_container
    end ;
    if p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text ~= nil and n.indicator.old_font ~= p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text then
        n.indicator.old_font = p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text;
        n.indicator_text_font = w.create_font(p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text, fh, 800, n.cur_font_flags)
        n.indicator_arrow_font = w.create_font(p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text, fi, 800, n.cur_font_flags)
    end ;
    if fh ~= n.indicator.old_size then
        n.indicator.old_size = fh;
        n.indicator.old_font = p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text;
        n.indicator_text_font = w.create_font(p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text, fh, 800, n.cur_font_flags)
    end ;
    if fi ~= n.indicator.old_arrow_size then
        n.indicator.old_arrow_size = fi;
        n.indicator.old_font = p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text;
        n.indicator_arrow_font = w.create_font(p.indicator_fontitems.items[p.indicator_fontitems.enabledItem].text, fi, 800, n.cur_font_flags)
    end ;
    if fg ~= true then
        for I = 1, #eH do
            if eH[I] == nil then
                return
            end ;
            local dw = eH[I]
            if I <= #eH then
                p.indicator_itemlist:AddItem('indicator', dw.name)
                mariolua.log("Added Item '" .. dw.name .. "' to Multibox")
                local eO, eP;
                if p.indicator_extras:IsEnabled('Short Text') then
                    eO, eP = w.get_text_size(n.indicator_text_font, dw.short_name)
                else
                    eO, eP = w.get_text_size(n.indicator_text_font, dw.name)
                end ;
                p.indicator:AddItem(dw.name, 50, 300 + eP + 50 * I, eO, eP)
                p.indicator.items[I].func = dw.draw;
                if I == #eH and fg ~= true then
                    fg = true
                end
            end
        end
    elseif fg ~= true then
        fg = true
    end ;
    for I = 1, #p.indicator.items do
        local dz = p.indicator.items[I]
        local fp = p.indicator_itemlist:GetByIndex(I)
        local dw = eH[I]
        local eO, eP;
        if p.indicator_extras:IsEnabled('Short Text') then
            eO, eP = w.get_text_size(n.indicator_text_font, dw.short_name)
        else
            eO, eP = w.get_text_size(n.indicator_text_font, dw.name)
        end ;
        if dz.func ~= nil and type(dz.func) == "function" then
            dz.width = eO;
            dz.height = eP;
            dz.pos.x = s.clamp(dz.pos.x, 0, n.screen_size.w - eO / 4)
            dz.pos.y = s.clamp(dz.pos.y, 0, n.screen_size.h - eP / 4)
            if dw.name == 'Anti-Aim Arrows' then
                dz.width, dz.height = w.get_text_size(n.indicator_arrow_font, ch['left_3'])
                dz.func(dz.pos.x, dz.pos.y, dz.width, dz.height, fm, fn, fp)
            else
                dz.func(dz.pos.x, dz.pos.y, dz.width, dz.height, fk, fl, fp)
            end ;
            dz:Update()
        end
    end
end;
function q.center_arrow_indicator()
    local fq, fr = n.screen_size.w / 2, n.screen_size.h / 2;
    local ai = bq.Reference('indicator_item_Anti-AimArrows').height;
    local ah = bq.Reference('indicator_item_Anti-AimArrows').width;
    bq.Reference('indicator_item_Anti-AimArrows').pos.x = fq - ah / 2;
    bq.Reference('indicator_item_Anti-AimArrows').pos.y = fr - ai / 2;
    return
end;
function q.SetWepCfg(fs)
    local ft = fs['target hitbox']:GetValue()
    local fu = fs['multi-point']:GetValue()
    local fv = fs['multi-point scale']:GetValue()
    local fw = fs['prefer safe point']:GetValue()
    local fx = fs['avoid unsafe hitboxes']:GetValue()
    local fy = fs['automatic fire']:GetValue()
    local fz = fs['silent aim']:GetValue()
    local fA = fs['minimum hit chance']:GetValue()
    local fB = fs['minimum damage']:GetValue()
    local fC = fs['minimum damage override']:GetValue()
    local fD = fs['remove recoil']:GetValue()
    local fE = fs['automatic scope']:GetValue()
    local fF = fs['delay shot']:GetValue()
    local fG = fs['quick stop']:GetValue()
    local fH = fs['quick stop options']:GetValue()
    local fI = fs['body aim if lethal']:GetValue()
    local fJ = fs['prefer body aim']:GetValue()
    local fK = fs['prefer body aim disablers']:GetValue()
    local fL = fs['double tap']:GetValue()
    local fM = fs['double tap mode']:GetItemName()
    local fN = fs['double tap hit chance']:GetValue()
    local fO = fs['double tap fake lag limit']:GetValue()
    local fP = fs['double tap quick stop']:GetValue()
    if #ft > 0 and ft ~= nil then
        ui.set(n.ref.targethitbox, ft)
    end ;
    if #fu > 0 and fu ~= nil then
        ui.set(n.ref.multipoint, fu)
    end ;
    ui.set(n.ref.multipoint_scale, fv)
    ui.set(n.ref.prefer_safepoint, fw)
    ui.set(n.ref.avoid_hitbox, fx)
    ui.set(n.ref.automatic_fire, fy)
    ui.set(n.ref.silentaim, fz)
    ui.set(n.ref.hitchance, fA)
    if p.dmg_override_enable:GetValue() then
        if p.dmg_override_mode:GetItemName() == 'Toggle' then
            if p.dmg_override_key:IsKeyToggle() then
                ui.set(n.ref.min_dmg, fC)
            else
                ui.set(n.ref.min_dmg, fB)
            end
        elseif p.dmg_override_mode:GetItemName() == 'Hold' then
            if p.dmg_override_key:IsKeyDown() then
                ui.set(n.ref.min_dmg, fC)
            elseif not p.dmg_override_key:IsKeyDown() then
                ui.set(n.ref.min_dmg, fB)
            end
        end
    else
        ui.set(n.ref.min_dmg, fB)
    end ;
    ui.set(n.ref.removerecoil, fD)
    ui.set(n.ref.automatic_scope, fE)
    ui.set(n.ref.rage.delay_shot, fF)
    ui.set(n.ref.quickstop, fG)
    if #fH > 0 and fH ~= nil then
        ui.set(n.ref.quickstop_options, fH)
    end ;
    if q.baim_lethal ~= nil then
        q.baim_lethal.enabled = fI
    elseif fI then
        q.baim_lethal = mariolua.load_module('bodyaim_if_lethal')
    end ;
    ui.set(n.ref.prefer_bodyaim, fJ)
    if #fK > 0 and fK ~= nil then
        ui.set(n.ref.prefer_bodyaim_disablers, fK)
    end ;
    ui.set(n.ref.double_tap[1], fL)
    ui.set(n.ref.double_tap_mode, fM)
    ui.set(n.ref.double_tap_hitchance, fN)
    ui.set(n.ref.double_tap_fakelaglimit, fO)
    if #fP > 0 and fP ~= nil then
        ui.set(n.ref.double_tap_quick_stop, fP)
    end
end;
function q.AdaptiveWepCfg()
    if not p.settings_adaptivewep:GetValue() then
        return
    end ;
    if local_player == nil or not entity.is_alive(local_player) then
        return
    end ;
    local ev = x.GetWeapon(local_player)
    local fQ = x.GetWeaponGroup(local_player)
    if fQ == nil then
        return
    end ;
    local fR = p.adaptive_wep_cfg[fQ]
    q.SetWepCfg(fR)
end;
local fS = { scr = { w = n.screen_size.w, h = n.screen_size.h }, widths = { ["MarioLua"] = 50, ["Watermark"] = 65, ["Username"] = 10, ["Time"] = 40, ["Velocity"] = 50, ["KDR"] = 50, ["FPS"] = 40, ["Latency"] = 35, ["Server tickrate"] = 45 } }
local fT = bq.CObject:new("cobject")
fT:AddItem('watermark', fS.scr.w - 3, 9, 3, 18)
function q.Watermark()
    local ah, ai = fT.items[1].width, fT.items[1].height;
    local fU = p.visuals_watermark_items:GetValue()
    fU[0] = 'MarioLua'
    local fV = entity.get_all("CCSPlayerResource")[1]
    local fW = math.min(999, client.latency() * 1000)
    local ce = n.AccumulateFps()
    local ap, av, a5, G = n.color[1], n.color[2], n.color[3], n.color[4]
    local aU = mariolua.userdata.name or cvar.name:get_string()
    local bT, bU = entity.get_prop(local_player, "m_vecVelocity")
    local K, L, M, fX = client.system_time()
    local fY = "AM"
    local fZ;
    local f_;
    local g0 = { get_kills = 0, get_deaths = 0 }
    if local_player ~= nil then
        g0 = { get_kills = entity.get_prop(fV, "m_iKills", local_player), get_deaths = entity.get_prop(fV, "m_iDeaths", local_player) }
    end ;
    if string.len(aU) > 20 then
        aU = string.sub(cvar.name:get_string(), 0, 21)
    end ;
    if K > 12 then
        K = K - 12;
        fY = "PM"
    end ;
    if L < 10 then
        L = "0" .. L
    end ;
    g0.get_kills = g0.get_kills or 0;
    g0.get_deaths = g0.get_deaths or 0;
    if g0.get_deaths ~= 0 then
        local g1 = g0.get_kills / g0.get_deaths;
        f_ = s.round(g1, 2)
    elseif g0.get_kills ~= 0 then
        f_ = g0.get_kills
    else
        f_ = 0
    end ;
    fZ = bT and s.toInteger(math.min(10000, math.sqrt(bT * bT + bU * bU))) or 0;
    for I = 0, #fU do
        local g2 = fU[I]
        if fU[0] == "MarioLua" then
            fS.widths[g2] = renderer.measure_text('', 'MarioLua') + 9
        end ;
        if g2 == "FPS" then
            fS.widths[g2] = renderer.measure_text("", ce) + renderer.measure_text("-", "  FPS") + 9
        end ;
        if g2 == "Latency" then
            fS.widths[g2] = renderer.measure_text("", s.toInteger(fW)) + renderer.measure_text("-", "  PING") + 9
        end ;
        if g2 == "KDR" then
            fS.widths[g2] = renderer.measure_text("", f_) + renderer.measure_text("-", "  KDR") + 9
        end ;
        if g2 == "Velocity" then
            fS.widths[g2] = renderer.measure_text("", fZ) + renderer.measure_text("-", "  U/T") + 9
        end ;
        if g2 == "Username" then
            fS.widths[g2] = renderer.measure_text("", aU) + 9
        end ;
        if g2 == "Time" then
            fS.widths[g2] = renderer.measure_text("", K .. ":" .. L .. fY) + 9
        end ;
        if g2 == "Server tickrate" then
            fS.widths[g2] = renderer.measure_text("", 1 / globals.tickinterval()) + renderer.measure_text("-", "  TICKS") + 9
        end ;
        if fS.widths[g2] ~= nil then
            ah = ah + fS.widths[g2]
        end
    end ;
    local g3 = { x = fT.items[1].pos.x - ah, y = fT.items[1].pos.y + 3 }
    if p.visuals_watermark:GetValue() then
        if p.visuals_watermark_style:GetItemName() == "Minimal" then
            w.watermark_container(fT.items[1].pos.x - ah - 5, fT.items[1].pos.y, ah, ai)
        elseif p.visuals_watermark_style:GetItemName() == 'Gamesense' then
            w.gs_container(fT.items[1].pos.x - ah - 5, fT.items[1].pos.y, ah, ai, 255, true, true)
        elseif p.visuals_watermark_style:GetItemName() == "Aimware" then
            w.aimware_container(fT.items[1].pos.x - ah - 5, fT.items[1].pos.y, ah, ai)
        end ;
        for I = 0, #fU do
            local g2 = fU[I]
            if g2 == "MarioLua" then
                local g4 = { ap, av, a5, a = 255 }
                renderer.text(g3.x, g3.y, 66, 135, 245, 255, '', 0, 'Mario')
                renderer.text(g3.x + renderer.measure_text("", 'Mario'), g3.y, 255, 255, 255, 255, '', 0, 'Lua')
            elseif g2 == "FPS" then
                local g5 = { ap, av, a5, a = 255 }
                if ce < 1 / globals.tickinterval() then
                    g5.r = 255;
                    g5.g = 50;
                    g5.b = 50
                else
                    g5.r = ap;
                    g5.g = av;
                    g5.b = a5
                end ;
                renderer.text(g3.x, g3.y, 255, 255, 255, 255, "", 0, ce)
                renderer.text(g3.x + renderer.measure_text("", ce), g3.y + 3, g5.r, g5.g, g5.b, g5.a, "-", 0, "FPS")
            elseif g2 == "Username" then
                renderer.text(g3.x, g3.y, 255, 255, 255, 255, "", 0, aU)
            elseif g2 == "Watermark" then
                renderer.text(g3.x, g3.y - 1, 255, 255, 255, 255, "", 0, "game")
                renderer.text(g3.x + renderer.measure_text("", "game"), g3.y - 1, ap, av, a5, 255, "", 0, "sense")
            elseif g2 == "Latency" then
                local g6 = { ap, av, a5, a = 255 }
                if fW > 60 then
                    g6.r = 255;
                    g6.g = 50;
                    g6.b = 50
                else
                    g6.r = ap;
                    g6.g = av;
                    g6.b = a5
                end ;
                renderer.text(g3.x, g3.y, 255, 255, 255, 255, "", 0, s.toInteger(fW))
                renderer.text(g3.x + renderer.measure_text("", s.toInteger(fW)), g3.y + 3, g6.r, g6.g, g6.b, g6.a, "-", 0, " PING")
            elseif g2 == "KDR" then
                local g7 = { ap, av, a5, a = 255 }
                g0.get_kills = g0.get_kills or 0;
                g0.get_deaths = g0.get_deaths or 0;
                if g0.get_kills < g0.get_deaths then
                    g7.r = 255;
                    g7.g = 50;
                    g7.b = 50
                else
                    g7.r = ap;
                    g7.g = av;
                    g7.b = a5
                end ;
                renderer.text(g3.x, g3.y, 255, 255, 255, 255, "", 0, f_)
                renderer.text(g3.x + renderer.measure_text("", f_), g3.y + 3, g7.r, g7.g, g7.b, g7.a, "-", 0, " KDR")
            elseif g2 == "Velocity" then
                renderer.text(g3.x, g3.y, 255, 255, 255, 255, "", 0, fZ)
                renderer.text(g3.x + renderer.measure_text("", fZ), g3.y + 3, ap, av, a5, 255, "-", 0, " U/T")
            elseif g2 == "Time" then
                renderer.text(g3.x, g3.y, 255, 255, 255, 255, "", 0, K)
                renderer.text(g3.x + renderer.measure_text("", K), g3.y, 255, 255, 255, 255, "", 0, ":")
                renderer.text(g3.x + renderer.measure_text("", K .. ":"), g3.y, 255, 255, 255, 255, "", 0, L)
                renderer.text(g3.x + renderer.measure_text("", K .. ":" .. L), g3.y + 3, ap, av, a5, 255, "-", 0, fY)
            elseif g2 == "Server tickrate" then
                renderer.text(g3.x, g3.y, 255, 255, 255, 255, "", 0, 1 / globals.tickinterval())
                renderer.text(g3.x + renderer.measure_text("", 1 / globals.tickinterval()), g3.y + 3, ap, av, a5, 255, "-", 0, " TICKS")
            end ;
            if fS.widths[g2] ~= nil then
                g3.x = g3.x + fS.widths[g2]
            end ;
            if #fU > I then
                renderer.text(g3.x - 10, g3.y - 1, 255, 255, 255, 255, "", 0, " | ")
            end
        end ;
        fT.items[1]:Update()
    end ;
    if #fU == 0 then
        return
    end
end;
function q.GetNearestEnemy()
    local g8 = entity.get_players(true)
    if #g8 ~= 0 then
        local g9, ga, gb = client.eye_position()
        local gc, gd = client.camera_angles()
        n.closest_enemy = nil;
        n.closest_distance = 999999999;
        for I = 1, #g8 do
            local ge = g8[I]
            local gf, gg, gh = entity.hitbox_position(ge, 0)
            local a9 = gf - g9;
            local aa = gg - ga;
            local b3 = gh - gb;
            local gi = math.atan2(aa, a9) * 180 / math.pi;
            local gj = -(math.atan2(b3, math.sqrt(math.pow(a9, 2) + math.pow(aa, 2))) * 180 / math.pi)
            local gk = math.abs(gd % 360 - gi % 360) % 360;
            local gl = math.abs(gc - gj) % 360;
            if gk > 180 then
                gk = 360 - gk
            end ;
            local gm = math.sqrt(math.pow(gk, 2) + math.pow(gl, 2))
            if n.closest_distance > gm then
                n.closest_distance = gm;
                n.closest_enemy = ge
            end
        end ;
        if n.closest_enemy ~= nil then
            return n.closest_enemy, n.closest_distance
        end
    end ;
    return nil, nil
end;
function q.DynamicFOV_Draw()
    if p.dyn_fov_mode:GetItemName() ~= "Off" and p.dyn_fov_draw:GetValue() then
        local ap, av, a5, G = 255, 255, 255, 150;
        local gn = ui.get(n.ref.rage.rage_fov) * 10;
        renderer.circle(n.screen_size.w / 2, n.screen_size.h / 2, ap, av, a5, G, gn, 270, 1.0)
    end
end;
function q.DynamicFOV()
    if p.dyn_fov_mode:GetItemName() ~= "Off" then
        local go = ui.get(n.ref.rage.rage_fov)
        local gp = p.dyn_fov_min:GetValue()
        local gq = p.dyn_fov_max:GetValue()
        local g9, ga, gb = client.eye_position()
        n.closest_enemy, n.closest_distance = q.GetNearestEnemy()
        if n.closest_enemy ~= nil then
            local gr, gs, gt = entity.hitbox_position(n.closest_enemy, 0)
            local gu = math.sqrt(math.pow(g9 - gr, 2) + math.pow(ga - gs, 2) + math.pow(gb - gt, 2))
            if p.dyn_fov_mode:GetItemName() == "Static" then
                n.dynamicfov_new_fov = gq - (gq - gp) * (gu - 250) / 1000
            elseif p.dyn_fov_mode:GetItemName() == "Automatic" then
                n.dynamicfov_new_fov = 3800 / gu * p.dyn_fov_factor:GetValue() * 0.01
            end ;
            if n.dynamicfov_new_fov > gq then
                n.dynamicfov_new_fov = gq
            elseif n.dynamicfov_new_fov < gp then
                n.dynamicfov_new_fov = gp
            end
        else
            n.dynamicfov_new_fov = gp
        end ;
        n.dynamicfov_new_fov = math.floor(n.dynamicfov_new_fov)
        if n.dynamicfov_new_fov ~= go then
            ui.set(n.ref.rage.rage_fov, n.dynamicfov_new_fov)
        end
    end
end;
n.name_backup = cvar.name:get_string()
n.namespam_names = bq.SaveVar:new('misc.namespam.names', { 'MarioLua > All', 'MarioLua > Luigi' })
function q.LoadNameSpamItems()
    p.misc_namespam_name.items = {}
    p.misc_namespam_name:SetItems(n.namespam_names:GetValue())
    mariolua.log('Loaded Name Spam List')
end;
function q.NameSpamAdd()
    n.should_addnamespam = false;
    if u.Contains(p.misc_namespam_name.item_list, n.clipboard) then
        return
    end ;
    p.misc_namespam_name:AddItem(n.clipboard)
    n.namespam_names:SetValue(u.table_to_string3(p.misc_namespam_name:GetItems()))
    mariolua.log('Added ' .. n.clipboard .. ' to Name Spam List')
end;
function q.NameSpamRemove()
    n.should_removenamespam = false;
    for I = 1, #p.misc_namespam_name.items do
        if p.misc_namespam_name.items[I] == nil then
            return
        end ;
        local gv = p.misc_namespam_name:GetItemName()
        if p.misc_namespam_name.items[I].text == gv then
            table.remove(p.misc_namespam_name.items, I)
            table.remove(p.misc_namespam_name.item_list, I)
            n.namespam_names:SetValue(u.table_to_string3(p.misc_namespam_name:GetItems()))
            mariolua.log('Removed ' .. gv .. ' from Name Spam List')
        end
    end
end;
n.spam_counter = 0;
n.should_namespam = false;
client.set_event_callback("paint", function()
    local gw = cvar.name:get_string()
    local gx = p.misc_namespam_name:GetItemName()
    if type(p.misc_namespam_name:GetItemName()) == 'boolean' then
        return
    end ;
    if #gx < 2 then
        return
    end ;
    local gy = p.misc_namespam_restore:GetValue()
    if n.should_namespam then
        if n.spam_counter >= 0 and n.spam_counter < 20 then
            cvar.name:invoke_callback()
            cvar.name:set_string(gx)
            n.spam_counter = n.spam_counter + 1
        elseif n.spam_counter >= 20 and n.spam_counter < 40 then
            cvar.name:invoke_callback()
            cvar.name:set_string(gx .. " \x00")
            n.spam_counter = n.spam_counter + 1
        elseif n.spam_counter >= 40 and n.spam_counter < 60 then
            cvar.name:invoke_callback()
            cvar.name:set_string(gx)
            n.spam_counter = n.spam_counter + 1
        elseif n.spam_counter >= 60 and n.spam_counter < 80 then
            cvar.name:invoke_callback()
            cvar.name:set_string(gx .. " \x00")
            n.spam_counter = n.spam_counter + 1
        elseif n.spam_counter >= 80 and n.spam_counter < 100 then
            cvar.name:invoke_callback()
            cvar.name:set_string(gy and gw or gx)
            n.spam_counter = n.spam_counter + 1
        end
    end
end)
n.clantag = { off = nil, tag = "", tag_index = 0, tag_length = 0, tag_reverse = 0, tag_last_index = 0 }
function q.clantag_static()
    local e = entity.get_local_player()
    local gz = entity.get_prop(entity.get_player_resource(), "m_szClan", e)
    if n.clantag.tag:len() == 0 and gz:len() ~= 0 then
        client.set_clan_tag("\0")
    elseif gz ~= tag then
        client.set_clan_tag(tag)
    end
end;
function q.clantag_time()
    local aw, aA, a1 = client.system_time()
    local gA = string.format("%d:%02d:%02d", aw, aA, a1)
    client.set_clan_tag(gA)
end;
function q.clantag_default()
    if n.clantag.tag_index == n.clantag.tag_last_index then
        return
    end ;
    client.set_clan_tag(n.clantag.tag_index == 0 and "\0" or n.clantag.tag:sub(1, n.clantag.tag_index))
end;
function q.clantag_reverse()
    if n.clantag.tag_index == n.clantag.tag_last_index then
        return
    end ;
    if n.clantag.tag_reverse <= n.clantag.tag_length then
        client.set_clan_tag(n.clantag.tag:sub(1, n.clantag.tag_index))
    else
        client.set_clan_tag(n.clantag.tag_length - n.clantag.tag_index == 0 and "\0" or n.clantag.tag:sub(1, n.clantag.tag_length - n.clantag.tag_index))
    end
end;
function q.clantag_loop()
    if n.clantag.tag_index == n.clantag.tag_last_index then
        return
    end ;
    local a8 = ""
    local gB = n.clantag.tag;
    for I = 1, n.clantag.tag_index do
        gB = gB .. gB:sub(1, 1)
        gB = gB:sub(2, gB:len())
    end ;
    client.set_clan_tag(gB)
end;
n.clantag.animations = { ["Static"] = q.clantag_static, ["Time"] = q.clantag_time, ["Default"] = q.clantag_default, ["Reverse"] = q.clantag_reverse, ["Classic"] = q.clantag_loop, ["Loop"] = q.clantag_loop }
function q.clantag_handle_custom()
    local e = entity.get_local_player()
    local gC = p.clantag_anim:GetItemName()
    n.clantag.tag = p.clantag_custom:GetValue()
    n.clantag.tag = gC == "Loop" and n.clantag.tag .. " " or n.clantag.tag;
    n.clantag.tag = gC == "Classic" and n.clantag.tag .. string.rep(" ", math.floor(n.clantag.tag:len() * 2)) or n.clantag.tag;
    n.clantag.tag_length = n.clantag.tag:len()
    n.clantag.tag_index = math.floor(globals.curtime() * p.clantag_speed:GetValue() / 10 % n.clantag.tag_length + 1)
    n.clantag.tag_reverse = math.floor(globals.curtime() * p.clantag_speed:GetValue() / 10 % (n.clantag.tag_length * 2) + 1)
    local gD = n.clantag.animations[gC]
    gD()
    n.clantag.tag_last_index = n.clantag.tag_index
end;
local gE = { clantag = { ["mariolua"] = { "MarioLua", "MarioLua", "arioLua", "rioLua", "ioLua", "oLua", "Lua", "ua", "", "a", "ua", "Lua", "oLua", "ioLua", "rioLua", "arioLua", "MarioLua", "MarioLua" }, ["mariolua2"] = { "MarioLua", "arioLua M", "rioLua Ma", "ioLua Mar", "oLua Mari", "Lua Mario", "ua MarioL", "a MarioLu", " MarioLua", "MarioLua" }, ["aimware"] = { "AIMWARE.net ", "IMWARE.net A", "MWARE.net AI", "WARE.net AIM", "ARE.net AIMW", "RE.net AIMWA", "E.net AIMWAR", "net AIMWARE.", "et AIMWARE.n", " AIMWARE.ne", "AIMWARE.net " }, ["cooking"] = { "(\\^.^)\\", "/(^.^)\\", "/(^.^/)", "(\\^.^)\\", "(/^.^)/", "\\(^.^)/", "\\(^.^\\) " }, ["pphud"] = { "p", "pp", "pph", "pphu", "pphud", "pphud ", "*phud b", "p*hud be", "pp*ud bet", "pph*d beta", "pphu* beta", "pphud*beta", "pphud *eta", "pphud b*ta", "pphud be*a", "pphud bet*", "/phud beta", "//hud beta", "///ud beta", "////d beta", "///// beta", "///// //ta", "///// ////", " " }, ["iniuria"] = { "I         ", "IN        ", "INI       ", "INIU      ", "INIUR     ", "INIURI    ", "INIURIA   ", "INIURIA.  ", "INIURIA.U ", "INIURIA.US", "INIURIA.US", " NIURIA.US", "  IURIA.US", "   URIA.US", "    RIA.US", "     IA.US", "      A.US", "       .US", "        US", "         S", "          " }, ["neverlose"] = { " ", "N ", "N3 ", "Ne ", "Ne\\ ", "Ne\\/ ", "Nev ", "Nev3 ", "Neve ", "Neve| ", "Neve|2 ", "Never| ", "Never|_ ", "Neverl ", "Neverl0 ", "Neverlo ", "Neverlo5 ", "Neverlos ", "Neverlos3 ", "Neverlose ", "Neverlose. ", "Neverlose.< ", "Neverlose.c< ", "Neverlose.cc ", "Neverlose.c< ", "Neverlose.< ", "Neverlose. ", "Neverlose ", "Neverlos3 ", "Neverlos ", "Neverlo_ ", "Neverlo5 ", "Neverlo ", "Neverl_ ", "Never|0 ", "Never| ", "Neve|2 ", "Neve| ", "Neve ", "Nev3 ", "Nev ", "Ne\\/ ", "Ne\\ ", "Ne ", "N3 ", "N ", "|\\| " }, ["dicksuck"] = { "SCHWANZ LUTSCHER", "SCHWANZ LUTSCHER", "CHWANZ LUTSCHER", "HWANZ LUTSCHER", "ANZ LUTSCHER", "NZ LUTSCHER", " LUTSCHER", "LUTSCHER", "UTSCHER", "TSCHER", "SCHER", "CHER", "HER", "ER", "R", "ER", "HER", "CHER", "SCHER", "TSCHER", "UTSCHER", "LUTSCHER", " LUTSCHER", "NZ LUTSCHER", "ANZ LUTSCHER", "HWANZ LUTSCHER", "CHWANZ LUTSCHER", "SCHWANZ LUTSCHER", "SCHWANZ LUTSCHER" } }, index = { ["mariolua"] = nil, ["aimware"] = nil, ["cooking"] = nil, ["pphud"] = nil, ["iniuria"] = nil, ["neverlose"] = nil }, previous = { ["mariolua"] = nil, ["aimware"] = nil, ["cooking"] = nil, ["pphud"] = nil, ["iniuria"] = nil, ["neverlose"] = nil } }
function q.AnimatedClanTag()
    if not p.clantag_enabled:GetValue() then
        if not n.clantag.off then
            n.clantag.off = true;
            client.set_clan_tag("\0")
        end ;
        return
    elseif p.clantag_enabled:GetValue() and (n.clantag.off or n.clantag.off ~= nil) then
        n.clantag.off = false
    end ;
    if p.clantag_tag:GetItemName() == 'Custom' then
        q.clantag_handle_custom()
        return
    end ;
    local gF = 24;
    gE.index["mariolua"] = math.floor(globals.curtime() * 25 / 10 % table.getn(gE.clantag["mariolua"]) + 1)
    gE.index["mariolua2"] = math.floor(globals.curtime() * 25 / 10 % table.getn(gE.clantag["mariolua2"]) + 1)
    gE.index["aimware"] = math.floor(globals.curtime() * gF / 10 % table.getn(gE.clantag["aimware"]) + 1)
    gE.index["cooking"] = math.floor(globals.curtime() * gF / 10 % table.getn(gE.clantag["cooking"]) + 1)
    gE.index["pphud"] = math.floor(globals.curtime() * gF / 10 % table.getn(gE.clantag["pphud"]) + 1)
    gE.index["iniuria"] = math.floor(globals.curtime() * gF / 10 % table.getn(gE.clantag["iniuria"]) + 1)
    gE.index["neverlose"] = math.floor(globals.curtime() * gF / 7 % table.getn(gE.clantag["neverlose"]) + 1)
    gE.index["dicksuck"] = math.floor(globals.curtime() * gF / 10 % table.getn(gE.clantag["dicksuck"]) + 1)
    if p.clantag_tag:GetItemName() == 'MarioLua' then
        for I = 1, gE.index["mariolua"] do
            local gG = gE.clantag["mariolua"][gE.index["mariolua"] + 1]
            if gG ~= gE.previous["mariolua"] then
                if gG == nil then
                    gG = "MarioLua"
                end ;
                gE.previous["mariolua"] = gG;
                client.set_clan_tag(gG)
            end
        end
    end ;
    if p.clantag_tag:GetItemName() == 'MarioLua 2' then
        for I = 1, gE.index["mariolua2"] do
            local gG = gE.clantag["mariolua2"][gE.index["mariolua2"] + 1]
            if gG ~= gE.previous["mariolua2"] then
                if gG == nil then
                    gG = "MarioLua"
                end ;
                gE.previous["mariolua2"] = gG;
                client.set_clan_tag(gG)
            end
        end
    end ;
    if p.clantag_tag:GetItemName() == 'Aimware' then
        for I = 1, gE.index["aimware"] do
            local gG = gE.clantag["aimware"][gE.index["aimware"] + 1]
            if gG ~= gE.previous["aimware"] then
                if gG == nil then
                    gG = "AIMWARE.net "
                end ;
                gE.previous["aimware"] = gG;
                client.set_clan_tag(gG)
            end
        end
    end ;
    if p.clantag_tag:GetItemName() == 'Cooking' then
        for I = 1, gE.index["cooking"] do
            local gH = gE.clantag["cooking"][gE.index["cooking"] + 1]
            if gH ~= gE.previous["cooking"] then
                if gH == nil then
                    gH = "(\\^.^)\\"
                end ;
                gE.previous["cooking"] = gH;
                client.set_clan_tag(gH)
            end
        end
    end ;
    if p.clantag_tag:GetItemName() == 'pphud' then
        for I = 1, gE.index["pphud"] do
            local gI = gE.clantag["pphud"][gE.index["pphud"] + 1]
            if gI ~= gE.previous["pphud"] then
                if gI == nil then
                    gI = "p"
                end ;
                gE.previous["pphud"] = gI;
                client.set_clan_tag(gI)
            end
        end
    end ;
    if p.clantag_tag:GetItemName() == 'Iniuria' then
        for I = 1, gE.index["iniuria"] do
            local gI = gE.clantag["iniuria"][gE.index["iniuria"] + 1]
            if gI ~= gE.previous["iniuria"] then
                if gI == nil then
                    gI = "INIURIA.US"
                end ;
                gE.previous["iniuria"] = gI;
                client.set_clan_tag(gI)
            end
        end
    end ;
    if p.clantag_tag:GetItemName() == 'Neverlose' then
        for I = 1, gE.index["neverlose"] do
            local gI = gE.clantag["neverlose"][gE.index["neverlose"] + 1]
            if gI ~= gE.previous["neverlose"] then
                if gI == nil then
                    gI = ""
                end ;
                gE.previous["neverlose"] = gI;
                client.set_clan_tag(gI)
            end
        end
    end ;
    if p.clantag_tag:GetItemName() == 'SCHWANZ LUTSCHER' then
        for I = 1, gE.index["dicksuck"] do
            local gI = gE.clantag["dicksuck"][gE.index["dicksuck"] + 1]
            if gI ~= gE.previous["dicksuck"] then
                if gI == nil then
                    gI = "SCHWANZ LUTSCHER"
                end ;
                gE.previous["dicksuck"] = gI;
                client.set_clan_tag(gI)
            end
        end
    end
end;
n.sk_table = {}
function q.Skeleton()
    if not p.visuals_skeleton:GetValue() then
        return
    end ;
    local gJ = entity.get_players(true)
    for I = 1, #gJ do
        local ent = gJ[I]
        q.draw_Skeleton(ent)
    end
end;
n.pl = {}
n.pl.fl_fakeclient = 0x200;
n.pl.score = cvar.score;
local gK = bq.CObject:new("player_list_object")
gK:AddItem('player_list', 350, 25, 200, 25)
n.pl.wnd = { x = gK.items[1].pos.x, y = gK.items[1].pos.y, w = gK.items[1].width, h = gK.items[1].height, dragging = false, resize = false, rx = 0 }
function n.pl.intersect(a9, aa, cJ, aw, gL)
    local ad, ae = ui.mouse_position()
    gL = gL or false;
    if gL then
        renderer.rectangle(a9, aa, cJ, aw, 255, 0, 0, 50)
    end ;
    return ad >= a9 and ad <= a9 + cJ and ae >= aa and ae <= aa + aw
end;
function q.RenderExtrapolation(ent, b_, gM)
    x.extrapolated_ent_data = x.extrapolated_ent_data or {}
    if not mariolua.debug.draw['player_prediction'] then
        return
    end ;
    for I = 1, #x.extrapolated_ent_data do
        local b_ = x.extrapolated_ent_data[I]
        q.draw_Skeleton(I, b_)
    end
end;
function x.ExtrapolatePosition(gN, gO, gP, b_, ent)
    b_ = b_ or 0;
    if b_ == 0 then
        return gN, gO, gP
    end ;
    local gQ = globals.tickinterval()
    local a9, aa, b3 = entity.get_prop(ent, "m_vecVelocity")
    if a9 ~= nil and math.sqrt(a9 * a9 + aa * aa + b3 * b3) > 1.01 then
        for I = 0, b_ do
            gN = gN + a9 * gQ;
            gO = gO + aa * gQ;
            gP = gP + b3 * gQ
        end
    end ;
    x.extrapolated_ent_data = x.extrapolated_ent_data or {}
    x.extrapolated_ent_data[ent] = b_;
    return gN, gO, gP
end;
function q.hitgroup_id(gR)
    return n.hitgroups[gR:lower()]
end;
function q.get_hitbox_hitgorup(gS)
    for I = 1, #n.hitscan2 do
        if u.Contains(n.hitscan2[I], gS) then
            return I
        end
    end
end;
n.visible_hitboxes = {}
function q.get_visible_hitboxes(ent, b_)
    b_ = b_ or 0;
    local gT = A(entity.get_prop(local_player, "m_vecOrigin"))
    local gU = A(client.eye_position())
    local gV = {}
    for I = 0, 18 do
        local gW = A(entity.hitbox_position(ent_end, I))
        if b_ > 0 then
            gW = A(x.ExtrapolatePosition(gW.x, gW.y, gW.z, b_, ent_end))
        end ;
        if client.visible(gW.x, gW.y, gW.z) then
            table.insert(gV, I)
        end
    end ;
    return gV
end;
n.vis_hitboxes = {}
function q.isVisible(ent)
    local b_ = p.tr_legitaw_extrapolated:GetValue()
    local gT = A(entity.get_origin(local_player))
    local gU = A(client.eye_position())
    if n.vis_hitboxes[ent] == nil then
        n.vis_hitboxes[ent] = {}
    end ;
    for I = 1, #p.tr_legitaw_hitbox.enabled_items do
        local gR = p.tr_legitaw_hitbox.enabled_items[I]
        local gX = q.hitgroup_id(gR) + 1;
        for cl, F in pairs(n.hitscan2[gX]) do
            local gW;
            if b_ > 0 then
                vec_pos = A(entity.hitbox_position(ent, F - 1))
                gW = A(x.ExtrapolatePosition(vec_pos.x, vec_pos.y, vec_pos.z, b_, ent))
            else
                gW = A(entity.hitbox_position(ent, F - 1))
            end ;
            _, entindex = client.trace_line(local_player, gT.x, gT.y, gU.z, gW.x, gW.y, gW.z)
            if entindex == ent or client.visible(gW.x, gW.y, gW.z) then
                if not u.Contains(n.vis_hitboxes[ent], F - 1) then
                    table.insert(n.vis_hitboxes[ent], F - 1)
                end ;
                return true
            elseif u.Contains(n.vis_hitboxes[ent], F - 1) then
                table.remove(n.vis_hitboxes[ent], F - 1)
            end
        end
    end ;
    return false
end;
function q.GetClosestCrosshair()
    local g8 = entity.get_players(true)
    local gj, gi = client.camera_angles()
    local gY = A(entity.get_prop(entity.get_local_player(), "m_vecAbsOrigin"))
    local gZ = A(gj, gi, 0)
    n.nearest_player = nil;
    n.nearest_player_fov = math.huge;
    for I = 1, #g8 do
        local g_ = g8[I]
        local h0 = A(entity.get_prop(g_, "m_vecOrigin"))
        local h1 = B.get_FOV(gZ, gY, h0)
        if h1 <= n.nearest_player_fov then
            n.nearest_player = g_;
            n.nearest_player_fov = h1
        end
    end ;
    return n.nearest_player, n.nearest_player_fov
end;
function q.LegitAutowall()
    if p.autowall_enable:GetValue() and (p.autowall_key:IsKeyToggle() or p.autowall_key:IsKeyDown()) or not p.tr_legitaw_enabled:GetValue() or not entity.is_alive(local_player) then
        return
    end ;
    local h2 = ui.get(n.ref.rage.rage_fov)
    local gT = A(entity.get_prop(local_player, "m_vecOrigin"))
    local gU = A(client.eye_position())
    local h3, h4 = q.GetClosestCrosshair()
    local h5 = A(entity.get_prop(local_player, "m_vecViewOffset[2]"))
    local lz = lz + h5;
    if not (p.autowall_enable:GetValue() and (p.autowall_key:IsKeyToggle() or p.autowall_key:IsKeyDown())) then
        if h3 ~= nil and h4 <= h2 then
            ui.set(n.ref.rage.autowall, q.isVisible(h3))
        elseif ui.get(n.ref.rage.autowall) then
            ui.set(n.ref.rage.autowall, false)
        end
    end
end;
local h6 = { values = { ForceBodyYaw = {}, ForceBodyYawCheckbox = {}, CorrectionActive = {} } }
function h6.GetForceBodyYawCheckbox(ent)
    if ent == nil then
        return
    end ;
    return plist.get(ent, "Force body yaw")
end;
function h6.SetForceBodyYawCheckbox(ent, H)
    if ent == nil or h6.values.ForceBodyYawCheckbox[ent] == H then
        return
    end ;
    plist.set(ent, 'Force body yaw', H)
    h6.values.ForceBodyYawCheckbox[ent] = H
end;
function h6.GetPlayerBodyYaw(ent)
    if ent == nil then
        return
    end ;
    return plist.get(ent, 'Force body yaw value')
end;
function h6.SetPlayerBodyYaw(ent, H)
    if ent == nil or h6.values.ForceBodyYaw[ent] == H then
        return
    end ;
    plist.set(ent, 'Force body yaw value', H)
    h6.values.ForceBodyYaw[ent] = H
end;
function h6.IsCorrectionActive(ent)
    if ent == nil then
        return
    end ;
    return plist.get(ent, 'Correction active')
end;
function h6.SetCorrectionActive(ent, H)
    if ent == nil or h6.values.CorrectionActive[ent] == H then
        return
    end ;
    plist.set(ent, 'Correction active', H)
    h6.values.CorrectionActive[ent] = H
end;
function h6.force_correction()
    if n.resolver_t == nil then
        return
    end ;
    if not r.IsActive() or not p.resolver_modules:IsEnabled('Desync Detection') then
        return
    end ;
    local gJ = entity.get_players(true)
    for I = 1, #gJ do
        local ent = gJ[I]
        plist.set(ent, 'Correction active', h6.values.CorrectionActive[ent])
    end
end;
local function h7(a6)
    local a8 = ""
    if type(a6) == 'string' then
        return a6
    end ;
    for Q, F in pairs(a6) do
        if type(Q) == "string" then
            a8 = a8 .. "\n'" .. Q .. "'" .. " = "
        end ;
        if type(F) == "table" then
            a8 = a8 .. h7(F)
        elseif type(F) == "boolean" then
            a8 = a8 .. '' .. tostring(F)
        elseif type(F) == "string" then
            a8 = a8 .. "\n'" .. F .. "'"
        elseif type(F) == "function" then
            return
        else
            a8 = a8 .. F
        end ;
        a8 = a8 .. " | "
    end ;
    if a8 ~= "" then
        a8 = a8:sub(1, a8:len() - 1)
    end ;
    return tostring(a8)
end;
n.t_last_layer_info = {}
function x.get_animlayer(ent, I)
    I = I or 12;
    local br = x.get_client_entity(x.ientitylist, ent)
    local bs = x.get_client_networkable(x.ientitylist, ent)
    local by = ffi.cast(o.interface_ptr, br)
    local bz = ffi.cast("char*", by) + 0x3914;
    local bA = ffi.cast("struct c_animstate_mariolua**", bz)[0]
    local h8 = {}
    if br == nil or bs == nil or bA == nil then
        return
    end ;
    if type(I) == 'table' then
        for c7, du in ipairs(I) do
            h8[du] = x.get_anim_layer(br, du)
        end
    else
        h8 = x.get_anim_layer(br, I)
    end ;
    local h9 = x.get_sequence_activity(br, bs, h8.m_nSequence)
    return h8, h9
end;
function x.update_client_animation(ent)
    local ha = x.animstate(ent)
    ha.m_iLastClientSideAnimationUpdateFramecount = ha.m_iLastClientSideAnimationUpdateFramecount >= globals.framecount() and globals.framecount() - 1 or ha.m_iLastClientSideAnimationUpdateFramecount
end;
n.debug_font = w.create_font("Verdana", 13, 600, 0)
function n.draw_ply_info(hb, a9, aa)
    for I = 1, #hb do
        for cl = 1, #hb[I] do
            w.draw_text(a9 + 50 + I - 1 * 100, aa + cl * 15 + (I - 1) * 220, n.color[1], n.color[2], n.color[3], n.color[4], n.debug_font, hb[I][cl])
        end
    end
end;
function v.get_max_feet_yaw(bK)
    local ha = x.animstate(bK)
    local duckammount = ha.m_fDuckAmount;
    local hc = math.max(0, math.min(ha.m_flFeetSpeedForwardsOrSideWays, 1.))
    local hd = math.max(0, math.max(1, ha.m_flFeetSpeedUnknownForwardOrSideways))
    local he = (ha.m_flStopToFullRunningFraction * -0.30000001 - 0.19999999) * hc;
    local hf = he + 1;
    if duckammount > 0 then
        hf = hf + duckammount * hd * (0.5 - hf)
    end ;
    return ha.m_flMaxYaw * hf
end;
function x.GetPlayerMaxFeetYaw(ent)
    local ha = x.animstate(ent)
    local hg = ha.m_fDuckAmount;
    local hh = math.max(0, math.min(1, ha.m_flFeetSpeedForwardsOrSideWays))
    local hi = math.max(1, ha.m_flFeetSpeedUnknownForwardOrSideways)
    local hj = (ha.m_flStopToFullRunningFraction * -0.30000001 - 0.19999999) * hh + 1;
    if hg > 0 then
        hj = hj + hg * hi * (0.5 - hj)
    end ;
    local hk = ha.m_flMaxYaw * hj;
    return hk < 60 and hk >= 0 and hk or 0
end;
function B.multiplyvalues(a9, aa, b3, H)
    a9 = a9 * H;
    aa = aa * H;
    b3 = b3 * H;
    return a9, aa, b3
end;
function B.angle_vector(a9, aa)
    local bQ, ae, hl, hm = math.rad(aa), math.rad(aa), math.rad(a9), math.rad(a9)
    return math.cos(hm) * math.cos(ae), math.cos(hm) * math.sin(bQ), -math.sin(hl)
end;
function q.CalcFov(ent, hn, ho, lz, hp, hq, hr)
    local hs = A(entity.get_prop(ent, 'm_vecOrigin'))
    local ht = B.normalize_angle(hs.x - hn, hs.y - ho, lz - lz)
    local hu = ht:dot(A(hp, hq, hr))
    local hv = math.acos(hu)
    return s.deg2rad * hv
end;
function q.get_closest_player(hn, ho, lz, gj, gi)
    local h3 = n.rage.nearest_player;
    local h4 = n.rage.nearest_player_fov;
    local hp, hq, hr = B.to_angle(gj, gi)
    local g8 = entity.get_players(true)
    local h3 = nil;
    local h4 = math.huge;
    for I = 1, #g8 do
        local g_ = g8[I]
        local h1 = q.CalcFov(g_, hn, ho, lz, hp, hq, hr)
        if h1 <= h4 then
            h3 = g_;
            h4 = h1
        end
    end ;
    return h3, h4
end;
n.HitGroupDisplay = { "Generic", "Head", "Chest", "Stomach", "Left arm", "Right arm", "Left leg", "Right leg", "Neck" }
n.HitGroupNames = { "HITGROUP_GENERIC", "HITGROUP_HEAD", "HITGROUP_CHEST", "HITGROUP_STOMACH", "HITGROUP_LEFTARM", "HITGROUP_RIGHTARM", "HITGROUP_LEFTLEG", "HITGROUP_RIGHTLEG", "HITGROUP_GEAR" }
n.HitGroupToHitBox = { 2, 0, 4, 2, 13, 14, 7, 8, 1 }
n.CubeOutlineConnections = { { 1, 2 }, { 1, 3 }, { 1, 5 }, { 8, 7 }, { 8, 6 }, { 8, 4 }, { 6, 3 }, { 4, 3 }, { 4, 2 }, { 2, 7 }, { 7, 5 }, { 6, 5 } }
n.CubeFillConnections = { { 1, 2, 3 }, { 1, 2, 5 }, { 1, 3, 5 }, { 8, 7, 6 }, { 8, 7, 4 }, { 8, 6, 4 }, { 3, 6, 5 }, { 3, 4, 6 }, { 2, 4, 7 }, { 2, 7, 5 }, { 3, 4, 2 }, { 6, 5, 7 } }
n.HitBoxConnections = { { 0, 1 }, { 1, 2 }, { 2, 7 }, { 7, 6 }, { 6, 5 }, { 5, 4 }, { 4, 3 }, { 3, 9 }, { 3, 8 }, { 9, 11 }, { 8, 10 }, { 11, 13 }, { 10, 12 }, { 7, 18 }, { 18, 19 }, { 19, 15 }, { 7, 16 }, { 16, 17 }, { 17, 14 } }
function q.RenderEnemyAngles()
    if local_player == nil or not (p.visuals_angle:IsEnabled('Real') or p.visuals_angle:IsEnabled('Fake') or p.visuals_angle:IsEnabled('LBY')) then
        return
    end ;
    local bJ = entity.get_players(true)
    if bJ == nil then
        return
    end ;
    for I = 1, #bJ, 1 do
        local ent = bJ[I]
        if not (entity.is_alive(ent) or entity.is_enemy(ent) or entity.is_alive(entity.get_local_player())) then
            return
        end ;
        local hw = A(entity.get_origin(ent))
        local _, hx = entity.get_prop(ent, "m_angAbsRotation")
        local hy = entity.get_prop(ent, "m_angEyeAngles[1]")
        local hz = entity.get_prop(ent, "m_flLowerBodyYawTarget")
        local hA = entity.get_prop(ent, "m_angEyeAngles[1]")
        local hB = { degrees = 50, start_at = hx, start_at2 = hy, start_at3 = hz }
        local hC = 10;
        local hD, hE, hF, hG = { 255, 255, 255, 255 }, { 255, 0, 0, 255 }, { 30, 30, 30, 255 }, { 0, 150, 255, 255 }
        if p.visuals_angle:IsEnabled('Real') then
            w.circle_3d(hw.x, hw.y, hw.z, hC + 10 * I, hB.degrees, hB.start_at, hD[1], hD[2], hD[3], hD[4], 3, 5)
        end ;
        if p.visuals_angle:IsEnabled('Fake') then
            w.circle_3d(hw.x, hw.y, hw.z, hC + 10 * I, hB.degrees, hB.start_at2, hE[1], hE[2], hE[3], hE[4], 3, 5)
        end ;
        if p.visuals_angle:IsEnabled('LBY') then
            w.circle_3d(hw.x, hw.y, hw.z, hC + 10 * I, hB.degrees, hB.start_at3, hG[1], hG[2], hG[3], hG[4], 3, 5)
        end
    end
end;
function q.player_infos()
    n.closest_enemy, n.closest_distance = q.GetNearestEnemy()
    if n.closest_enemy == nil then
        return
    end ;
    local bL, bM, bN = entity.hitbox_position(n.closest_enemy, 1)
    local hH, hI, hJ = entity.get_origin(n.closest_enemy)
    bN = hJ or bN;
    local a9, aa = renderer.world_to_screen(hH, hI, bN)
    if a9 and aa and r.data then
        r.get_info_for_player(n.closest_enemy, a9, aa)
        r.record_animlayers(n.closest_enemy, a9, aa)
    end
end;
function lerp_pos(ab, ac, hK, b8, b9, hL, hM)
    local a9 = (b8 - ab) * hM + ab;
    local aa = (b9 - ac) * hM + ac;
    local b3 = (hL - hK) * hM + hK;
    return a9, aa, b3
end;
function q.AntiResolver(cmd)
    if p.antiaim_lbyextras_mode == nil then
        return
    elseif p.antiaim_lbyextras_mode:GetItemName() == 'Off' then
        return
    end ;
    local hN = p.antiaim_lbyextras_mode:GetItemName()
    if cmd.chokedcommands == 0 then
        n.antiresolver.updates = n.antiresolver.updates + 1;
        n.antiresolver.targeted = n.antiresolver.targeted + 1
    end ;
    if n.antiresolver.targeted >= ui.get(n.ref.fakelag_limit) then
        n.antiresolver.targeted = 0
    end ;
    if cmd.in_forward == 0 and cmd.in_back == 0 and cmd.in_moveleft == 0 and cmd.in_moveright == 0 then
        cmd.allow_send_packet = false;
        if hN == 'Fake Twist' then
            if cmd.chokedcommands % (n.antiresolver.updates % 2 == 0 and ui.get(n.ref.fakelag_limit) / 2 or 0) == 0 then
                cmd.forwardmove = 1.01
            end ;
            if cmd.chokedcommands % 2 ~= 0 and cmd.chokedcommands % n.antiresolver.targeted == 0 then
                cmd.forwardmove = 1.01
            end
        elseif hN == 'Fake Max' then
            if cmd.chokedcommands % n.antiresolver.targeted then
                cmd.forwardmove = 1.01
            end
        elseif hN == 'Cradle' then
            if cmd.chokedcommands % n.antiresolver.targeted == 0 then
                cmd.forwardmove = 1.01
            end
        elseif hN == 'Shake' then
            if cmd.chokedcommands % 3 == 0 or cmd.chokedcommands % n.antiresolver.targeted / 2 == 0 then
                cmd.forwardmove = 1.01
            end
        end
    end
end;
function q.Slidewalk(cmd)
    local hO = entity.get_prop(entity.get_local_player(), "m_MoveType")
    if hO == 9 then
        return
    end ;
    if cmd.in_use == 1 then
        return
    end ;
    if p.misc_features:IsEnabled('Slide Walk') then
        if cmd.forwardmove > 0 then
            cmd.in_back = 1;
            cmd.in_forward = 0
        end ;
        if cmd.forwardmove < 0 then
            cmd.in_forward = 1;
            cmd.in_back = 0
        end ;
        if cmd.sidemove < 0 then
            cmd.in_moveright = 1;
            cmd.in_moveleft = 0
        end ;
        if cmd.sidemove > 0 then
            cmd.in_moveleft = 1;
            cmd.in_moveright = 0
        end
    end
end;
local hP, hQ = ui.reference("AA", "Other", "Slow motion")
local hR = false;
function s.world2screen(hS, hT)
    if hS == 0 and hT == 0 then
        return 0
    end ;
    return math.deg(math.atan2(hT, hS))
end;
local hU = ui.reference("AA", "Fake lag", "Enabled")
local hV, hW, hX = 0, 0, 0;
local hY = ui.reference("RAGE", 'Aimbot', "Minimum Damage")
function q.is_auto_vis(e, hn, ho, lz, bL, bM, bN)
    entindex, dmg = client.trace_bullet(ent, hn, ho, lz, bL, bM, bN)
    if entindex == nil then
        return false
    end ;
    if entindex == e then
        return false
    end ;
    if not entity.is_enemy(entindex) then
        return false
    end ;
    if dmg > hY then
        return true
    else
        return false
    end
end;
function q.trace_positions(bL, bM, bN, hZ, h_, i0, i1, i2, i3, hV, hW, hX)
    if q.is_auto_vis(local_player, hV, hW, hX, bL, bM, bN) then
        return true
    end ;
    if q.is_auto_vis(local_player, hV, hW, hX, hZ, h_, i0) then
        return true
    end ;
    if q.is_auto_vis(local_player, hV, hW, hX, i1, i2, i3) then
        return true
    end ;
    return false
end;
function q.disable_fakelag()
    ui.set(hU, false)
end;
function q.enable_fakelag()
    ui.set(hU, true)
end;
function q.drawException()
    if not (p.misc_fakelagonpeek:GetValue() and p.misc_fakelagonpeek_drawprediction:GetValue()) then
        return
    end ;
    if local_player == nil then
        return
    end ;
    if not entity.is_alive(local_player) then
        return
    end ;
    local bJ = entity.get_players(true)
    if bJ == nil then
        return
    end ;
    local wx, wy = client.world_to_screen(ctx, hV, hW, hX)
    if wx == nil then
        return
    end ;
    renderer.circle(wx, wy, 17, 17, 17, 255, 4, 0, 1)
end;
function q.FakelagOnPeek(cmd)
    if not p.misc_fakelagonpeek:GetValue() then
        return
    end ;
    local bJ = entity.get_players()
    if bJ == nil then
        return
    end ;
    local hn, ho, lz = client.eye_position()
    if hn == nil then
        return
    end ;
    for I = 1, #bJ do
        local i4 = bJ[I]
        if not entity.is_enemy(i4) then
            if not i4 == local_player then
                return
            end
        end ;
        local bL, bM, bN = entity.hitbox_position(i4, 0)
        local hZ, h_, i0 = entity.hitbox_position(i4, 4)
        local i1, i2, i3 = entity.hitbox_position(i4, 2)
        if bL == nil then
            return
        end ;
        if x.is_moving(local_player) then
            hV, hW, hX = x.ExtrapolatePosition(hn, ho, lz, p.misc_fakelagonpeek_prediction:GetValue(), local_player)
        else
            hV, hW, hX = hn, ho, lz
        end ;
        if hV == nil then
            return
        end ;
        if q.trace_positions(bL, bM, bN, hZ, h_, i0, i1, i2, i3, hV, hW, hX) then
            q.enable_fakelag()
            client.delay_call(p.misc_fakelagonpeek_time:GetValue() / 1000, q.disable_fakelag)
        end
    end
end;
local i5 = { ui.reference("VISUALS", "Effects", "Force third person (alive)") }
function q.local_info()
    local ent = local_player;
    if entity.is_alive(ent) and mariolua.debug.draw['player_infos'] then
        for bv = 0, 13 do
            renderer.text(10 + 200 * bv, 100 + 15 * bv, n.color[1], n.color[2], n.color[3], 220, "c", 0, 'Layer: ' .. bv)
            for I, F in pairs(n.t_last_layer_info) do
                wx, wy = 10 + 200 * I, 250 + 15 * I;
                if wx == nil or wy == nil then
                    return
                end ;
                renderer.text(wx, wy, n.color[1], n.color[2], n.color[3], 220, "c", 0, h7(F))
            end
        end
    end
end;
local i6 = { choked = 0, limit = 0, sendpacket = false }
function q.FakelagChams(ar)
    if ui.get(i5[1]) and ui.get(i5[2]) and p.visuals_fakelagchams:GetValue() then
        local i7 = ar.chokedcommands;
        if i6.choked ~= 0 and i7 == 0 then
            i6.limit = i6.choked
        end ;
        i6.sendpacket = i7 == i6.limit;
        i6.choked = i7;
        local i8 = false;
        local i9 = false;
        i8 = i6.sendpacket;
        i9 = i6.choked == 0;
        if i8 then
            client.draw_hitboxes(local_player, globals.tickinterval() * (i6.limit + 2), 19, 60, 147, 250, 255)
        end ;
        if i9 then
            client.draw_hitboxes(local_player, globals.tickinterval() * (i6.limit + 2), 19, 250, 50, 60, 255)
        end
    end
end;
n.antiaim.exception_met = true;
local ia = { aa = false, limit = 14, auto_inf_duck = false }
function q.FakeDuckFix()
    if p.misc_features:IsEnabled('Legit Fake Duck Fix') then
        if ui.get(n.ref.rage.fakeduck) then
            if ia.aa == false then
                ia.limit = ui.get(n.ref.fakelag_limit)
            end ;
            if not ui.get(n.ref.misc.infinite_duck) and ia.auto_inf_duck == false then
                ui.set(n.ref.misc.infinite_duck, true)
                ia.auto_inf_duck = true
            end ;
            ui.set(n.ref.fakelag_limit, 6)
            n.antiaim.exception_met = false;
            ia.aa = true
        elseif ia.aa then
            if ia.auto_inf_duck then
                ui.set(n.ref.misc.infinite_duck, false)
                ia.auto_inf_duck = false
            end ;
            ui.set(n.ref.fakelag_limit, ia.limit)
            ia.aa = false;
            n.antiaim.exception_met = true
        end
    end
end;
local ib = { IndicesNoteam = { [0] = "kick", [1] = "changelevel", [3] = "scrambleteams", [4] = "swapteams" }, IndicesTeam = { [1] = 'starttimeout', [2] = 'surrender' }, Descriptions = { changelevel = 'change the map', scrambleteams = 'scramble the teams', starttimeout = 'start a timeout', surrender = 'surrender', kick = 'kick' }, OnGoingVotes = {}, VoteOptions = {} }
function q.OnVoteReset()
    if p.misc_features:IsEnabled('Vote Revealer') then
        for ic, id in pairs(ib.OnGoingVotes) do
            if entity.get_prop(id.controller, 'm_iActiveIssueIndex') ~= id.IssueIndex then
                ib.OnGoingVotes[ic] = nil
            end
        end
    end
end;
function q.on_vote_options(au)
    if p.misc_features:IsEnabled('Vote Revealer') then
        ib.VoteOptions = { au.option1, au.option2, au.option3, au.option4, au.option5 }
        for I = #ib.VoteOptions, 1, -1 do
            if ib.VoteOptions[I] == '' then
                table.remove(ib.VoteOptions, I)
            end
        end
    end
end;
function q.on_vote_cast(au)
    if p.misc_features:IsEnabled('Vote Revealer') then
        client.delay_call(0.3, function()
            local ic = au.team;
            local ie = ib;
            if ib.VoteOptions then
                local ig;
                local ih = entity.get_all('CVoteController')
                for I = 1, #ih do
                    if entity.get_prop(ih[I], 'm_iOnlyTeamToVote') == ic then
                        ig = ih[I]
                        break
                    end
                end ;
                if ig then
                    local ii = { team = ic, options = ib.VoteOptions, controller = ig, IssueIndex = entity.get_prop(ig, 'm_iActiveIssueIndex'), votes = {} }
                    for I = 1, #ib.VoteOptions do
                        ii.votes[ib.VoteOptions[I]] = {}
                    end ;
                    ii.type = ib.IndicesNoteam[ii.IssueIndex]
                    if ic ~= -1 and ib.IndicesTeam[ii.IssueIndex] then
                        ii.type = ib.IndicesTeam[ii.IssueIndex]
                    end ;
                    ib.OnGoingVotes.team = ii
                end ;
                ib.VoteOptions = nil
            end ;
            local ii = ib.OnGoingVotes.team;
            if ii then
                local bK = au.entityid;
                local ij = ii.options[au.vote_option + 1]
                table.insert(ii.votes[ij], bK)
                if ij == 'Yes' and ii.caller == nil then
                    ii.caller = bK;
                    if ii.type ~= 'kick' then
                        local bp = entity.get_player_name(bK) .. ' called a vote to: ' .. ib.Descriptions[ii.type]
                        mariolua.print(bp)
                        mariolua.PrintInChat(entity.get_player_name(bK) .. ' called a vote to: ' .. ib.Descriptions[ii.type])
                    end
                end ;
                if ii.type == 'kick' then
                    if ij == 'No' then
                        if ii.target == nil then
                            ii.target = bK;
                            local ik = ic == 3 and 'CT\'s' or 'T\'s'
                            local bp = ik .. ' called a vote to ' .. ib.Descriptions[ii.type] .. ': ' .. entity.get_player_name(ii.target)
                            mariolua.print(bp)
                            mariolua.PrintInChat(ik .. ' called a vote to ' .. ib.Descriptions[ii.type] .. ': ' .. entity.get_player_name(ii.target))
                        end
                    end
                end ;
                local bp = entity.get_player_name(bK) .. ' voted: ' .. ij;
                mariolua.print(bp)
                mariolua.PrintInChat(entity.get_player_name(bK) .. ' voted: ' .. ij)
            end
        end)
    end
end;
function q.hold_bot(au)
    if p.misc_features:IsEnabled('Auto Hold Bot') then
        local bJ = entity.get_players()
        if bJ == nil then
            return
        end ;
        for I = 1, #bJ do
            local entindex = bJ[I]
            if not entity.is_enemy(entindex) then
                local be = entity.get_prop(entindex, "m_fFlags")
                if be and bit.band(be, 0x200) == 0x200 then
                    client.exec("holdpos")
                    return
                end
            end
        end
    end
end;
function q.ReportEnemy()
    if n.report.should_report then
        local il = globals.curtime()
        if entity.get_steam64(n.report.idx) ~= 0 and entity.is_enemy(n.report.idx) then
            if n.report.next_report_time > il then
                return
            end ;
            local im = entity.get_player_name(n.report.idx)
            if not pcall(function()
                n.report.total_reports = n.report.total_reports + 1;
                local io = h.GetPlayerXuidStringFromEntIndex(n.report.idx)
                h.SubmitPlayerReport(io, 'textabuse,voiceabuse,grief,aimbot,wallhack,speedhack')
                mariolua.PrintInChat('Submitting report for player ' .. im .. '(Report ' .. n.report.idx .. '#)')
                if p.report_write_chat:GetValue() then
                    client.exec('say ', 'Submitting report for player ' .. im .. '(Report ' .. n.report.idx .. '#)')
                end ;
                h.ToggleMute(io)
            end) then
                mariolua.PrintInChat('Error encountered while submitting report!')
                mariolua.notify(5, 'Error encountered while submitting report!')
            end ;
            n.report.next_report_time = il + 1
        end ;
        if n.report.idx >= globals.maxplayers() then
            n.report.total_reports = 0;
            n.report.should_report = false;
            n.report.idx = 1;
            mariolua.PrintInChat('Finished reporting')
            mariolua.notify(5, 'Finished reporting')
        else
            n.report.idx = n.report.idx + 1
        end
    end
end;
local ip = panorama.loadstring([[
	if ( typeof i_ForceHvHion == 'undefined' ) {
		i_ForceHvHion = {};
		i_ForceHvHion.status = true;
		i_ForceHvHion.last = 0;

		i_ForceHvHion.EventFunc = (shouldShow, playersReadyCount, numTotalClientsInReservation)=>{
			let PossibleAutoAccepts = playersReadyCount - i_ForceHvHion.last;
			i_PossibleAutoAccepts = PossibleAutoAccepts;
			i_ForceHvHion.last = playersReadyCount;
			i_playersReadyCount = playersReadyCount;
			return {
				autoaccept: PossibleAutoAccepts,
				accepts: playersReadyCount,
			}
		};
	}
]])()
local iq = panorama.loadstring([[
	i_playersReadyCount = 0;
	i_PossibleAutoAccepts = 0;

	if ( typeof i_ForceHvHion == 'undefined' ) {
		i_ForceHvHion = {};
		i_ForceHvHion.status = true;
		i_ForceHvHion.last = 0;

		i_ForceHvHion.EventFunc = (shouldShow, playersReadyCount, numTotalClientsInReservation)=>{
			let PossibleAutoAccepts = playersReadyCount - i_ForceHvHion.last;
			i_PossibleAutoAccepts = PossibleAutoAccepts;
			i_ForceHvHion.last = playersReadyCount;
			i_playersReadyCount = playersReadyCount;
			if ( PossibleAutoAccepts < 8 ) {






	LobbyAPI.StopMatchmaking();
				LobbyAPI.StartMatchmaking( '', '', '', '' );
			}
		};
	}
	return {
		i_ForceHvHion: {
			toggle: (status)=>{
				if ( status && !i_ForceHvHion.handle ) {
					i_ForceHvHion.handle = $.RegisterForUnhandledEvent( 'PanoramaComponent_Lobby_ReadyUpForMatch', i_ForceHvHion.EventFunc);
				} else {
					if ( i_ForceHvHion.handle ) {
						$.UnregisterForUnhandledEvent( 'PanoramaComponent_Lobby_ReadyUpForMatch', i_ForceHvHion.handle);
						i_ForceHvHion.handle = false;
					}
				}
			},
		},
	}
]])()
iq.i_ForceHvHion.toggle(false)
function q.ForceHvH_Init()
    if p.misc_forcehvh == nil then
        return
    end ;
    if p.misc_forcehvh:GetValue() then
        iq.i_ForceHvHion.toggle(true)
    end
end;
q.ForceHvH_Init()
function q.ForceHvH()
    if p.misc_forcehvh == nil then
        return
    end ;
    if p.misc_forcehvh:GetValue() then
        mariolua.log('ForceHvH: On')
        iq.i_ForceHvHion.toggle(true)
        print(tostring(ip.autoaccept))
        print(tostring(ip.accepts))
    end
end;
n.epeek_key_input = false;
function q.handle_epeek()
    if not p.antiaim_epeek:GetValue() then
        return
    end ;
    local ir = p.antiaim_epeek_method:GetItemName() == 'Automatic' and true or false;
    if p.antiaim_epeek_mode:GetItemName() == 'Hold' then
        if p.antiaim_epeek_key:IsKeyDown() then
            n.epeek_key_input = true
        elseif not p.antiaim_epeek_key:IsKeyDown() then
            n.epeek_key_input = false
        end
    elseif p.antiaim_epeek_mode:GetItemName() == 'Toggle' then
        n.epeek_key_input = p.antiaim_epeek_key:IsKeyToggle()
    elseif p.antiaim_epeek_mode:GetItemName() == 'Always' then
        n.epeek_key_input = true
    end ;
    q.e_peek.onhandle(n.epeek_key_input, ir)
end;
function q.ThirdpersonDistance()
    if p.thirdperson_dist:GetValue() ~= n.thirdperson.dist then
        client.exec("cam_idealdist " .. p.thirdperson_dist:GetValue())
    end
end;
n.thirdperson.collison = nil;
function q.ThirdpersonCollision()
    if p.thirdperson_collision:GetValue() and n.thirdperson.collison ~= false then
        client.exec("cam_collision 0")
        n.thirdperson.collison = false
    elseif not p.thirdperson_collision:GetValue() and n.thirdperson.collison ~= true then
        client.exec("cam_collision 1")
        n.thirdperson.collison = true
    end
end;
client.register_esp_flag("RESOLVING", 225, 40, 40, function(ent)
    if not ui.is_menu_open() and p.esp_flags:IsEnabled('Resolving') then
        return ui.get(n.ref.correction_active_ref)
    end
end)
client.register_esp_flag("LETHAL", 240, 0, 0, function(ent)
    if not ui.is_menu_open() and p.esp_flags:IsEnabled('Lethal') then
        local is = { entity.hitbox_position(ent, "pelvis") }
        if #is == 3 then
            local _, dmg = client.trace_bullet(local_player, is[1], is[2], is[3], is[1], is[2], is[3])
            return entity.get_prop(ent, "m_iHealth") <= dmg
        end
    end
end)
client.register_esp_flag("LOW-DELTA", 225, 40, 40, function(ent)
    if n.resolver_t ~= nil then
        if r.info[ent] then
            return r.IsActive() and p.esp_flags:IsEnabled('Low-Delta') and r.info[ent].low_delta['active'] or false
        else
            return false
        end
    else
        return false
    end
end)
client.register_esp_flag("SW", 200, 40, 40, function(ent)
    if n.resolver_t ~= nil then
        if r.data[ent] then
            return r.IsActive() and p.esp_flags:IsEnabled('Slow-walk') and r.data[ent].props['is_slowwalking'] or false
        else
            return false
        end
    else
        return false
    end
end)
n.antiaim.switch_side_toggle = false;
function q.handleKeybinds()
    if p.aimbot_enable:GetValue() then
        if p.aimbot_mode:GetItemName() == 'Hold' then
            if p.aimbot_key:IsKeyDown() then
                ui.set(n.ref.rage.aimbot_enabled[1], true)
                ui.set(n.ref.automatic_fire, true)
                ui.set(n.ref.rage.aimbot_enabled[2], 'Always on')
            elseif not p.aimbot_key:IsKeyDown() then
                ui.set(n.ref.rage.aimbot_enabled[2], 'On hotkey')
            end
        elseif p.aimbot_mode:GetItemName() == 'Toggle' then
            if p.aimbot_key:IsKeyToggle() then
                ui.set(n.ref.rage.aimbot_enabled[1], true)
                ui.set(n.ref.automatic_fire, true)
                ui.set(n.ref.rage.aimbot_enabled[2], 'Always on')
            else
                ui.set(n.ref.rage.aimbot_enabled[2], 'On hotkey')
            end
        elseif p.aimbot_mode:GetItemName() == 'Always' then
            ui.set(n.ref.rage.aimbot_enabled[1], true)
            ui.set(n.ref.automatic_fire, true)
            ui.set(n.ref.rage.aimbot_enabled[2], 'Always on')
        end
    end ;
    if p.autowall_enable:GetValue() then
        if p.autowall_mode:GetItemName() == 'Hold' then
            if p.autowall_key:IsKeyDown() then
                ui.set(n.ref.rage.autowall, true)
            elseif not p.autowall_key:IsKeyDown() then
                ui.set(n.ref.rage.autowall, false)
            end
        elseif p.autowall_mode:GetItemName() == 'Toggle' then
            ui.set(n.ref.rage.autowall, p.autowall_key:IsKeyToggle())
        elseif p.autowall_mode:GetItemName() == 'Always' then
            ui.set(n.ref.rage.autowall, true)
        end
    end ;
    if p.forcebaim_enable:GetValue() then
        if p.forcebaim_mode:GetItemName() == 'Hold' then
            if p.forcebaim_key:IsKeyDown() then
                ui.set(n.ref.rage.force_baim_key, 'Always on')
            elseif not p.forcebaim_key:IsKeyDown() then
                ui.set(n.ref.rage.force_baim_key, 'On hotkey')
            end
        elseif p.forcebaim_mode:GetItemName() == 'Toggle' then
            if p.forcebaim_key:IsKeyToggle() then
                ui.set(n.ref.rage.force_baim_key, 'Always on')
            else
                ui.set(n.ref.rage.force_baim_key, 'On hotkey')
            end
        elseif p.forcebaim_mode:GetItemName() == 'Always' then
            ui.set(n.ref.rage.force_baim_key, 'Always on')
        end
    end ;
    if q.dormant_aim ~= nil then
        if p.dormant_enable:GetValue() then
            q.dormant_aim.is_enabled = true;
            if p.dormant_mode:GetItemName() == 'Hold' then
                if p.dormant_key:IsKeyDown() then
                    q.dormant_aim.is_key = true
                elseif not p.dormant_key:IsKeyDown() then
                    q.dormant_aim.is_key = false
                end
            elseif p.dormant_mode:GetItemName() == 'Toggle' then
                q.dormant_aim.is_key = p.dormant_key:IsKeyToggle()
            elseif p.dormant_mode:GetItemName() == 'Always' then
                q.dormant_aim.is_key = true
            end
        elseif q.dormant_aim.is_enabled then
            q.dormant_aim.is_enabled = false;
            q.dormant_aim.is_key = false
        elseif not p.dormant_enable:GetValue() then
            q.dormant_aim = nil;
            mariolua.unload_module('dormant_aim' .. (d and '_dev' or ''))
        end
    elseif p.dormant_enable:GetValue() then
        q.dormant_aim = mariolua.load_module('dormant_aim' .. (d and '_dev' or ''))
    elseif not p.dormant_enable:GetValue() and q.dormant_aim ~= nil then
        q.dormant_aim = nil;
        mariolua.unload_module('dormant_aim' .. (d and '_dev' or ''))
    end ;
    if q.wait_onshot ~= nil then
        if p.aimbot_wait_onshot:GetValue() then
            if p.aimbot_wait_onshot_mode:GetItemName() == 'Hold' then
                if p.aimbot_wait_onshot_key:IsKeyDown() then
                    n.wait_onshot_enabled = true;
                    q.wait_onshot.on_enable()
                elseif not p.aimbot_wait_onshot_key:IsKeyDown() then
                    n.wait_onshot_enabled = false;
                    q.wait_onshot.on_disable()
                end
            elseif p.aimbot_wait_onshot_mode:GetItemName() == 'Toggle' then
                if p.aimbot_wait_onshot_key:IsKeyToggle() then
                    n.wait_onshot_enabled = true;
                    q.wait_onshot.on_enable()
                else
                    n.wait_onshot_enabled = false;
                    q.wait_onshot.on_disable()
                end
            elseif p.aimbot_wait_onshot_mode:GetItemName() == 'Always' then
                n.wait_onshot_enabled = true;
                q.wait_onshot.on_enable()
            end
        elseif n.wait_onshot_enabled then
            n.wait_onshot_enabled = false;
            q.wait_onshot.on_disable()
        elseif not p.aimbot_wait_onshot:GetValue() then
            q.wait_onshot = nil;
            mariolua.unload_module('force_onshot')
        end
    elseif p.aimbot_wait_onshot:GetValue() then
        q.wait_onshot = mariolua.load_module('force_onshot')
    elseif not p.aimbot_wait_onshot:GetValue() and q.wait_onshot ~= nil then
        q.wait_onshot = nil;
        mariolua.unload_module('force_onshot')
    end ;
    if p.thirdperson_key:IsKeyToggle() then
        ui.set(ex, 'Always on')
        ui.set(ew, true)
        ui.set(n.ref.thirdperson_death_ref, true)
    else
        ui.set(ex, 'On hotkey')
        ui.set(ew, false)
        ui.set(n.ref.thirdperson_death_ref, false)
    end
end;
ffi_cdef [[
    typedef void*(__stdcall* GetFriendsListApi_t)();
    typedef void(__thiscall* InviteXuid_t)(void* this, unsigned long long xuid);
]]
n.config_str = ''
function q.cfg_on_load()
    mariolua.userdata.backup = database.read('mariolua_db_backup')
    if not mariolua.userdata.backup then
        return
    end ;
    n.config_str = config.export()
end;
function q.save_cfg()
    mariolua.userdata.backup = database.read('mariolua_db_backup')
    if not mariolua.userdata.backup then
        return
    end ;
    local it = client.unix_time()
    writefile('config_backup_' .. it .. '.mariolua', n.config_str)
    mariolua.print('Config backup created!')
    mariolua.PrintInChat('Config backup created!')
end;
n.double_tap_speed = 'Off'
function q.ExecuteCommand()
    local iu = p.double_tap_speed:GetItemName()
    local iv = entity.get_prop(entity.get_game_rules(), "m_bIsValveDS")
    if iv == 1 then
        if n.double_tap_speed ~= 'Off' then
            ui.set(n.ref.misc.sv_maxusrcmdprocessticks, 16)
            cvar.cl_clock_correction:set_int(1)
            n.double_tap_speed = 'Off'
            mariolua.log('Double tab speed set to ' .. n.double_tap_speed)
        end
    elseif iu == 'Off' and n.double_tap_speed ~= 'Off' then
        ui.set(n.ref.misc.sv_maxusrcmdprocessticks, 16)
        cvar.sv_maxusrcmdprocessticks:set_int(16)
        cvar.cl_clock_correction:set_int(1)
        n.double_tap_speed = 'Off'
        mariolua.log('Double tab speed set to ' .. n.double_tap_speed)
    elseif iu == 'Fast' and n.double_tap_speed ~= 'Fast' then
        ui.set(n.ref.misc.sv_maxusrcmdprocessticks, 17)
        cvar.sv_maxusrcmdprocessticks:set_int(17)
        cvar.cl_clock_correction:set_int(0)
        n.double_tap_speed = 'Fast'
        mariolua.log('Double tab speed set to ' .. n.double_tap_speed)
    elseif iu == '+Fast' and n.double_tap_speed ~= '+Fast' then
        ui.set(n.ref.misc.sv_maxusrcmdprocessticks, 18)
        cvar.sv_maxusrcmdprocessticks:set_int(18)
        cvar.cl_clock_correction:set_int(0)
        n.double_tap_speed = '+Fast'
        mariolua.log('Double tab speed set to ' .. n.double_tap_speed)
    elseif iu == 'Max' and n.double_tap_speed ~= 'Max' then
        ui.set(n.ref.misc.sv_maxusrcmdprocessticks, 20)
        cvar.sv_maxusrcmdprocessticks:set_int(20)
        cvar.cl_clock_correction:set_int(0)
        n.double_tap_speed = 'Max'
        mariolua.log('Double tab speed set to ' .. n.double_tap_speed)
    end ;
    if p.misc_features:IsEnabled('Disable Engine Sleep') and n.engine_no_focus_sleep ~= 0 then
        n.engine_no_focus_sleep = 0;
        client.exec('engine_no_focus_sleep ', '0')
    elseif not p.misc_features:IsEnabled('Disable Engine Sleep') and n.engine_no_focus_sleep then
        n.engine_no_focus_sleep = 50;
        client.exec('engine_no_focus_sleep ', '50')
    end
end;
function q.can_defuse_c4()
    local iw = entity.get_all("CPlantedC4")[1]
    if iw == nil then
        return
    end ;
    local ix, iy, iz = entity.get_prop(iw, "m_vecOrigin")
    local iA, iB, iC = entity.get_prop(local_player, "m_vecOrigin")
    local c1 = B.distance_3d(A(ix, iy, iz), A(iA, iB, iC))
    if c1 < 62 then
        return true
    end ;
    return false
end;
function q.can_rescure_hostage()
    local iD = entity.get_all("CHostage")[1]
    if iD == nil then
        return
    end ;
    local iE, iF, iG = entity.get_prop(iD, "m_vecOrigin")
    local iA, iB, iC = entity.get_prop(local_player, "m_vecOrigin")
    local c1 = B.distance_3d(A(iE, iF, iG), A(iA, iB, iC))
    if c1 < 62 then
        return true
    end ;
    return false
end;
function q.e_peek_fix()
    if p.antiaim_epeek:GetValue() and p.antiaim_epeek_key:GetKeyName() == 'E' then
        if q.can_rescure_hostage() then
            if n.epeek_key_input and p.antiaim_epeek_key:IsKeyDown() then
                client.exec('+use')
                client.exec('unbind e')
            else
                client.exec('-use')
                client.exec('bind e +use')
            end
        elseif q.can_defuse_c4() and p.antiaim_epeek_key:IsKeyDown() then
            if n.epeek_key_input then
                client.exec('+use')
                client.exec('unbind e')
            else
                client.exec('-use')
                client.exec('bind e +use')
            end
        elseif n.epeek_key_input and not entity.get_classname(entity.get_player_weapon(local_player)) == "CC4" then
            client.exec('-use')
            client.exec('unbind e')
        elseif n.epeek_key_input and entity.get_classname(entity.get_player_weapon(local_player)) == "CC4" then
            client.exec('+use')
            client.exec('unbind e')
        else
            client.exec('-use')
            client.exec('bind e +use')
        end
    end
end;
function q.render_intersect()
    if p.settings_debugmode:IsEnabled('Show In Bounds') then
        for _, F in pairs(n.intersect_t) do
            renderer.rectangle(F[1], F[2], F[3], F[4], 255, 0, 0, F[5])
            n.intersect_t[F[1] .. F[2] .. F[3] .. F[4]] = nil
        end
    end
end;
function q.lock_input(cmd)
    local_player = entity.get_local_player()
    if cmd then
        n.is_input_blocked = false;
        o.enable_input(o.inputsystem, true)
        if ui.is_menu_open() then
            cmd.in_attack = 0;
            cmd.in_attack2 = 0
        end ;
        if n.lock_input['move'] then
            cmd.in_jump = 0;
            cmd.in_reload = 0;
            cmd.weaponselect = 0;
            cmd.in_attack3 = 0;
            cmd.forwardmove = 0;
            cmd.sidemove = 0
        end
    elseif not local_player then
        n.lock_input['attack'] = false;
        n.lock_input['move'] = false;
        n.is_input_blocked = ui.is_menu_open()
        o.enable_input(o.inputsystem, not n.is_input_blocked)
    end
end;
function q.get_aa_condition()
    if not entity.is_alive(local_player) then
        return
    end ;
    local iH = ui.get(n.ref.aa.slow_motion[1]) and ui.get(n.ref.aa.slow_motion[2])
    local iI = x.is_moving(local_player)
    local cn;
    if not iH then
        cn = iI and 'moving' or 'standing'
    else
        cn = 'slowmotion'
    end ;
    p.antiaim_enable = bq.Reference('antiaim.' .. cn .. '.enable')
    p.antiaim_state = bq.Reference('antiaim.' .. cn .. '.state')
    p.antiaim_fake = bq.Reference('antiaim.' .. cn .. '.fake')
    p.antiaim_fake_jitter = bq.Reference('antiaim.' .. cn .. '.fake.jitter')
    p.antiaim_fake_jitter_enable = bq.Reference('antiaim.' .. cn .. '.fake.jitter.enable')
    p.antiaim_fake_jitter_speed = bq.Reference('antiaim.' .. cn .. '.fake.jitter.speed')
    p.antiaim_body = bq.Reference('antiaim.' .. cn .. '.body')
    p.antiaim_body_mode = bq.Reference('antiaim.' .. cn .. '.body.mode')
    p.antiaim_lbyextras_mode = bq.Reference('antiaim.' .. cn .. '.lbyextras')
    p.antiaim_freestanding = bq.Reference('antiaim.' .. cn .. '.mode')
    p.antiaim_lby_mode = bq.Reference('antiaim.' .. cn .. '.lby')
    p.antiaim_slowwalk = bq.Reference('antiaim.' .. cn .. '.slowwalk.enabled')
    p.antiaim_slowwalk_speed = bq.Reference('antiaim.' .. cn .. '.slowwalk.speed')
    p.antiaim_enable_anti_bruteforce = bq.Reference('antiaim.' .. cn .. '.antibruteforce.enable')
    p.antiaim_anti_bruteforce_timeout = bq.Reference('antiaim.' .. cn .. '.antibruteforce.timeout')
    p.antiaim_default_yaw_offset = bq.Reference('antiaim.' .. cn .. '.antibruteforce.yaw.default')
    p.antiaim_max_yaw_delta = bq.Reference('antiaim.' .. cn .. '.antibruteforce.yaw.max')
    p.antiaim_yaw_step = bq.Reference('antiaim.' .. cn .. '.antibruteforce.yaw.step')
    p.antiaim_default_body_yaw_offset = bq.Reference('antiaim.' .. cn .. '.antibruteforce.bodyyaw.default')
    p.antiaim_max_body_yaw_delta = bq.Reference('antiaim.' .. cn .. '.antibruteforce.bodyyaw.max')
    p.antiaim_body_yaw_step = bq.Reference('antiaim.' .. cn .. '.antibruteforce.bodyyaw.step')
end;
function n.antiaim.LoadConfigList()
    p.antiaim_config_list.items = {}
    config_db = database.read('mariolua_db_aa_config') or {}
    local items = {}
    for Q, F in pairs(config_db) do
        table.insert(items, Q)
    end ;
    p.antiaim_config_list:SetItems(items)
end;
function n.antiaim.SaveConfig()
    local iJ = p.antiaim_config_input:GetValue()
    local iK = p.antiaim_config_list:GetItemName()
    local iL = iJ == '' and iK or iJ;
    local a8 = '{\n'
    for I = 1, #n.reference do
        local cy = n.reference[n.reference[I]]
        if cy.reference:match('antiaim.') and cy:GetValue() ~= nil and (cy.type ~= 'text' or cy.type == 'text' and cy.should_save) and (cy.type ~= 'tab' or cy.type == 'tab' and cy.should_save) and cy.type ~= 'button' and cy.type ~= 'groupbox' and cy.type ~= 'editbox' and cy.type ~= 'multibox_item' then
            if type(cy:GetValue()) == 'table' or cy.type == 'save_var' or cy.type == 'multibox' then
                a8 = a8 .. "['" .. n.reference[I] .. "']" .. " = " .. u.table_to_string3(cy:GetValue()) .. ",\n"
            elseif type(cy:GetValue()) == 'string' then
                a8 = a8 .. "['" .. n.reference[I] .. "']" .. " = " .. cy:GetValue() .. ",\n"
            elseif type(cy:GetValue()) == 'boolean' or 'number' then
                a8 = a8 .. "['" .. n.reference[I] .. "']" .. " = " .. tostring(cy:GetValue()) .. ",\n"
            end
        end
    end ;
    a8 = a8 .. '}'
    config_db = database.read('mariolua_db_aa_config') or {}
    config_db[iL] = a8;
    if u.Contains(p.antiaim_config_list.item_list, iL) then
        return mariolua.notify(5, 'Anti-Aim config "' .. iL .. '" saved')
    end ;
    p.antiaim_config_list:AddItem(p.antiaim_config_input:GetValue())
    mariolua.log('Added ' .. iL .. ' to Config List')
    mariolua.notify(5, 'Anti-Aim config "' .. iL .. '" added and saved')
end;
function n.antiaim.LoadConfig()
    local gv = p.antiaim_config_list:GetItemName()
    config_db = database.read('mariolua_db_aa_config') or {}
    bq.LoadConfig(config_db[gv])
    mariolua.notify(5, 'Anti-Aim config "' .. gv .. '" loaded')
    mariolua.log('Loaded ' .. gv .. ' from Config List')
end;
function n.antiaim.RemoveConfig()
    config_db = database.read('mariolua_db_aa_config') or {}
    for I = 1, #p.antiaim_config_list.items do
        if p.antiaim_config_list.items[I] == nil then
            return
        end ;
        local gv = p.antiaim_config_list:GetItemName()
        if p.antiaim_config_list.items[I].text == gv then
            config_db[gv] = nil;
            table.remove(p.antiaim_config_list.items, I)
            table.remove(p.antiaim_config_list.item_list, I)
            database.write('mariolua_db_aa_config', config_db)
            mariolua.notify(5, 'Anti-Aim config "' .. gv .. '" removed')
            mariolua.log('Removed ' .. gv .. ' from Config List')
        end
    end
end;
q.debug_event_infos()
function q.handle_sv_pure_fix()
    if q.sv_pure_fix ~= nil and p.misc_features:IsEnabled('Bypass sv_pure Fix') then
        q.sv_pure_fix.on_paint_ui()
    elseif p.misc_features:IsEnabled('Bypass sv_pure Fix') then
        q.sv_pure_fix = mariolua.load_module('sv_pure_fix')
    elseif not p.misc_features:IsEnabled('Bypass sv_pure Fix') and q.sv_pure_fix ~= nil then
        q.sv_pure_fix = nil;
        mariolua.unload_module('sv_pure_fix')
    end
end;
function q.handle_clipboard()
    local iM = o.gcpbs(o.isystem)
    local iN = ffi.new("char[?]", iM)
    o.gcpbt(o.isystem, 0, iN, iM * ffi.sizeof("char[?]", iM))
    local iO = ffi.string(iN)
    if iO ~= n.clipboard and iO ~= nil then
        n.clipboard = iO;
        if string.len(iO) > 60 then
            p.settings_clipboardtext.label = "Clipboard: " .. string.sub(iO, s.clamp(string.len(iO), 0, -30)) .. "' ... '" .. string.sub(iO, s.clamp(string.len(iO) * -1, -30, 0))
        else
            p.settings_clipboardtext.label = "Clipboard: " .. iO
        end
    end
end;
function q.handle_resovler()
    if p.resolver_enable:GetValue() and n.resolver_t == nil then
        n.resolver_t = mariolua.load_module('resolver' .. (d and '_dev' or ''))
        if n.resolver_t ~= nil then
            r = n.resolver_t.resolver;
            local iP = n.resolver_t.resolver.get_vars().cache;
            n.resolver_t.resolver.set_vars({ mariolua = mariolua, cache = u.merge(iP, n), bindings = o, refs = p, cmath = s, centity = x, cstring = t, crender = w, cangle = v, Angle = z, Vector3 = A, vector = B, plylist = h6, cweapon = y })
            r = n.resolver_t.resolver.get_vars().resolver
        end
    elseif p.resolver_enable:GetValue() then
        r.handle()
    elseif not p.resolver_enable:GetValue() and (n.resolver_t ~= nil or r ~= nil) then
        n.resolver_t = nil;
        mariolua.unload_module('resolver' .. (d and '_dev' or ''))
    end
end;
function q.handle_aa()
    if p.antiaim_enable:GetValue() and n.aa_t == nil then
        n.aa_t = mariolua.load_module('antiaim' .. (d and '_dev' or ''))
        if n.aa_t ~= nil then
            n.antiaim = u.merge(n.aa_t.antiaim, n.antiaim)
            q.anti_aim = n.antiaim.handle;
            n.aa_t.antiaim.set_vars({ mariolua = mariolua, cache = n, bindings = o, refs = p, cmath = s, centity = x, ctable = u, cstring = t, crender = w, cangle = v, Angle = z, Vector3 = A, vector = B })
            n.aa_t = {}
            n.antiaim.LoadConfigList()
        end
    elseif p.antiaim_enable:GetValue() and q.anti_aim ~= nil then
        q.anti_aim()
    end
end;
function q.handle_dormant_aim()
    if q.dormant_aim ~= nil then
        if q.dormant_aim.is_enabled and p.dormant_enable:GetValue() then
            q.dormant_aim.on_run_command(cmd)
            q.dormant_aim.chat_print = mariolua.PrintInChat;
            q.dormant_aim.log = mariolua.log
        end ;
        if mariolua.userdata.permissions == 'Developer' or mariolua.userdata.permissions == 'Moderator' then
            q.dormant_aim.set_data(p.dormant_hitchance:GetValue(), p.dormant_mindmg:GetValue(), p.dormant_extra:IsEnabled('Quick Stop'), p.dormant_extra:IsEnabled('Force Baim'), p.dormant_extra:IsEnabled('Automatic Scope'))
        else
            q.dormant_aim.set_data(p.dormant_hitchance:GetValue(), p.dormant_mindmg:GetValue(), p.dormant_extra:IsEnabled('Quick Stop'), p.dormant_extra:IsEnabled('Force Baim'), p.dormant_extra:IsEnabled('Automatic Scope'))
        end
    end
end;
function q.handle_antibrute()
    if q.antibrute ~= nil and p.antiaim_enable_anti_bruteforce:GetValue() then
        q.antibrute.enable_anti_bruteforce = false;
        q.antibrute.anti_bruteforce_timeout = p.antiaim_anti_bruteforce_timeout:GetValue()
        q.antibrute.default_yaw_offset = p.antiaim_default_yaw_offset:GetValue()
        q.antibrute.max_yaw_delta = p.antiaim_max_yaw_delta:GetValue()
        q.antibrute.yaw_step = p.antiaim_yaw_step:GetValue()
        q.antibrute.default_body_yaw_offset = p.antiaim_default_body_yaw_offset:GetValue()
        q.antibrute.max_body_yaw_delta = p.antiaim_max_body_yaw_delta:GetValue()
        q.antibrute.body_yaw_step = p.antiaim_body_yaw_step:GetValue()
        q.antibrute.vector = A;
        q.antibrute.log = mariolua.log;
        q.antibrute.on_run_command()
    elseif p.antiaim_enable_anti_bruteforce:GetValue() then
        q.antibrute = mariolua.load_module('antibruteforce')
    end
end;
function q.handle_pre_render()
    n.mouse1_key_state = b4(client.key_state(0x01))
    n.mouse_x, n.mouse_y = ui.mouse_position()
    n.gs_menu_x, n.gs_menu_y = ui.menu_position()
    n.gs_menu_w, n.gs_menu_h = ui.menu_size()
    n.menu.w, n.menu.h = er:GetWindowSize()
    n.menu.x = er.pos.x or n.menu.x;
    n.menu.y = er.pos.y or n.menu.y
end;
client.set_event_callback('paint_ui', function(ctx)
    local_player = entity.get_local_player()
    q.debug_event_infos()
    q.lock_input()
    if ui.is_menu_open() then
        er:Render()
    end ;
    if not q.IsEventActive('run_command') then
        if not o.console_is_visible(o.engine_client) then
            q.handleKeybinds()
            if n.resolver_t ~= nil then
                r.ResolverToggle()
            end
        end ;
        q.AdaptiveWepCfg()
        if ui.is_menu_open() then
            q.handle_clipboard()
        end
    end ;
    q.handleIndicators()
    q.ReportEnemy()
    q.DynamicFOV_Draw()
    q.Watermark()
    q.RenderEnemyAngles()
    q.drawException()
    q.RenderExtrapolation()
    q.Skeleton()
    q.handle_sv_pure_fix()
    if n.resolver_t ~= nil then
        r.render_resolver_indicator()
    end ;
    if mariolua.debug.draw['player_infos'] then
        q.player_infos()
    end ;
    if p.visuals_angle_circle:GetValue() and q.angle_indicator ~= nil then
        q.angle_indicator.on_render()
    elseif p.visuals_angle_circle:GetValue() then
        q.angle_indicator = mariolua.load_module('angle_indicator')
    elseif not p.visuals_angle_circle:GetValue() and q.angle_indicator ~= nil then
        q.angle_indicator = nil;
        mariolua.unload_module('angle_indicator')
    end ;
    if p.visuals_penetration_damage:GetValue() and q.penetration_damage ~= nil then
        q.penetration_damage.on_render()
    elseif p.visuals_penetration_damage:GetValue() then
        q.penetration_damage = mariolua.load_module('penetration_damage')
    elseif not p.visuals_penetration_damage:GetValue() and q.penetration_damage ~= nil then
        q.penetration_damage = nil;
        mariolua.unload_module('penetration_damage')
    end ;
    if q.dormant_aim ~= nil and p.dormant_enable:GetValue() then
        if q.dormant_aim.is_enabled then
            q.dormant_aim.on_paint()
        end
    end ;
    q.render_intersect()
end)
client.set_event_callback('pre_render', function()
    q.handle_pre_render()
    er:Update()
    q.handleWindow()
end)
client.set_event_callback("run_command", function(cmd)
    q.AdaptiveWepCfg()
    q.DynamicFOV()
    q.LegitAutowall()
    q.FakeDuckFix()
    q.OnVoteReset()
    q.e_peek_fix()
    q.handle_weapon_tabs()
    q.handle_resovler()
    q.handle_aa()
    q.handle_dormant_aim()
    q.handle_antibrute()
    h6.force_correction()
    q.get_aa_condition()
    if not o.console_is_visible(o.engine_client) then
        q.handleKeybinds()
        if n.resolver_t ~= nil then
            r.ResolverToggle()
        end
    end ;
    if ui.is_menu_open() then
        q.handle_clipboard()
    end ;
    if p.visuals_angle_circle:GetValue() and q.angle_indicator ~= nil then
        q.angle_indicator.on_run_command()
    end ;
    if q.e_peek ~= nil then
        q.handle_epeek()
    elseif p.antiaim_epeek:GetValue() then
        q.e_peek = mariolua.load_module('e_peek' .. (d and '_dev' or ''))
    elseif not p.antiaim_epeek:GetValue() and q.e_peek ~= nil then
        q.e_peek = nil;
        mariolua.unload_module('e_peek' .. (d and '_dev' or ''))
    end ;
    if q.baim_lethal ~= nil then
        if q.baim_lethal.enabled then
            q.baim_lethal.on_run_command()
        end
    end ;
    if q.penetration_damage ~= nil and p.visuals_penetration_damage:GetValue() then
        q.penetration_damage.on_run_command()
    end
end)
n.restore_callback = false;
function q.delay_call()
    if not mariolua.is_library then
        client.delay_call(1, q.delay_call)
        return
    elseif not n.restore_callback then
        client.set_event_callback = n.old_client_set_event_callback;
        client.unset_event_callback = n.old_client_unset_event_callback;
        ui.set_callback = n.old_ui_set_callback;
        n.restore_callback = true
    end ;
    n.color[1], n.color[2], n.color[3], n.color[4] = ui.get(ui.reference('MISC', 'Settings', 'Menu color'))
    q.ExecuteCommand()
    q.ThirdpersonDistance()
    q.ThirdpersonCollision()
    q.set_resolver_modules()
    client.delay_call(0.5, q.delay_call)
end;
q.delay_call()
client.set_event_callback("net_update_start", function(cmd)
    q.AnimatedClanTag()
end)
client.set_event_callback("setup_command", function(cmd)
    q.Slidewalk(cmd)
    q.FakelagChams(cmd)
    q.AntiResolver(cmd)
    q.FakelagOnPeek(cmd)
    q.lock_input(cmd)
    if q.dormant_aim ~= nil then
        if q.dormant_aim.is_key then
            q.dormant_aim.on_setup_command(cmd)
        end
    end ;
    if q.freezetime_antiaim ~= nil and p.antiaim_freezetime:GetValue() then
        if q.freezetime_antiaim.on_setup_command then
            q.freezetime_antiaim.on_setup_command(cmd)
        end
    elseif p.antiaim_freezetime:GetValue() and q.freezetime_antiaim == nil then
        q.freezetime_antiaim = q.freezetime_antiaim or {}
        q.freezetime_antiaim.on_setup_command = q.freezetime_antiaim.on_setup_command or false;
        if not q.freezetime_antiaim.on_setup_command then
            q.freezetime_antiaim = mariolua.load_module('freezetime_antiaim' .. (d and '_dev' or ''))
        end
    elseif not p.antiaim_freezetime:GetValue() and q.freezetime_antiaim ~= nil then
        q.freezetime_antiaim = nil;
        mariolua.unload_module('freezetime_antiaim' .. (d and '_dev' or ''))
    end ;
    if cmd.chokedcommands == 0 then
        n.indicator.real_yaw = math.min(60, math.abs(entity.get_prop(local_player, "m_flPoseParameter", 11) * 120 - 60))
    elseif cmd.chokedcommands == 1 then
        n.indicator.fake_yaw = cmd.yaw
    end
end)
client.set_event_callback('predict_command', function(iQ)
    if q.wait_onshot ~= nil then
        q.wait_onshot.handle(iQ)
    end
end)
client.set_event_callback('weapon_fire', function(au)
    local e = entity.get_local_player()
    local ent = client.userid_to_entindex(au.userid)
    if not entity.is_alive(e) or ent == e then
        return
    end ;
    if n.resolver_t ~= nil then
        r.on_weapon_fire(ent)
    end
end)
client.set_event_callback('bullet_impact', function(ar)
    if q.antibrute ~= nil and p.antiaim_enable_anti_bruteforce:GetValue() then
        q.antibrute.on_bullet_impact(ar)
    end
end)
client.set_event_callback("game_start", function(au)
    if n.resolver_t ~= nil then
        r.on_game_start()
    end
end)
client.set_event_callback("game_end", function(au)
    if n.resolver_t ~= nil then
        r.on_game_end()
    end
end)
client.set_event_callback('cs_game_disconnected', function(au)
    if n.resolver_t ~= nil then
        r.on_cs_game_disconnected()
    end ;
    n.player_list = {}
    n.should_namespam = false;
    n.spam_counter = 0
end)
client.set_event_callback('player_connect_full', function(au)
    o.initHudChat()
    n.report.total_reports = 0;
    n.report.should_report = false;
    n.report.idx = 1;
    n.report.next_report_time = 0;
    n.stored_weakest_hitbox = {}
end)
function q.on_shutdown()
    --- LOL
end;
client.set_event_callback("shutdown", function()
    cvar.name:set_string(n.name_backup)
    if n.resolver_t ~= nil then
        r.onshot_shutdown()
        ui.set(n.ref.plist_resetall_ref, true)
        r.full_reset()
    end ;
    n.lock_input['attack'] = false;
    n.lock_input['move'] = false;
    o.enable_input(o.inputsystem, true)
    q.on_shutdown()
    n.player_list = {}
end)
client.set_event_callback('vote_options', function(au)
    q.on_vote_options(au)
end)
client.set_event_callback('vote_cast', function(au)
    q.on_vote_cast(au)
end)
client.set_event_callback('round_freeze_end', function(au)
    q.hold_bot(au)
end)
client.set_event_callback('player_death', function(au)
    local iR = au.userid;
    local ent = client.userid_to_entindex(iR)
    local iS = client.userid_to_entindex(iR)
    local iT = client.userid_to_entindex(au.attacker)
    local iU = entity.get_local_player()
    if n.resolver_t ~= nil then
        r.on_player_death(ent)
    end ;
    x.extrapolated_ent_data = x.extrapolated_ent_data or {}
    x.extrapolated_ent_data[ent] = {}
end)
client.set_event_callback("round_start", function()
    if n.resolver_t ~= nil then
        r.on_round_start()
    end ;
    n.visible_hitboxes = {}
    x.extrapolated_ent_data = {}
end)
client.set_event_callback('round_end', function()
    if n.resolver_t ~= nil then
        r.on_round_end()
    end
end)
local iV = ui.reference('CONFIG', 'Presets', 'Load')
local iW = ui.reference('CONFIG', 'Presets', 'Save')
local iX = ui.reference('CONFIG', 'Presets', 'Import from clipboard')
local iY = ui.reference('CONFIG', 'Presets', 'Export to clipboard')
local iZ = ui.reference('CONFIG', 'Lua', 'Reload active scripts')
ui.set_callback(iW, function()
    bq.SaveConfig()
end)
ui.set_callback(iY, function()
    bq.SaveConfig()
end)
ui.set_callback(iX, function()
    bq.LoadConfig()
end)
client.set_event_callback('pre_config_save', function()
    q.save_cfg()
    bq.SaveConfig()
end)
client.set_event_callback('post_config_save', function()
    bq.SaveConfig()
    mariolua.print('Config saved')
    mariolua.notify(5, 'Config saved')
end)
client.set_event_callback('post_config_load', function()
    q.cfg_on_load()
    bq.LoadConfig()
    n.antiaim.LoadConfigList()
    q.LoadNameSpamItems()
    mariolua.print('Config loaded')
    mariolua.notify(5, 'Config loaded')
end)
bq.LoadConfig()
n.antiaim.LoadConfigList()
q.LoadNameSpamItems()
mariolua.print('MarioLua loaded!')
mariolua.print("Welcome Helper SamHoque!")