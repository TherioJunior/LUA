local a = {}
a.index = {}
a.weapons_data, a.weapons_data_types = { [1] = { "deagle", 1, 230, 700, "Desert Eagle", 7, 0.225 }, [2] = { "elite", 1, 240, 400, "Dual Berettas", 30, 0.12 }, [3] = { "fiveseven", 1, 240, 500, "Five-SeveN", 20, 0.15 }, [4] = { "glock", 1, 240, 200, "Glock-18", 20, 0.15 }, [7] = { "ak47", 2, 215, 2700, "AK-47", 30, 0.1 }, [8] = { "aug", 2, 220, 3300, "AUG", 30, 0.09 }, [9] = { "awp", 2, 200, 4750, "AWP", 10, 1.455 }, [10] = { "famas", 2, 220, 2250, "FAMAS", 25, 0.09 }, [11] = { "g3sg1", 2, 215, 5000, "G3SG1", 20, 0.25 }, [13] = { "galilar", 2, 215, 2000, "Galil AR", 35, 0.09 }, [14] = { "m249", 3, 195, 5200, "M249", 100, 0.08 }, [16] = { "m4a1", 2, 225, 3100, "M4A4", 30, 0.09 }, [17] = { "mac10", 4, 240, 1050, "MAC-10", 30, 0.075 }, [19] = { "p90", 4, 230, 2350, "P90", 50, 0.07 }, [23] = { "mp5sd", 4, 235, 1500, "MP5-SD", 30, 0.08 }, [24] = { "ump45", 4, 230, 1200, "UMP-45", 25, 0.09 }, [25] = { "xm1014", 3, 215, 2000, "XM1014", 7, 0.35 }, [26] = { "bizon", 4, 240, 1400, "PP-Bizon", 64, 0.08 }, [27] = { "mag7", 3, 225, 1300, "MAG-7", 5, 0.85 }, [28] = { "negev", 3, 150, 1700, "Negev", 150, 0.075 }, [29] = { "sawedoff", 3, 210, 1100, "Sawed-Off", 7, 0.85 }, [30] = { "tec9", 1, 240, 500, "Tec-9", 18, 0.12 }, [31] = { "taser", 5, 220, 200, "Zeus x27", 1, 0.15 }, [32] = { "hkp2000", 1, 240, 200, "P2000", 13, 0.17 }, [33] = { "mp7", 4, 220, 1500, "MP7", 30, 0.08 }, [34] = { "mp9", 4, 240, 1250, "MP9", 30, 0.07 }, [35] = { "nova", 3, 220, 1050, "Nova", 8, 0.88 }, [36] = { "p250", 1, 240, 300, "P250", 13, 0.15 }, [38] = { "scar20", 2, 215, 5000, "SCAR-20", 20, 0.25 }, [39] = { "sg556", 2, 210, 2750, "SG 553", 30, 0.09 }, [40] = { "ssg08", 2, 230, 1700, "SSG 08", 10, 1.25 }, [41] = { "knifegg", 6, 250, 0, "Knife", -1, 0.15 }, [42] = { "knife", 6, 250, 0, "Knife", -1, 0.15 }, [43] = { "flashbang", 7, 245, 200, "Flashbang", -1, 0.15 }, [44] = { "hegrenade", 7, 245, 300, "High Explosive Grenade", -1, 0.15 }, [45] = { "smokegrenade", 7, 245, 300, "Smoke Grenade", -1, 0.15 }, [46] = { "molotov", 7, 245, 400, "Molotov", -1, 0.15 }, [47] = { "decoy", 7, 245, 50, "Decoy Grenade", -1, 0.15 }, [48] = { "incgrenade", 7, 245, 600, "Incendiary Grenade", -1, 0.15 }, [49] = { "c4", 8, 250, 0, "C4 Explosive", -1, 0.15 }, [50] = { "item_kevlar", 5, 1, 650, "Kevlar Vest", -1, 0.15 }, [51] = { "item_assaultsuit", 5, 1, 1000, "Kevlar + Helmet", -1, 0.15 }, [52] = { "item_heavyassaultsuit", 5, 1, 6000, "Heavy Assault Suit", -1, 0.15 }, [55] = { "item_defuser", 5, 1, 400, "Defuse Kit", -1, 0.15 }, [56] = { "item_cutters", 5, 1, 400, "Rescue Kit", -1, 0.15 }, [57] = { "healthshot", 9, 250, 0, "Medi-Shot", -1, 0.15 }, [59] = { "knife_t", 6, 250, 0, "Knife", -1, 0.15 }, [60] = { "m4a1_silencer", 2, 225, 3100, "M4A1-S", 25, 0.1 }, [61] = { "usp_silencer", 1, 240, 200, "USP-S", 12, 0.17 }, [63] = { "cz75a", 1, 240, 500, "CZ75-Auto", 12, 0.1 }, [64] = { "revolver", 1, 180, 600, "R8 Revolver", 8, 0.5 }, [68] = { "tagrenade", 7, 245, 100, "Tactical Awareness Grenade", -1, 0.15 }, [69] = { "fists", 6, 275, 0, "Bare Hands", -1, 0.15 }, [70] = { "breachcharge", 8, 245, 300, "Breach Charge", 3, 0.15 }, [72] = { "tablet", 10, 220, 300, "Tablet", 1, 0.15 }, [74] = { "melee", 6, 250, 0, "Knife", -1, 0.15 }, [75] = { "axe", 6, 250, 0, "Axe", -1, 0.15 }, [76] = { "hammer", 6, 250, 0, "Hammer", -1, 0.15 }, [78] = { "spanner", 6, 250, 0, "Wrench", -1, 0.15 }, [80] = { "knife_ghost", 6, 250, 0, "Spectral Shiv", -1, 0.15 }, [81] = { "firebomb", 7, 245, 400, "Fire Bomb", -1, 0.15 }, [82] = { "diversion", 7, 245, 50, "Diversion Device", -1, 0.15 }, [83] = { "frag_grenade", 7, 245, 300, "Frag Grenade", -1, 0.15 }, [84] = { "snowball", 7, 245, 100, "Snowball", -1, 0.15 }, [500] = { "bayonet", 6, 250, 0, "Bayonet", -1, 0.15 }, [505] = { "knife_flip", 6, 250, 0, "Flip Knife", -1, 0.15 }, [506] = { "knife_gut", 6, 250, 0, "Gut Knife", -1, 0.15 }, [507] = { "knife_karambit", 6, 250, 0, "Karambit", -1, 0.15 }, [508] = { "knife_m9_bayonet", 6, 250, 0, "M9 Bayonet", -1, 0.15 }, [509] = { "knife_tactical", 6, 250, 0, "Huntsman Knife", -1, 0.15 }, [512] = { "knife_falchion", 6, 250, 0, "Falchion Knife", -1, 0.15 }, [514] = { "knife_survival_bowie", 6, 250, 0, "Bowie Knife", -1, 0.15 }, [515] = { "knife_butterfly", 6, 250, 0, "Butterfly Knife", -1, 0.15 }, [516] = { "knife_push", 6, 250, 0, "Shadow Daggers", -1, 0.15 }, [519] = { "knife_ursus", 6, 250, 0, "Ursus Knife", -1, 0.15 }, [520] = { "knife_gypsy_jackknife", 6, 250, 0, "Navaja Knife", -1, 0.15 }, [522] = { "knife_stiletto", 6, 250, 0, "Stiletto Knife", -1, 0.15 }, [523] = { "knife_widowmaker", 6, 250, 0, "Talon Knife", -1, 0.15 }, [1349] = { "spraypaint", 11, 250, 0, "Graffiti", 0, 0 } }, { "secondary", "rifle", "heavy", "smg", "equipment", "melee", "grenade", "c4", "boost", "utility", "spray" }
for b, c in pairs(a.weapons_data) do
    local d, e = ("weapon_" .. c[1]):gsub("weapon_item_", "item_"), a.weapons_data_types[c[2]]
    a[b] = { console_name = d, idx = b, type = e, max_speed = c[3], price = c[4], name = c[5], primary_clip_size = c[6], cycletime = c[7] }
    a.index[d] = a[b]
end ;
local f = entity.get_local_player()
local g = { pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch"), yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"), yaw = { ui.reference("AA", "Anti-aimbot angles", "Yaw") }, yaw_jitter = { ui.reference("AA", "Anti-aimbot angles", "Yaw jitter") }, body_yaw = ui.reference("AA", "Anti-aimbot angles", "Body yaw"), fake_yaw_limit = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit"), edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"), freestanding = ui.reference("AA", "Anti-aimbot angles", "Freestanding"), freestanding_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw") }
local h = { freestanding = ui.get(g.freestanding), freestanding_body_yaw = ui.get(g.freestanding_body_yaw), pitch = ui.get(g.pitch), yaw_base = ui.get(g.yaw_base), yaw = ui.get(g.yaw[1]), yaw_amount = ui.get(g.yaw[2]), yaw_jitter = ui.get(g.yaw_jitter[1]), yaw_jitter_amount = ui.get(g.yaw_jitter[2]), body_yaw = ui.get(g.body_yaw), fake_yaw_limit = ui.get(g.fake_yaw_limit), done = false }
local function i()
    h.freestanding = ui.get(g.freestanding)
    h.freestanding_body_yaw = ui.get(g.freestanding_body_yaw)
    h.pitch = ui.get(g.pitch)
    h.yaw_base = ui.get(g.yaw_base)
    h.yaw = ui.get(g.yaw[1])
    h.yaw_amount = ui.get(g.yaw[2])
    h.yaw_jitter = ui.get(g.yaw_jitter[1])
    h.yaw_jitter_amount = ui.get(g.yaw_jitter[2])
    h.body_yaw = ui.get(g.body_yaw)
    h.fake_yaw_limit = ui.get(g.fake_yaw_limit)
    h.done = true
end;
local function j()
    ui.set(g.freestanding, h.freestanding)
    ui.set(g.freestanding_body_yaw, h.freestanding_body_yaw)
    ui.set(g.pitch, h.pitch)
    ui.set(g.yaw_base, h.yaw_base)
    ui.set(g.yaw[1], h.yaw)
    ui.set(g.yaw[2], h.yaw_amount)
    ui.set(g.yaw_jitter[1], h.yaw_jitter)
    ui.set(g.yaw_jitter[2], h.yaw_jitter_amount)
    ui.set(g.body_yaw, h.body_yaw)
    ui.set(g.fake_yaw_limit, h.fake_yaw_limit)
    h.done = false
end;
local function k()
    if not h.done then
        i()
    end ;
    ui.set(g.freestanding, 'Default')
    ui.set(g.freestanding_body_yaw, true)
    ui.set(g.pitch, "Off")
    ui.set(g.yaw_base, "At Targets")
    ui.set(g.yaw[1], "Off")
    ui.set(g.yaw[2], "0")
    ui.set(g.yaw_jitter[1], "Off")
    ui.set(g.yaw_jitter[2], 19)
    ui.set(g.body_yaw, "Opposite")
    ui.set(g.fake_yaw_limit, 60)
end;
local l = false;
local function m()
    if entity.is_alive(f) == true then
        local n = {}
        local o = entity.get_local_player()
        local p = { client.eye_position() }
        local q = { entity.get_prop(o, "m_vecVelocity") }
        local b = entity.get_prop(entity.get_player_weapon(o), "m_iItemDefinitionIndex")
        local r = a[b].max_speed;
        local s = 64;
        n = { p[1] + q[1] / r * s, p[2] + q[2] / r * s, p[3] + q[3] / r * s }
        for t, u in pairs(entity.get_players(true)) do
            local v = { entity.hitbox_position(u, 0) }
            local w = { entity.hitbox_position(u, 2) }
            local x, y = client.trace_line(o, n[1], n[2], n[3], v[1], v[2], v[3])
            local x, z = client.trace_line(o, n[1], n[2], n[3], w[1], w[2], w[3])
            if y == u or z == u then
                local x, y = client.trace_line(o, p[1], p[2], p[3], v[1], v[2], v[3])
                local x, z = client.trace_line(o, p[1], p[2], p[3], w[1], w[2], w[3])
                if y ~= u and z ~= u then
                    k()
                    l = false
                else
                    l = true
                end
            else
                l = true
            end
        end ;
        client.delay_call(2, function()
            if l then
                j()
            end
        end)
    end
end;
local A = {}
function A.onhandle(B, C)
    if B then
        if C then
            m()
        else
            k()
        end
    elseif h.done then
        j()
    end
end;
return A