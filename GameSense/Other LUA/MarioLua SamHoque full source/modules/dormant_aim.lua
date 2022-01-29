local eye_position, camera_angles, visible, trace_line = client.eye_position, client.camera_angles, client.visible, client.trace_line
local text, world_to_screen = renderer.text, renderer.world_to_screen
local get_prop, get_all, get_local_player = entity.get_prop, entity.get_all, entity.get_local_player
local deg, atan2, sqrt = math.deg, math.atan2, math.sqrt
local get = ui.get
local ffi = require("ffi")
local vector = require("vector")

local class_ptr = ffi.typeof("void***")
local rawiventitylist = client.create_interface("client_panorama.dll", "VClientEntityList003") or error("VClientEntityList003 wasnt found", 2)
local iventitylist = ffi.cast(class_ptr, rawiventitylist) or error("rawivmodelinfo is nil", 2)
local get_client_entity = ffi.cast("get_client_entity_t", iventitylist[0][3]) or error("get_model_info is nil", 2)
local get_highest_entity_by_index = ffi.cast("get_highest_entity_by_index_t", iventitylist[0][6]) or error("get_highest_entity_by_index is nil", 2)
local screenx, screeny = client.screen_size()

local ref = {
    silentaim = ui.reference('RAGE', 'Aimbot', 'Silent aim'),
    hitchance = ui.reference('RAGE', 'Aimbot', 'Minimum hit chance'),
    min_dmg = ui.reference('RAGE', 'Aimbot', 'Minimum damage'),
    force_baim_key = ui.reference('RAGE', 'Other', 'Force body aim'),
    aimbot_enabled = { ui.reference('RAGE', 'Aimbot', 'Enabled') },
    rage_fov = ui.reference('RAGE', 'Aimbot', 'Maximum FOV'),
}

local function GetBoneMatrix(ent, bone)
    if ent == nil then
        return
    end
    local player_ptr = ffi.cast("void***", get_client_entity(iventitylist, ent))
    local bone_matrix_ptr = ffi.cast("char*", player_ptr) + 0x26A8
    local entity_bones = ffi.cast("struct t_bone_matrix_mariolua**", bone_matrix_ptr)[0][bone]
    return entity_bones
end

local function get_weapon_info()
    local local_player = entity.get_local_player()
    local my_weapon = entity.get_player_weapon(local_player)
    local rawent = ffi.cast("void***", get_client_entity(iventitylist, my_weapon))
    local ent = ffi.cast(class_ptr, rawent)
    local get_wep_info = ffi.cast("struct c_weapon_info_t_mariolua_da**", ent[0])[460]
    if ent ~= nil and my_weapon ~= nil then
        return get_wep_info
    end
end

local function Vector2(x, y)
    return { x = x, y = y };
end

local hitboxes_num2text = {
    [0] = 'Head',
    [1] = 'Neck',
    [2] = 'Pelvis',
    [3] = 'Spine 4',
    [4] = 'Spine 3',
    [5] = 'Spine 2',
    [6] = 'Spine 1',
    [7] = 'Leg Upper L',
    [8] = 'Leg Upper R',
    [9] = 'Leg Lower L',
    [10] = 'Leg Lower R',
    [11] = 'Foot L',
    [12] = 'Foot R',
    [13] = 'Hand L',
    [14] = 'Hand R',
    [15] = 'Arm Upper L',
    [16] = 'Arm Upper R',
    [17] = 'Arm Lower L',
    [18] = 'Arm Lower R',
}

local hitboxes_num2text_2 = {
    [0] = 'Head',
    [1] = 'Neck',
    [2] = 'Pelvis',
    [3] = 'Stomach',
    [4] = 'Chest',
    [5] = 'Upper chest',
    [6] = 'Shoulders',
    [7] = 'Left thigh',
    [8] = 'Right thigh',
    [9] = 'Left leg',
    [10] = 'Right leg',
    [11] = 'Left foot',
    [12] = 'Right foot',
    [13] = 'Left hand',
    [14] = 'Right hand',
    [15] = 'Left arm',
    [16] = 'Right arm',
    [17] = 'Left forearm',
    [18] = 'Right forearm'
}

local hitboxes_text2num = {
    ['Head'] = 0,
    ['Neck'] = 1,
    ['Pelvis'] = 2,
    ['Spine 4'] = 3,
    ['Spine 3'] = 4,
    ['Spine 2'] = 5,
    ['Spine 1'] = 6,
    ['Leg Upper L'] = 7,
    ['Leg Upper R'] = 8,
    ['Leg Lower L'] = 9,
    ['Leg Lower R'] = 10,
    ['Foot L'] = 11,
    ['Foot R'] = 12,
    ['Hand L'] = 13,
    ['Hand R'] = 14,
    ['Arm Upper L'] = 15,
    ['Arm Upper R'] = 16,
    ['Arm Lower L'] = 17,
    ['Arm Lower R'] = 18
}

local hitboxes_text2num_2 = {
    ['Head'] = 0,
    ['Neck'] = 1,
    ['Pelvis'] = 2,
    ['Stomach'] = 3,
    ['Chest'] = 4,
    ['Upper chest'] = 5,
    ['Shoulders'] = 6,
    ['Left thigh'] = 7,
    ['Right thigh'] = 8,
    ['Left leg'] = 9,
    ['Right leg'] = 10,
    ['Left foot'] = 11,
    ['Right foot'] = 12,
    ['Left hand'] = 13,
    ['Right hand'] = 14,
    ['Left arm'] = 15,
    ['Right arm'] = 16,
    ['Left forearm'] = 17,
    ['Right forearm'] = 18
}
local hitgroups = {
    [0] = "body",
    "head",
    "chest",
    "stomach",
    "left arm",
    "right arm",
    "left leg",
    "right leg",
    "neck",
    "?",
    "gear"
}
local hitgroup_data = {
    ['Head'] = 1,
    ['Neck'] = 8,
    ['Pelvis'] = 2,
    ['Spine 4'] = 3,
    ['Spine 3'] = 3,
    ['Spine 2'] = 3,
    ['Spine 1'] = 3,
    ['Leg Upper L'] = 6,
    ['Leg Upper R'] = 7,
    ['Leg Lower L'] = 6,
    ['Leg Lower R'] = 7,
    ['Foot L'] = 6,
    ['Foot R'] = 7,
    ['Hand L'] = 4,
    ['Hand R'] = 5,
    ['Arm Upper L'] = 4,
    ['Arm Upper R'] = 5,
    ['Arm Lower L'] = 4,
    ['Arm Lower R'] = 5
}

--[[
local a = {
    'Head',
    'Neck',
    'Pelvis',
    'Spine 4',
    'Spine 3',
    'Spine 2',
    'Spine 1',
    'Leg Upper L',
    'Leg Upper R',
    'Leg Lower L',
    'Leg Lower R',
    'Foot L',
    'Foot R',
    'Hand L',
    'Hand R',
    'Arm Upper L',
    'Arm Upper R',
    'Arm Lower L',
    'Arm Lower R'
}

local bone_by_hitbox = {
	'Head' = {8},
	'Neck' = {2},
	'Pelvis' = {76, 69},
	'Spine 4' = {8, 9},
	'Spine 3' = {6, 7},
	'Spine 2' = {4, 5},
	'Spine 1' = {0, 3},
	'Leg Upper L' = {74, 75},
	'Leg Upper R' = {81, 82},
	'Leg Lower L' = {70},
	'Leg Lower R' = {77},
	'Foot L' = {72, 73, 71},
	'Foot R' = {79, 80, 78},
	'Hand L' = {},
	'Hand R' = {},
	'Arm Upper L' = {38, 37},
	'Arm Upper R' = {40, 66},
	'Arm Lower L' = {37, 12, 35},
	'Arm Lower R' = {41, 64},
}
]]
local CubeOutlineConnections = { { 1, 2 }, { 1, 3 }, { 1, 5 }, { 8, 7 }, { 8, 6 }, { 8, 4 }, { 6, 3 }, { 4, 3 }, { 4, 2 }, { 2, 7 }, { 7, 5 }, { 6, 5 } };
local CubeFillConnections = { { 1, 2, 3 }, { 1, 2, 5 }, { 1, 3, 5 }, { 8, 7, 6 }, { 8, 7, 4 }, { 8, 6, 4 }, { 3, 6, 5 }, { 3, 4, 6 }, { 2, 4, 7 }, { 2, 7, 5 }, { 3, 4, 2 }, { 6, 5, 7 } };

local function drawCubeAtPoint(size, vec, r, g, b, alphaOutline, alphaFill)
    local points = {};
    if vec[1] == nil then
        return
    end
    table.insert(points, Vector2(world_to_screen(vec[1] - size, vec[2] - size, vec[3] - size)));
    table.insert(points, Vector2(world_to_screen(vec[1] - size, vec[2] + size, vec[3] - size)));
    table.insert(points, Vector2(world_to_screen(vec[1] + size, vec[2] - size, vec[3] - size)));
    table.insert(points, Vector2(world_to_screen(vec[1] + size, vec[2] + size, vec[3] - size)));
    table.insert(points, Vector2(world_to_screen(vec[1] - size, vec[2] - size, vec[3] + size)));
    table.insert(points, Vector2(world_to_screen(vec[1] + size, vec[2] - size, vec[3] + size)));
    table.insert(points, Vector2(world_to_screen(vec[1] - size, vec[2] + size, vec[3] + size)));
    table.insert(points, Vector2(world_to_screen(vec[1] + size, vec[2] + size, vec[3] + size)));

    for i = 1, #CubeOutlineConnections do
        local p1 = points[CubeOutlineConnections[i][1]];
        local p2 = points[CubeOutlineConnections[i][2]];

        if p1.x and p1.y and p2.x and p2.y then
            renderer.line(p1.x, p1.y, p2.x, p2.y, r, g, b, alphaOutline);
        end
    end

    for i = 1, #CubeFillConnections do
        local p1 = points[CubeFillConnections[i][1]];
        local p2 = points[CubeFillConnections[i][2]];
        local p3 = points[CubeFillConnections[i][3]];

        if p1.x and p1.y and p2.x and p2.y and p3.x and p3.y then
            renderer.triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, r, g, b, alphaFill);
        end

    end
end

local function get_eye_pos(ent)
    local x, y, z = entity.get_prop(ent, "m_vecOrigin")
    local hx, hy, hz = entity.hitbox_position(ent, 0)
    return x, y, hz
end

local function normalize_yaw(yaw)
    while yaw > 180 do
        yaw = yaw - 360
    end
    while yaw < -180 do
        yaw = yaw + 360
    end
    return yaw
end

local function calc_angle(xdelta, ydelta)
    if xdelta == 0 and ydelta == 0 then
        return 0
    end
    return math.deg(math.atan2(ydelta, xdelta))
end

local function deg_to_rad(val)
    return val * (math.pi / 180.)
end

local function vector_to_angles(forward, angles)
    if forward[1] == 0 and forward[2] == 0 then
        if forward[3] > 0 then
            angles[1] = -90
        else
            angles[1] = 90
        end
        angles[2] = 0
    else
        angles[1] = math.atan2(-forward[3], math.sqrt(forward[1] * forward[1] + forward[2] * forward[2])) * (180 / math.pi)
        angles[2] = math.atan2(forward[2], forward[1]) * (180 / math.pi)
    end

    angles[3] = 0
end

local function angle_to_vector(angles, forward)
    local sp = math.sin(deg_to_rad(angles[1]))
    local cp = math.cos(deg_to_rad(angles[1]))
    local sy = math.sin(deg_to_rad(angles[2]))
    local cy = math.cos(deg_to_rad(angles[2]))

    forward[1] = cp * cy
    forward[2] = cp * sy
    forward[3] = -sp
end

local function vector_angles(x1, y1, z1, x2, y2, z2)
    local origin_x, origin_y, origin_z
    local target_x, target_y, target_z
    if x2 == nil then
        target_x, target_y, target_z = x1, y1, z1
        origin = { entity.get_origin(entity.get_local_player()) }
        origin_x, origin_y, origin_z = client.eye_position()
        if origin_x == nil then
            return
        end
    else
        origin[1], origin[2], origin_z = x1, y1, z1
        target_x, target_y, target_z = x2, y2, z2
    end

    local delta_x, delta_y, delta_z = target_x - origin[1], target_y - origin[2], target_z - origin_z

    if delta_x == 0 and delta_y == 0 then
        return (delta_z > 0 and 270 or 90), 0
    else

        local yaw = deg(atan2(delta_y, delta_x))

        local hyp = sqrt(delta_x * delta_x + delta_y * delta_y)
        local pitch = deg(atan2(-delta_z, hyp))

        return pitch, yaw
    end
end

local function containedWithin(self, min, max)
    return (
            self.x >= min.x and self.x <= max.x
                    and self.y >= min.y and self.y <= max.y
                    and self.z >= min.z and self.z <= max.z
    )
end

local function get_dist(a_x, a_y, a_z, b_x, b_y, b_z)
    return math.sqrt(math.pow(a_x - b_x, 2) + math.pow(a_y - b_y, 2) + math.pow(a_z - b_z, 2))
end

local data = {}
local dormant_players = {}
local cur_target, cur_hitbox, cur_hitpos, cur_origin = nil, nil, nil, nil
local dormant_aim = { is_enabled = false, is_key = false }

dormant_aim.hitchance = 80
dormant_aim.dmg = 1
dormant_aim.baim = false
dormant_aim.quickstop = false
dormant_aim.is_scoped = false
dormant_aim.chat_print = nil
dormant_aim.log = nil

local spread = nil
local innaccuracy = nil
--[[
local hitgroup_data = {
    {8, }, --head/neck
    {5, 7, 9, 10, 11, 12, 26, 27, 28, 29, 30, 35, 37, 38, 39, 40, 45, 51, 54, 57, 60, 81, 83, }, --pelvis
{70}, --spine 2
    {3, 4}, --spine 4
    {15, 16}, --left arm
    {17, 18}, --right arm
    {7, 9, 11}, --left leg
    {8, 10, 12}, --right leg
    {1}, --neck
}
local bone_by_hitbox = {
	'Head' = {8},
	'Neck' = {2},
	'Pelvis' = {76, 69},
	'Spine 4' = {8, 9},
	'Spine 3' = {6, 7},
	'Spine 2' = {4, 5},
	'Spine 1' = {0, 3},
	'Leg Upper L' = {74, 75},
	'Leg Upper R' = {81, 82},
	'Leg Lower L' = {70},
	'Leg Lower R' = {77},
	'Foot L' = {72, 73, 71},
	'Foot R' = {79, 80, 78},
	'Hand L' = {},
	'Hand R' = {},
	'Arm Upper L' = {38, 37},
	'Arm Upper R' = {40, 66},
	'Arm Lower L' = {37, 12, 35},
	'Arm Lower R' = {41, 64},
}]]
local static_bone_diff = {
    [0] = { 1.9041290283203, -4.0820922851563, 39.17724609375 },
    [1] = { 0, 0, 0 },
    [2] = { 0, 0, 64 },
    [3] = { 1.8925170898438, -4.0455322265625, 40.114990234375 },
    [4] = { 1.3436737060547, -3.8780517578125, 44.040405273438 },
    [5] = { 0.45321655273438, -3.6017456054688, 48.686157226563 },
    [6] = { -1.6023406982422, -3.1251220703125, 54.697875976563 },
    [7] = { -3.9714813232422, -2.4916381835938, 60.04345703125 },
    [8] = { -8.9597473144531, -0.7755126953125, 63.571655273438 },
    [9] = { -6.2765502929688, -2.228515625, 57.263671875 },
    [10] = { -8.5975952148438, -8.45458984375, 56.73779296875 },
    [11] = { -17.047943115234, -9.926025390625, 48.933349609375 },
    [12] = { -26.831146240234, -4.3116455078125, 51.105346679688 },
    [13] = { -27.604125976563, -3.989990234375, 51.1533203125 },
    [14] = { -30.001541137695, -1.8004150390625, 50.808227539063 },
    [15] = { -30.75471496582, -0.6864013671875, 52.389404296875 },
    [16] = { -30.389694213867, -0.68341064453125, 53.7548828125 },
    [17] = { -26.667938232422, -3.1803588867188, 51.037963867188 },
    [18] = { -28.277465820313, -1.009033203125, 51.1435546875 },
    [19] = { -28.79621887207, -0.43841552734375, 52.443115234375 },
    [20] = { -28.721481323242, -0.5091552734375, 53.309692382813 },
    [21] = { -27.970016479492, -4.4664306640625, 51.469970703125 },
    [22] = { -30.700454711914, -2.654052734375, 51.17578125 },
    [23] = { -31.768188476563, -1.1522216796875, 51.942138671875 },
    [24] = { -31.430389404297, -1.1112060546875, 53.164672851563 },
    [25] = { -28.6337890625, -4.40576171875, 51.997436523438 },
    [26] = { -30.140960693359, -3.8662719726563, 52.566162109375 },
    [27] = { -31.669616699219, -3.79150390625, 52.899291992188 },
    [28] = { -27.141326904297, -3.5491333007813, 51.077758789063 },
    [29] = { -29.072830200195, -1.2791748046875, 50.8701171875 },
    [30] = { -29.837524414063, -0.41094970703125, 52.390991210938 },
    [31] = { -29.473205566406, -0.5369873046875, 53.6123046875 },
    [32] = { -28.744369506836, -2.2042236328125, 52.123413085938 },
    [33] = { -22.53225708008, -3.31103515625, 51.0311279297 },
    [34] = { -23.570098876953, -6.18310546875, 50.38134765625 },
    [35] = { -22.53225708008, -8.31103515625, 52.0311279297 },
    [36] = { -14.231170654297, -9.435546875, 51.534790039063 },
    [37] = { -4.9994812011719, -0.053466796875, 57.571899414063 },
    [38] = { -0.61593627929688, 4.0628662109375, 59.200805664063 },
    [39] = { -6.6939086914063, 8.2703857421875, 50.265625 },
    [40] = { -15.757949829102, 2.250244140625, 53.946899414063 },
    [41] = { -16.571441650391, 2.0519409179688, 53.992553710938 },
    [42] = { -19.651489257813, 1.6438598632813, 52.98876953125 },
    [43] = { -20.242111206055, -0.22247314453125, 52.29833984375 },
    [44] = { -19.145584106445, -0.91070556640625, 52.865478515625 },
    [45] = { -16.064498901367, 2.0748291015625, 52.857788085938 },
    [46] = { -18.344055175781, 1.5416870117188, 51.502807617188 },
    [47] = { -19.165008544922, 0.39569091796875, 50.958618164063 },
    [48] = { -18.610000610352, -0.21820068359375, 51.235473632813 },
    [49] = { -16.656585693359, 1.8163452148438, 54.623779296875 },
    [50] = { -19.867584228516, 1.3300170898438, 54.09521484375 },
    [51] = { -21.709594726563, 0.69183349609375, 53.66796875 },
    [52] = { -21.780090332031, -0.57373046875, 53.72900390625 },
    [53] = { -17.195907592773, 1.1532592773438, 54.7763671875 },
    [54] = { -18.280303955078, -0.1522216796875, 54.70068359375 },
    [55] = { -19.578857421875, -0.88427734375, 54.219848632813 },
    [56] = { -16.340087890625, 2.0719604492188, 53.392211914063 },
    [57] = { -19.005783081055, 1.56005859375, 52.143676757813 },
    [58] = { -19.783233642578, -0.0611572265625, 51.496459960938 },
    [59] = { -18.795486450195, -0.6041259765625, 52.1044921875 },
    [60] = { -18.115203857422, 0.59002685546875, 53.038452148438 },
    [61] = { -14.53225708008, -0.31103515625, 51.0311279297 },
    [62] = { -12.736618041992, 4.2569580078125, 52.719848632813 },
    [63] = { -10.53225708008, -0.31103515625, 53.0311279297 },
    [64] = { -4.6679077148438, 6.8678588867188, 53.244018554688 },
    [65] = { -0.88067626953125, -6.9180297851563, 35.584594726563 },
    [66] = { -10.017532348633, -10.058715820313, 20.512451171875 },
    [67] = { -9.3116302490234, -13.483825683594, 3.940185546875 },
    [68] = { -14.599166870117, -11.785217285156, 0.903564453125 },
    [69] = { -14.595626831055, -11.774597167969, 1.9034423828125 },
    [70] = { -3.9263000488281, -7.9649047851563, 30.560546875 },
    [71] = { -6.9719085693359, -9.0118408203125, 25.536499023438 },
    [72] = { 2.5196380615234, -0.36199951171875, 35.370971679688 },
    [73] = { 3.6542053222656, 6.342041015625, 18.809448242188 },
    [74] = { 11.520294189453, 3.5110473632813, 4.0792236328125 },
    [75] = { 9.7046203613281, 8.7596435546875, 1.042724609375 },
    [76] = { 9.7151336669922, 8.763427734375, 0.0428466796875 },
    [77] = { 2.8978271484375, 1.8726806640625, 29.850463867188 },
    [78] = { 3.2760162353516, 4.1073608398438, 24.329956054688 },
    [79] = { -28.708404541016, -0.55755615234375, 53.927001953125 },
    [80] = { -32.950561523438, -3.8135986328125, 53.087036132813 },
    [81] = { -18.086486816406, -0.03216552734375, 51.509155273438 },
    [82] = { -20.595764160156, -0.7064208984375, 53.438110351563 },
    [83] = { -22.514785766602, -1.3250122070313, 54.848266601563 },
    [84] = { -27.622665405273, -3.7006225585938, 51.09423828125 },
    [85] = { 7.2267761230469, -3.2958984375, 52.885620117188 },
    ['Head'] = { 4.5104370117188, 1.4808959960938, -66.252807617188 },
    ['Neck'] = { 1.6431274414063, 1.9418334960938, -60.824340820313 },
    ['Pelvis'] = { 0.0924072265625, 3.5492553710938, -35.892211914063 },
    ['Spine 4'] = { -0.2325439453125, 3.7332763671875, -40.685668945313 },
    ['Spine 3'] = { 0.37542724609375, 3.7618408203125, -47.163452148438 },
    ['Spine 2'] = { 0.27252197265625, 3.4548950195313, -52.815551757813 },
    ['Spine 1'] = { 0.13671875, 2.9594116210938, -57.254516601563 },
    ['Leg Upper L'] = { 7.5762329101563, 6.9656372070313, -27.895385742188 },
    ['Leg Upper R'] = { -1.1968383789063, -3.58837890625, -26.8837890625 },
    ['Leg Lower L'] = { 13.312927246094, 8.6845092773438, -12.410888671875 },
    ['Leg Lower R'] = { -4.8951416015625, -6.3407592773438, -11.160522460938 },
    ['Foot L'] = { 15.509704589844, 9.2199096679688, -0.3936767578125 },
    ['Foot R'] = { -8.0435180664063, -6.7333374023438, -0.314697265625 },
    ['Hand L'] = { 20.000915527344, 1.703125, -49.399291992188 },
    ['Hand R'] = { 19.825622558594, -1.3427734375, -50.221435546875 },
    ['Arm Upper L'] = { 6.341064453125, 9.3564453125, -53.569458007813 },
    ['Arm Lower L'] = { 13.943420410156, 6.078125, -49.270385742188 },
    ['Arm Upper R'] = { 4.067626953125, -6.1356201171875, -54.609130859375 },
    ['Arm Lower R'] = { 12.701782226563, -4.63525390625, -50.216918945313 },
}
local bones = {
    [0] = {
        szName = 'pelvis',
        vPos = vector(0.000000, 42.824833, -2.853551),
    },
    [1] = {
        szName = 'lean_root',
        vPos = vector(0.000000, 0.000000, 0.000000),
    },
    [2] = {
        szName = 'cam_driver',
        vPos = vector(0.000000, 0.000000, 64.000000),
    },
    [3] = {
        szName = 'spine_0',
        vPos = vector(0.934204, 0.090506, 0.000000),
        hasHitbox = 1,
        hitboxId = 4,
        vBBMin = vector(1.400000, 0.800000, 3.100000),
        vBBMax = vector(1.400000, 0.800000, -3.100000),
    },
    [4] = {
        szName = 'spine_1',
        vPos = vector(4.066376, 0.000001, -0.000000),
        hasHitbox = 1,
        hitboxId = 5,
        vBBMin = vector(3.800000, 0.800000, -2.400000),
        vBBMax = vector(3.800000, 0.400000, 2.400000),
    },
    [5] = {
        szName = 'spine_2',
        vPos = vector(4.744072, 0.000000, 0.000000),
        hasHitbox = 1,
        hitboxId = 6,
        vBBMin = vector(4.800000, 0.150000, -4.100000),
        vBBMax = vector(4.800000, 0.150000, 4.100000),
    },
    [6] = {
        szName = 'spine_3',
        vPos = vector(6.347771, 0.000001, 0.000000),
        hasHitbox = 1,
        hitboxId = 7,
        vBBMin = vector(2.500000, -0.600000, -6.000000),
        vBBMax = vector(2.500000, -0.600000, 6.000000),
    },
    [7] = {
        szName = 'neck_0',
        vPos = vector(6.515205, -0.000016, 0.000000),
        hasHitbox = 1,
        hitboxId = 1,
        vBBMin = vector(-0.300000, -2.000000, -2.100000),
        vBBMax = vector(4.200000, 2.200000, 2.100000),
        hitboxId = 2,
        vBBMin = vector(-1.300000, -0.200000, 0.000000),
        vBBMax = vector(1.400000, 0.600000, 0.000000),
    },
    [8] = {
        szName = 'head_0',
        vPos = vector(5.762157, 0.000002, 0.000000),
        hasHitbox = 1,
        hitboxId = 0,
        vBBMin = vector(-0.400000, 1.200000, 0.100000),
        vBBMax = vector(2.800000, 0.000000, 0.200000),
    },
    [9] = {
        szName = 'clavicle_L',
        vPos = vector(4.311546, 3.005295, 1.270492),
        hasHitbox = 1,
    },
    [10] = {
        szName = 'arm_upper_L',
        vPos = vector(6.665433, 0.000000, 0.000004),
        hasHitbox = 1,
        hitboxId = 16,
        vBBMin = vector(0.000000, 0.000000, 0.000000),
        vBBMax = vector(11.200000, 0.000000, 0.000000),
    },
    [11] = {
        szName = 'arm_lower_L',
        vPos = vector(11.596664, 0.000000, 0.000000),
        hasHitbox = 1,
        hitboxId = 17,
        vBBMin = vector(0.000000, 0.000000, 0.000000),
        vBBMax = vector(10.000000, 0.000000, 0.000000),
    },
    [12] = {
        szName = 'hand_L',
        vPos = vector(11.486961, 0.000000, 0.000004),
        hasHitbox = 1,
        hitboxId = 14,
        vBBMin = vector(-2.000000, -2.000000, -2.000000),
        vBBMax = vector(4.600000, 2.000000, 2.000000),
    },
    [13] = {
        szName = 'finger_middle_meta_L',
        vPos = vector(0.807840, 0.015438, -0.224508),
    },
    [14] = {
        szName = 'finger_middle_0_L',
        vPos = vector(3.265087, 0.000000, 0.000000),
    },
    [15] = {
        szName = 'finger_middle_1_L',
        vPos = vector(2.075735, 0.000000, 0.000000),
    },
    [16] = {
        szName = 'finger_middle_2_L',
        vPos = vector(1.413418, 0.000000, 0.000000),
    },
    [17] = {
        szName = 'finger_pinky_meta_L',
        vPos = vector(0.562845, 0.124912, 0.989240),
    },
    [18] = {
        szName = 'finger_pinky_0_L',
        vPos = vector(2.704884, -0.000004, 0.000000),
    },
    [19] = {
        szName = 'finger_pinky_1_L',
        vPos = vector(1.511129, 0.000000, 0.000000),
    },
    [20] = {
        szName = 'finger_pinky_2_L',
        vPos = vector(0.872662, 0.000002, 0.000000),
    },
    [21] = {
        szName = 'finger_index_meta_L',
        vPos = vector(0.802782, 0.214901, -0.873659),
    },
    [22] = {
        szName = 'finger_index_0_L',
        vPos = vector(3.290380, -0.000004, -0.000001),
    },
    [23] = {
        szName = 'finger_index_1_L',
        vPos = vector(1.995686, 0.000002, 0.000000),
    },
    [24] = {
        szName = 'finger_index_2_L',
        vPos = vector(1.269020, 0.000000, 0.000000),
    },
    [25] = {
        szName = 'finger_thumb_0_L',
        vPos = vector(1.423075, 0.741585, -1.176400),
    },
    [26] = {
        szName = 'finger_thumb_1_L',
        vPos = vector(1.698864, 0.000000, -0.000002),
    },
    [27] = {
        szName = 'finger_thumb_2_L',
        vPos = vector(1.566338, -0.000001, 0.000000),
    },
    [28] = {
        szName = 'finger_ring_meta_L',
        vPos = vector(0.711737, 0.057610, 0.410458),
    },
    [29] = {
        szName = 'finger_ring_0_L',
        vPos = vector(2.987719, 0.000000, 0.000001),
    },
    [30] = {
        szName = 'finger_ring_1_L',
        vPos = vector(1.910931, 0.000002, 0.000000),
    },
    [31] = {
        szName = 'finger_ring_2_L',
        vPos = vector(1.280708, 0.000000, -0.000000),
    },
    [32] = {
        szName = 'weapon_hand_L',
        vPos = vector(2.790777, 1.123611, 0.295327),
    },
    [33] = {
        szName = 'arm_lower_L_TWIST',
        vPos = vector(3.828987, 0.000000, 0.000000),
    },
    [34] = {
        szName = 'arm_lower_L_TWIST1',
        vPos = vector(7.657978, -0.000001, 0.000004),
    },
    [35] = {
        szName = 'arm_upper_L_TWIST',
        vPos = vector(3.865551, 0.000000, 0.000000),
    },
    [36] = {
        szName = 'arm_upper_L_TWIST1',
        vPos = vector(7.731106, 0.000004, -0.000004),
    },
    [37] = {
        szName = 'clavicle_R',
        vPos = vector(4.311554, 3.005294, -1.270490),
        hasHitbox = 1,
    },
    [38] = {
        szName = 'arm_upper_R',
        vPos = vector(-6.665439, -0.000003, 0.000000),
        hasHitbox = 1,
        hitboxId = 18,
        vBBMin = vector(0.000000, 0.000000, 0.000000),
        vBBMax = vector(11.200000, 0.000000, 0.000000),
    },
    [39] = {
        szName = 'arm_lower_R',
        vPos = vector(11.596653, -0.000001, -0.000004),
        hasHitbox = 1,
        hitboxId = 19,
        vBBMin = vector(0.000000, 0.000000, 0.000000),
        vBBMax = vector(10.000000, 0.000000, 0.000000),
    },
    [40] = {
        szName = 'hand_R',
        vPos = vector(11.486988, 0.000000, 0.000000),
        hasHitbox = 1,
        hitboxId = 15,
        vBBMin = vector(-5.000000, -2.000000, -2.000000),
        vBBMax = vector(2.000000, 2.000000, 2.000000),
    },
    [41] = {
        szName = 'finger_middle_meta_R',
        vPos = vector(-0.807777, -0.015434, 0.224528),
    },
    [42] = {
        szName = 'finger_middle_0_R',
        vPos = vector(-3.265091, -0.000004, 0.000000),
    },
    [43] = {
        szName = 'finger_middle_1_R',
        vPos = vector(-2.075773, 0.000038, -0.000016),
    },
    [44] = {
        szName = 'finger_middle_2_R',
        vPos = vector(-1.413406, 0.000010, -0.000002),
    },
    [45] = {
        szName = 'finger_pinky_meta_R',
        vPos = vector(-0.562847, -0.124886, -0.989244),
    },
    [46] = {
        szName = 'finger_pinky_0_R',
        vPos = vector(-2.704912, 0.000000, -0.000000),
    },
    [47] = {
        szName = 'finger_pinky_1_R',
        vPos = vector(-1.511091, -0.000019, -0.000010),
    },
    [48] = {
        szName = 'finger_pinky_2_R',
        vPos = vector(-0.872673, -0.000021, 0.000007),
    },
    [49] = {
        szName = 'finger_index_meta_R',
        vPos = vector(-0.802748, -0.214920, 0.873668),
    },
    [50] = {
        szName = 'finger_index_0_R',
        vPos = vector(-3.290361, 0.000015, 0.000001),
    },
    [51] = {
        szName = 'finger_index_1_R',
        vPos = vector(-1.995720, 0.000071, -0.000042),
    },
    [52] = {
        szName = 'finger_index_2_R',
        vPos = vector(-1.268997, -0.000080, 0.000055),
    },
    [53] = {
        szName = 'finger_thumb_0_R',
        vPos = vector(-1.423063, -0.741623, 1.176404),
    },
    [54] = {
        szName = 'finger_thumb_1_R',
        vPos = vector(-1.698803, 0.000021, -0.000076),
    },
    [55] = {
        szName = 'finger_thumb_2_R',
        vPos = vector(-1.566319, 0.000017, 0.000044),
    },
    [56] = {
        szName = 'finger_ring_meta_R',
        vPos = vector(-0.711681, -0.057610, -0.410446),
    },
    [57] = {
        szName = 'finger_ring_0_R',
        vPos = vector(-2.987785, 0.000034, -0.000009),
    },
    [58] = {
        szName = 'finger_ring_1_R',
        vPos = vector(-1.910934, -0.000069, 0.000009),
    },
    [59] = {
        szName = 'finger_ring_2_R',
        vPos = vector(-1.280689, 0.000076, -0.000006),
    },
    [60] = {
        szName = 'weapon_hand_R',
        vPos = vector(-2.790766, -1.123657, -0.295324),
    },
    [61] = {
        szName = 'arm_lower_R_TWIST',
        vPos = vector(3.828993, 0.000004, 0.000000),
    },
    [62] = {
        szName = 'arm_lower_R_TWIST1',
        vPos = vector(7.658005, 0.000004, 0.000000),
    },
    [63] = {
        szName = 'arm_upper_R_TWIST',
        vPos = vector(3.865551, -0.000001, -0.000004),
    },
    [64] = {
        szName = 'arm_upper_R_TWIST1',
        vPos = vector(7.731098, -0.000005, -0.000004),
    },
    [65] = {
        szName = 'leg_upper_L',
        vPos = vector(-3.771385, 0.913481, 3.694230),
        hasHitbox = 1,
        hitboxId = 8,
        vBBMin = vector(1.300000, 0.000000, 0.000000),
        vBBMax = vector(16.500000, 0.000000, 0.000000),
    },
    [66] = {
        szName = 'leg_lower_L',
        vPos = vector(17.902943, 0.000000, 0.000000),
        hasHitbox = 1,
        hitboxId = 10,
        vBBMin = vector(0.100000, 0.000000, 0.200000),
        vBBMax = vector(17.000000, -0.400000, 0.700000),
    },
    [67] = {
        szName = 'ankle_L',
        vPos = vector(16.937239, 0.000000, 0.000000),
        hasHitbox = 1,
        hitboxId = 12,
        vBBMin = vector(-2.500000, -3.800000, -2.800000),
        vBBMax = vector(10.400000, -0.200000, 2.000000),
    },
    [68] = {
        szName = 'ball_L',
        vPos = vector(6.329626, 0.000000, -0.000000),
    },
    [69] = {
        szName = 'lfoot_lock',
        vPos = vector(0.000000, 0.000000, -0.000000),
    },
    [70] = {
        szName = 'leg_upper_L_TWIST',
        vPos = vector(5.967648, 0.000002, 0.000000),
    },
    [71] = {
        szName = 'leg_upper_L_TWIST1',
        vPos = vector(11.935295, 0.000002, 0.000000),
    },
    [72] = {
        szName = 'leg_upper_R',
        vPos = vector(-3.771431, 0.913481, -3.694230),
        hasHitbox = 1,
        hitboxId = 9,
        vBBMin = vector(1.300000, 0.000000, 0.000000),
        vBBMax = vector(16.500000, 0.000000, 0.700000),
    },
    [73] = {
        szName = 'leg_lower_R',
        vPos = vector(17.902935, 0.000000, -0.000000),
        hasHitbox = 1,
        hitboxId = 11,
        vBBMin = vector(0.100000, 0.000000, 0.200000),
        vBBMax = vector(17.000000, -0.400000, 0.700000),
    },
    [74] = {
        szName = 'ankle_R',
        vPos = vector(16.937189, 0.000000, 0.000000),
        hasHitbox = 1,
        hitboxId = 13,
        vBBMin = vector(-10.400000, 0.300000, -2.000000),
        vBBMax = vector(2.600000, 4.000000, 2.800000),
    },
    [75] = {
        szName = 'ball_R',
        vPos = vector(-6.329633, -0.000002, 0.000003),
    },
    [76] = {
        szName = 'rfoot_lock',
        vPos = vector(0.000000, 0.000000, 0.000000),
    },
    [77] = {
        szName = 'leg_upper_R_TWIST',
        vPos = vector(5.967651, 0.000000, -0.000000),
    },
    [78] = {
        szName = 'leg_upper_R_TWIST1',
        vPos = vector(11.935297, -0.000001, -0.000000),
    },
    [79] = {
        szName = 'finger_pinky_L_END',
        vPos = vector(0.619389, 0.000002, 0.000000),
    },
    [80] = {
        szName = 'finger_thumb_L_END',
        vPos = vector(1.294838, 0.000000, 0.000000),
    },
    [81] = {
        szName = 'finger_pinky_R_END',
        vPos = vector(-0.619343, -0.000025, -0.000013),
    },
    [82] = {
        szName = 'finger_thumb_R_END',
        vPos = vector(-1.294922, -0.000015, -0.000044),
    },
    [83] = {
        szName = 'ValveBiped.weapon_bone',
        vPos = vector(-7.000002, -2.000004, 2.500001),
    },
    [84] = {
        szName = 'lh_ik_driver',
        vPos = vector(0.000002, 0.000000, 0.000000),
    },
    [85] = {
        szName = 'primary_jiggle_jnt',
        vPos = vector(1.800003, -6.600000, -4.099999),
    },
    [86] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Head'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Neck'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Pelvis'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Spine 4'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Spine 3'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Spine 2'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Spine 1'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Leg Upper L'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Leg Upper R'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Leg Lower L'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Leg Lower R'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Foot L'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Foot R'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Hand L'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Hand R'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Arm Upper L'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Arm Upper R'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Arm Lower L'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
    ['Arm Lower R'] = {
        szName = '',
        vPos = vector(0.000000, 0.785398, 0.000000),
    },
}
local function reset_enemy_data(ent)
    if ent == nil then
        return
    end
    data[ent] = {}
    data[ent]['is_alive'] = false
    data[ent]['is_target'] = false
    data[ent]['ducking'] = false
    data[ent]['unducking'] = false
    data[ent]['best_hitbox_pos'] = {}
    data[ent]['hitbox'] = ''
    data[ent]['damage'] = 0
    data[ent]['old_origin'] = vector(0, 0, 0)
    data[ent]['old_yaw'] = 60
    data[ent]['dif_origin'] = {}
    data[ent]['bone_diff'] = {
        [0] = { 1.9041290283203, -4.0820922851563, 39.17724609375 },
        [1] = { 0, 0, 0 },
        [2] = { 0, 0, 64 },
        [3] = { 1.8925170898438, -4.0455322265625, 40.114990234375 },
        [4] = { 1.3436737060547, -3.8780517578125, 44.040405273438 },
        [5] = { 0.45321655273438, -3.6017456054688, 48.686157226563 },
        [6] = { -1.6023406982422, -3.1251220703125, 54.697875976563 },
        [7] = { -3.9714813232422, -2.4916381835938, 60.04345703125 },
        [8] = { -8.9597473144531, -0.7755126953125, 63.571655273438 },
        [9] = { -6.2765502929688, -2.228515625, 57.263671875 },
        [10] = { -8.5975952148438, -8.45458984375, 56.73779296875 },
        [11] = { -17.047943115234, -9.926025390625, 48.933349609375 },
        [12] = { -26.831146240234, -4.3116455078125, 51.105346679688 },
        [13] = { -27.604125976563, -3.989990234375, 51.1533203125 },
        [14] = { -30.001541137695, -1.8004150390625, 50.808227539063 },
        [15] = { -30.75471496582, -0.6864013671875, 52.389404296875 },
        [16] = { -30.389694213867, -0.68341064453125, 53.7548828125 },
        [17] = { -26.667938232422, -3.1803588867188, 51.037963867188 },
        [18] = { -28.277465820313, -1.009033203125, 51.1435546875 },
        [19] = { -28.79621887207, -0.43841552734375, 52.443115234375 },
        [20] = { -28.721481323242, -0.5091552734375, 53.309692382813 },
        [21] = { -27.970016479492, -4.4664306640625, 51.469970703125 },
        [22] = { -30.700454711914, -2.654052734375, 51.17578125 },
        [23] = { -31.768188476563, -1.1522216796875, 51.942138671875 },
        [24] = { -31.430389404297, -1.1112060546875, 53.164672851563 },
        [25] = { -28.6337890625, -4.40576171875, 51.997436523438 },
        [26] = { -30.140960693359, -3.8662719726563, 52.566162109375 },
        [27] = { -31.669616699219, -3.79150390625, 52.899291992188 },
        [28] = { -27.141326904297, -3.5491333007813, 51.077758789063 },
        [29] = { -29.072830200195, -1.2791748046875, 50.8701171875 },
        [30] = { -29.837524414063, -0.41094970703125, 52.390991210938 },
        [31] = { -29.473205566406, -0.5369873046875, 53.6123046875 },
        [32] = { -28.744369506836, -2.2042236328125, 52.123413085938 },
        [33] = { -22.53225708008, -3.31103515625, 51.0311279297 },
        [34] = { -23.570098876953, -6.18310546875, 50.38134765625 },
        [35] = { -22.53225708008, -8.31103515625, 52.0311279297 },
        [36] = { -14.231170654297, -9.435546875, 51.534790039063 },
        [37] = { -4.9994812011719, -0.053466796875, 57.571899414063 },
        [38] = { -0.61593627929688, 4.0628662109375, 59.200805664063 },
        [39] = { -6.6939086914063, 8.2703857421875, 50.265625 },
        [40] = { -15.757949829102, 2.250244140625, 53.946899414063 },
        [41] = { -16.571441650391, 2.0519409179688, 53.992553710938 },
        [42] = { -19.651489257813, 1.6438598632813, 52.98876953125 },
        [43] = { -20.242111206055, -0.22247314453125, 52.29833984375 },
        [44] = { -19.145584106445, -0.91070556640625, 52.865478515625 },
        [45] = { -16.064498901367, 2.0748291015625, 52.857788085938 },
        [46] = { -18.344055175781, 1.5416870117188, 51.502807617188 },
        [47] = { -19.165008544922, 0.39569091796875, 50.958618164063 },
        [48] = { -18.610000610352, -0.21820068359375, 51.235473632813 },
        [49] = { -16.656585693359, 1.8163452148438, 54.623779296875 },
        [50] = { -19.867584228516, 1.3300170898438, 54.09521484375 },
        [51] = { -21.709594726563, 0.69183349609375, 53.66796875 },
        [52] = { -21.780090332031, -0.57373046875, 53.72900390625 },
        [53] = { -17.195907592773, 1.1532592773438, 54.7763671875 },
        [54] = { -18.280303955078, -0.1522216796875, 54.70068359375 },
        [55] = { -19.578857421875, -0.88427734375, 54.219848632813 },
        [56] = { -16.340087890625, 2.0719604492188, 53.392211914063 },
        [57] = { -19.005783081055, 1.56005859375, 52.143676757813 },
        [58] = { -19.783233642578, -0.0611572265625, 51.496459960938 },
        [59] = { -18.795486450195, -0.6041259765625, 52.1044921875 },
        [60] = { -18.115203857422, 0.59002685546875, 53.038452148438 },
        [61] = { -14.53225708008, -0.31103515625, 51.0311279297 },
        [62] = { -12.736618041992, 4.2569580078125, 52.719848632813 },
        [63] = { -10.53225708008, -0.31103515625, 53.0311279297 },
        [64] = { -4.6679077148438, 6.8678588867188, 53.244018554688 },
        [65] = { -0.88067626953125, -6.9180297851563, 35.584594726563 },
        [66] = { -10.017532348633, -10.058715820313, 20.512451171875 },
        [67] = { -9.3116302490234, -13.483825683594, 3.940185546875 },
        [68] = { -14.599166870117, -11.785217285156, 0.903564453125 },
        [69] = { -14.595626831055, -11.774597167969, 1.9034423828125 },
        [70] = { -3.9263000488281, -7.9649047851563, 30.560546875 },
        [71] = { -6.9719085693359, -9.0118408203125, 25.536499023438 },
        [72] = { 2.5196380615234, -0.36199951171875, 35.370971679688 },
        [73] = { 3.6542053222656, 6.342041015625, 18.809448242188 },
        [74] = { 11.520294189453, 3.5110473632813, 4.0792236328125 },
        [75] = { 9.7046203613281, 8.7596435546875, 1.042724609375 },
        [76] = { 9.7151336669922, 8.763427734375, 0.0428466796875 },
        [77] = { 2.8978271484375, 1.8726806640625, 29.850463867188 },
        [78] = { 3.2760162353516, 4.1073608398438, 24.329956054688 },
        [79] = { -28.708404541016, -0.55755615234375, 53.927001953125 },
        [80] = { -32.950561523438, -3.8135986328125, 53.087036132813 },
        [81] = { -18.086486816406, -0.03216552734375, 51.509155273438 },
        [82] = { -20.595764160156, -0.7064208984375, 53.438110351563 },
        [83] = { -22.514785766602, -1.3250122070313, 54.848266601563 },
        [84] = { -27.622665405273, -3.7006225585938, 51.09423828125 },
        [85] = { 7.2267761230469, -3.2958984375, 52.885620117188 },
        ['Head'] = { 4.5104370117188, 1.4808959960938, -66.252807617188 },
        ['Neck'] = { 1.6431274414063, 1.9418334960938, -60.824340820313 },
        ['Pelvis'] = { 0.0924072265625, 3.5492553710938, -35.892211914063 },
        ['Spine 4'] = { -0.2325439453125, 3.7332763671875, -40.685668945313 },
        ['Spine 3'] = { 0.37542724609375, 3.7618408203125, -47.163452148438 },
        ['Spine 2'] = { 0.27252197265625, 3.4548950195313, -52.815551757813 },
        ['Spine 1'] = { 0.13671875, 2.9594116210938, -57.254516601563 },
        ['Leg Upper L'] = { 7.5762329101563, 6.9656372070313, -27.895385742188 },
        ['Leg Upper R'] = { -1.1968383789063, -3.58837890625, -26.8837890625 },
        ['Leg Lower L'] = { 13.312927246094, 8.6845092773438, -12.410888671875 },
        ['Leg Lower R'] = { -4.8951416015625, -6.3407592773438, -11.160522460938 },
        ['Foot L'] = { 15.509704589844, 9.2199096679688, -0.3936767578125 },
        ['Foot R'] = { -8.0435180664063, -6.7333374023438, -0.314697265625 },
        ['Hand L'] = { 20.000915527344, 1.703125, -49.399291992188 },
        ['Hand R'] = { 19.825622558594, -1.3427734375, -50.221435546875 },
        ['Arm Upper L'] = { 6.341064453125, 9.3564453125, -53.569458007813 },
        ['Arm Lower L'] = { 13.943420410156, 6.078125, -49.270385742188 },
        ['Arm Upper R'] = { 4.067626953125, -6.1356201171875, -54.609130859375 },
        ['Arm Lower R'] = { 12.701782226563, -4.63525390625, -50.216918945313 },
    }
    data[ent]['hitbox_skeleton'] = { [0] = {}, [1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}, [6] = {}, [7] = {}, [8] = {}, [9] = {}, [10] = {}, [11] = {}, [12] = {}, [13] = {}, [14] = {}, [15] = {}, [16] = {}, [17] = {}, [18] = {} }
    data[ent]['removed_bones'] = {}
    data[ent]['hitscan_bones'] = { 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 26, 27, 30, 35, 37, 38, 39, 40, 42, 45, 46, 49, 50, 51, 53, 56, 57, 60, 62, 64, 70, 71, 77, 80, 81, 82, 85, 'Head', 'Neck', 'Pelvis', 'Spine 4', 'Spine 3', 'Spine 2', 'Spine 1', 'Leg Upper L', 'Leg Upper R', 'Leg Lower L', 'Leg Lower R', 'Foot L', 'Foot R', 'Hand L', 'Hand R', 'Arm Upper L', 'Arm Upper R', 'Arm Lower L', 'Arm Lower R' }
    data[ent]['baim_bones'] = { 6, 39, 5, 4, 3, 12, 37, 40, 11, 'Pelvis', 'Spine 4', 'Spine 3', 'Spine 2', 'Spine 1', 'Leg Upper L', 'Leg Upper R', }
    data[ent]['bones'] = { [0] = {}, [1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}, [6] = {}, [7] = {}, [8] = {}, [9] = {}, [10] = {}, [11] = {}, [12] = {}, [13] = {}, [14] = {}, [15] = {}, [16] = {}, [17] = {}, [18] = {}, [19] = {}, [20] = {}, [21] = {}, [22] = {}, [23] = {}, [24] = {}, [25] = {}, [26] = {}, [27] = {}, [28] = {}, [29] = {}, [30] = {}, [31] = {}, [32] = {}, [33] = {}, [34] = {}, [35] = {}, [36] = {}, [37] = {}, [38] = {}, [39] = {}, [40] = {}, [41] = {}, [42] = {}, [43] = {}, [44] = {}, [45] = {}, [46] = {}, [47] = {}, [48] = {}, [49] = {}, [50] = {}, [51] = {}, [52] = {}, [53] = {}, [54] = {}, [55] = {}, [56] = {}, [57] = {}, [58] = {}, [59] = {}, [60] = {}, [61] = {}, [62] = {}, [63] = {}, [64] = {}, [65] = {}, [66] = {}, [67] = {}, [68] = {}, [69] = {}, [70] = {}, [71] = {}, [72] = {}, [73] = {}, [74] = {}, [75] = {}, [76] = {}, [77] = {}, [78] = {}, [79] = {}, [80] = {}, [81] = {}, [82] = {}, [83] = {}, [84] = {}, [85] = {}, ['Head'] = {}, ['Neck'] = {}, ['Pelvis'] = {}, ['Spine 4'] = {}, ['Spine 3'] = {}, ['Spine 2'] = {}, ['Spine 1'] = {}, ['Leg Upper L'] = {}, ['Leg Upper R'] = {}, ['Leg Lower L'] = {}, ['Leg Lower R'] = {}, ['Foot L'] = {}, ['Foot R'] = {}, ['Hand L'] = {}, ['Hand R'] = {}, ['Arm Upper L'] = {}, ['Arm Upper R'] = {}, ['Arm Lower L'] = {}, ['Arm Lower R'] = {} }
    data[ent]['hitbox_pos'] = { [0] = {}, [1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}, [6] = {}, [7] = {}, [8] = {}, [9] = {}, [10] = {}, [11] = {}, [12] = {}, [13] = {}, [14] = {}, [15] = {}, [16] = {}, [17] = {}, [18] = {}, [19] = {}, [20] = {}, [21] = {}, [22] = {}, [23] = {}, [24] = {}, [25] = {}, [26] = {}, [27] = {}, [28] = {}, [29] = {}, [30] = {}, [31] = {}, [32] = {}, [33] = {}, [34] = {}, [35] = {}, [36] = {}, [37] = {}, [38] = {}, [39] = {}, [40] = {}, [41] = {}, [42] = {}, [43] = {}, [44] = {}, [45] = {}, [46] = {}, [47] = {}, [48] = {}, [49] = {}, [50] = {}, [51] = {}, [52] = {}, [53] = {}, [54] = {}, [55] = {}, [56] = {}, [57] = {}, [58] = {}, [59] = {}, [60] = {}, [61] = {}, [62] = {}, [63] = {}, [64] = {}, [65] = {}, [66] = {}, [67] = {}, [68] = {}, [69] = {}, [70] = {}, [71] = {}, [72] = {}, [73] = {}, [74] = {}, [75] = {}, [76] = {}, [77] = {}, [78] = {}, [79] = {}, [80] = {}, [81] = {}, [82] = {}, [83] = {}, [84] = {}, [85] = {}, ['Head'] = {}, ['Neck'] = {}, ['Pelvis'] = {}, ['Spine 4'] = {}, ['Spine 3'] = {}, ['Spine 2'] = {}, ['Spine 1'] = {}, ['Leg Upper L'] = {}, ['Leg Upper R'] = {}, ['Leg Lower L'] = {}, ['Leg Lower R'] = {}, ['Foot L'] = {}, ['Foot R'] = {}, ['Hand L'] = {}, ['Hand R'] = {}, ['Arm Upper L'] = {}, ['Arm Upper R'] = {}, ['Arm Lower L'] = {}, ['Arm Lower R'] = {} }
end

local function quick_stop(cmd)
    local velocity_prop = { entity.get_prop(entity.get_local_player(), "m_vecVelocity") }
    local velocity = math.sqrt(velocity_prop[1] * velocity_prop[1] + velocity_prop[2] * velocity_prop[2])
    local direction = { 0, 0, 0 }
    vector_to_angles(velocity_prop, direction)
    direction[2] = cmd.yaw - direction[2];

    local new_move = { 0, 0, 0 }
    angle_to_vector(direction, new_move);
    local max_move = math.max(math.abs(cmd.forwardmove), math.abs(cmd.sidemove))
    local multiplier = 450 / max_move
    new_move = { new_move[1] * -multiplier, new_move[2] * -multiplier, new_move[3] * -multiplier }

    cmd.forwardmove = new_move[1]
    cmd.sidemove = new_move[2]
end

local function get_dormant_players(enemy_only, alive_only)
    local local_player = entity.get_local_player()
    local enemy_only = enemy_only ~= nil and enemy_only or false
    local alive_only = alive_only ~= nil and alive_only or true
    local result = {}
    local player_resource = entity.get_player_resource()
    for player = 1, globals.maxplayers() do
        if entity.get_prop(player_resource, "m_bConnected", player) then
            local include = true
            if enemy_only and not entity.is_enemy(player) then
                include = false
            end
            if alive_only and not entity.is_alive(player) then
                include = false
            end
            if include and local_player ~= nil and entity.is_alive(local_player) then
                table.insert(result, player)
                if data[player] == nil then
                    reset_enemy_data(player)
                end
                data[player]['is_alive'] = entity.is_alive(player)
            end
        end
    end
    return result
end

local function clamp(x, min, max)
    return math.min(math.max(min, x), max)
end

local function is_crouching(ent)
    local duckamount = entity.get_prop(entity.get_local_player(), "m_flDuckAmount")
    if not data[ent]['ducking'] and duckamount >= 0.7 then
        data[ent]['ducking'] = true
    elseif data[ent]['ducking'] and duckamount <= 0.6 then
        data[ent]['ducking'] = false
    end
    return data[ent]['ducking']
end

--local useless_bones = {82, 28, 53, 52, 16, 17, 31, 32, 21, 20, 41, 46, 57, 29, 83, 50, 22, 54, 56, 27, 23, 51, 45, 43, 44, 15, 30, 59}
local cur_bone = 0
local aim_bones = {}

function dormant_aim.remove_bones(bone)
    data[cur_target]['removed_bones'][bone] = true
end

local function get_closest_dormant()
    local lx, ly, lz = client.eye_position()
    local view_x, view_y, roll = client.camera_angles()
    local bestenemy = nil
    local fov = 180

    for _, ent in pairs(dormant_players) do
        if not entity.is_alive(ent) then
            return
        end

        local hitscan = data[ent]['hitscan_bones']

        if get(ref.force_baim_key) or dormant_aim.baim then
            hitscan = data[ent]['baim_bones']
        end

        local eye_yaw = entity.get_prop(ent, "m_angEyeAngles[1]") or data[ent]['old_yaw']
        eye_yaw = eye_yaw or 0
        data[ent]['old_yaw'] = data[ent]['old_yaw'] or eye_yaw

        local ent_origin = vector(entity.get_origin(ent)) or data[ent]['old_origin']
        data[ent]['old_origin'] = data[ent]['old_origin'] or ent_origin

        local cur_fov = math.abs(normalize_yaw(calc_angle(lx - ent_origin.x, ly - ent_origin.y) - view_y + 180))
        if cur_fov < fov then
            fov = cur_fov
            bestenemy = ent
        end
        local is_dormant = entity.is_dormant(ent)
        local bone1 = GetBoneMatrix(ent, 1)
        for i, v in pairs(hitscan) do
            if data[ent]['removed_bones'][v] then
                data[ent]['hitbox_pos'][v] = nil
            else
                local bonematrix = type(v) == 'string' and vector(entity.hitbox_position(ent, hitboxes_text2num[v])) or GetBoneMatrix(ent, v)
                if data[ent]['old_origin'].x ~= ent_origin.x then
                    data[ent]['dif_origin'] = {
                        ent_origin.x - data[ent]['old_origin'].x,
                        ent_origin.y - data[ent]['old_origin'].y,
                        ent_origin.z - data[ent]['old_origin'].z
                    }
                else
                    data[ent]['dif_origin'] = {
                        ent_origin.x,
                        ent_origin.y,
                        ent_origin.z
                    }
                end
                data[ent]['bones'][v].x = data[ent]['bones'][v].x or static_bone_diff[v][1]
                data[ent]['bones'][v].y = data[ent]['bones'][v].y or static_bone_diff[v][2]
                data[ent]['bones'][v].z = data[ent]['bones'][v].z or static_bone_diff[v][3]
                if (bonematrix.x ~= nil and bonematrix.y ~= nil and bonematrix.z ~= nil) then
                    data[ent]['bones'][v] = vector(
                            bonematrix.x,
                            bonematrix.y,
                            bonematrix.z
                    )
                else
                    data[ent]['bones'][v] = vector(
                            data[ent]['bones'][v].x + data[ent]['dif_origin'][1],
                            data[ent]['bones'][v].y + data[ent]['dif_origin'][2],
                            data[ent]['bones'][v].z + data[ent]['dif_origin'][3]
                    )
                end
                data[ent]['bone_diff'][v] = vector(
                        clamp(data[ent]['bones'][v].x - ent_origin.x, -(math.abs(static_bone_diff[v][1])), (math.abs(static_bone_diff[v][1]))),
                        clamp(data[ent]['bones'][v].y - ent_origin.y, -(math.abs(static_bone_diff[v][2])), (math.abs(static_bone_diff[v][2]))),
                        clamp(data[ent]['bones'][v].z - ent_origin.z, 0, (math.abs(static_bone_diff[v][3])))
                )
                local bone_to_origin_diff = {
                    data[ent]['bone_diff'][v].x - data[ent]['dif_origin'][1] * -1,
                    data[ent]['bone_diff'][v].y - data[ent]['dif_origin'][2] * -1,
                    data[ent]['bone_diff'][v].z - data[ent]['dif_origin'][3] * -1,
                    is_dormant
                }
                data[ent]['hitbox_pos'][v] = bone_to_origin_diff
            end
        end
        data[ent]['old_origin'] = ent_origin
        data[ent]['old_yaw'] = eye_yaw
    end
    cur_target = bestenemy
end

local function get_damage()
    local local_player = entity.get_local_player()
    if local_player == nil then
        return
    end
    local weap_classname = entity.get_classname(entity.get_player_weapon(local_player))
    if weap_classname == "CKnife" or weap_classname == "CSmokeGrenade" or
            weap_classname == "CFlashbang" or weap_classname == "CHEGrenade" or
            weap_classname == "CDecoyGrenade" or weap_classname == "CIncendiaryGrenade" then
        return
    end

    get_closest_dormant()
    local ent = cur_target

    if not entity.is_alive(ent) then
        reset_enemy_data(ent)
        return
    end

    if not entity.is_alive(ent) then
        return
    end
    local eye_x, eye_y, eye_z = client.eye_position()
    local wall_dmg = 0
    local x, y, z = entity.get_origin(local_player)
    local best_hitbox_pos = {}
    local hitbox = -1
    local hitscan = data[ent]['hitscan_bones']

    if get(ref.force_baim_key) or dormant_aim.baim then
        hitscan = data[ent]['baim_bones']
    end

    for _, v in pairs(hitscan) do
        if data[ent]['hitbox_pos'][v] == nil then

        elseif data[ent]['hitbox_pos'][v][1] then
            local fraction, entindex = client.trace_line(ent, x, y, eye_z, data[ent]['hitbox_pos'][v][1], data[ent]['hitbox_pos'][v][2], data[ent]['hitbox_pos'][v][3])

            if fraction < 1 and data[ent]['hitbox_pos'][v][4] then
                local entindex_1, dmg = client.trace_bullet(local_player, x, y, eye_z, data[ent]['hitbox_pos'][v][1], data[ent]['hitbox_pos'][v][2], data[ent]['hitbox_pos'][v][3])
                if type(v) == 'string' then
                    dmg = client.scale_damage(ent, hitgroup_data[v], dmg)
                end
                if wall_dmg < dmg and dmg >= dormant_aim.dmg then
                    wall_dmg = dmg
                    best_hitbox_pos = { data[ent]['hitbox_pos'][v][1], data[ent]['hitbox_pos'][v][2], data[ent]['hitbox_pos'][v][3], ent }
                    cur_bone = v
                    hitbox = v
                end
            end
        end
    end

    data[ent]['best_hitbox_pos'] = best_hitbox_pos
    data[ent]['hitbox'] = hitbox
    data[ent]['damage'] = wall_dmg
end

local accuracy = 0

function dormant_aim.set_data(hitchance, dmg, autostop, baim, autoscope)
    dormant_aim.hitchance = hitchance
    dormant_aim.dmg = dmg
    dormant_aim.baim = baim
    dormant_aim.quickstop = autostop
    dormant_aim.autoscope = autoscope
end

local weapons = {
    [1] = "Desert Eagle",
    [2] = "Dual Berettas",
    [3] = "Five-SeveN",
    [4] = "Glock-18",
    [7] = "AK-47",
    [8] = "AUG",
    [9] = "AWP",
    [10] = "FAMAS",
    [11] = "G3SG1",
    [13] = "Galil AR",
    [14] = "M249",
    [16] = "M4A4",
    [17] = "MAC-10",
    [19] = "P90",
    [23] = "MP5-SD",
    [24] = "UMP-45",
    [25] = "XM1014",
    [26] = "PP-Bizon",
    [27] = "MAG-7",
    [28] = "Negev",
    [29] = "Sawed-Off",
    [30] = "Tec-9",
    [31] = "Taser",
    [32] = "P2000",
    [33] = "MP7",
    [34] = "MP9",
    [35] = "Nova",
    [36] = "P250",
    [38] = "SCAR-20",
    [39] = "SG 553",
    [40] = "SSG 08",
    [41] = "Knife",
    [42] = "Knife",
    [43] = "Flashbang",
    [44] = "HE Grenade",
    [45] = "Smoke",
    [46] = "Molotov",
    [47] = "Decoy",
    [48] = "Incendiary",
    [49] = "C4",
    [59] = "Knife",
    [60] = "M4A1-S",
    [61] = "USP-S",
    [63] = "CZ75-Auto",
    [64] = "R8 Revolver",
    [500] = "Bayonet",
    [505] = "Flip Knife",
    [506] = "Gut Knife",
    [507] = "Karambit",
    [508] = "M9 Bayonet",
    [509] = "Huntsman Knife",
    [512] = "Falchion Knife",
    [514] = "Bowie Knife",
    [515] = "Butterfly Knife",
    [516] = "Shadow Daggers",
    [519] = "Ursus Knife",
    [520] = "Navaja Knife",
    [522] = "Siletto Knife",
    [523] = "Talon Knife",
}

local fakeduck = ui.reference('RAGE', 'Other', 'Duck peek assist')
local function on_fakeduck()
    local m_flDuckAmount = entity.get_prop(entity.get_local_player(), "m_flDuckAmount")
    return ((not (m_flDuckAmount > 0.01) and ui.get(fakeduck)) or not ui.get(fakeduck))
end

local function can_scope()
    local active_wep = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
    local active_idx = entity.get_prop(active_wep, "m_iItemDefinitionIndex")
    return (
            (weapons[active_idx] == "SG 553") or
                    (weapons[active_idx] == "SSG 08") or
                    (weapons[active_idx] == "SCAR-20") or
                    (weapons[active_idx] == "G3SG1") or
                    (weapons[active_idx] == "AWP") or
                    (weapons[active_idx] == "AUG")
    )
end

local function can_shoot()
    local local_player = entity.get_local_player()
    local active_weapon = entity.get_prop(local_player, "m_hActiveWeapon")
    local nextAttack = get_prop(active_weapon, "m_flNextPrimaryAttack")
    local m_bIsScoped = entity.get_prop(local_player, "m_bIsScoped")

    return
    (
            (globals.curtime() >= nextAttack) and
                    (accuracy > clamp(95 + (dormant_aim.hitchance * 0.05), 0, 99)) and
                    ((dormant_aim.autoscope and m_bIsScoped == 1) or ((not dormant_aim.autoscope) or not can_scope()))
    )
end

dormant_aim.auto_scoped = false

local function on_scope(cmd)
    if not dormant_aim.autoscope or not can_scope() then
        return
    end
    local local_player = entity.get_local_player()
    local m_bIsScoped = entity.get_prop(local_player, "m_bIsScoped")
    --print(tostring(dormant_aim.autoscope)..' '..tostring(can_scope())..' '..m_bIsScoped..' '..tostring(dormant_aim.auto_scoped))
    if m_bIsScoped == 0 and not dormant_aim.auto_scoped then
        cmd.in_zoom = 1
        dormant_aim.auto_scoped = true
    elseif m_bIsScoped == 1 and dormant_aim.auto_scoped then
        dormant_aim.auto_scoped = false
    elseif dormant_aim.auto_scoped and m_bIsScoped == 0 then
        dormant_aim.auto_scoped = false
    end
end

local get_usercmd_t = ffi.typeof([[
    struct {
        void*   vtbl;
        int     command_number;
        int     tick_count;
    }* (__thiscall*)(void*, int, int)
]])

local g_Input_match = client.find_signature('client_panorama.dll', string.char(185, 204, 204, 204, 204, 139, 64, 56, 255, 208, 132, 192, 15, 133)) or error('Invalid g_Input signature')
local g_Input = ffi.cast('void**', ffi.cast('char*', g_Input_match) + 1)[0]
local get_usercmd = vtable_thunk(8, get_usercmd_t)

local get_fov = function(ray_dir, ray_start, ray_end)
    local delta = (ray_end - ray_start):normalized()
    local fov = math.acos(ray_dir:dot(delta) / delta:length())
    return math.deg(fov)
end

local backtracking_info_table = {}
local function backtrack(cmd)
    local usercmd = get_usercmd(g_Input, 0, cmd.command_number)
    local tickcount = globals.tickcount()
    local lp = entity.get_local_player()
    local lp_vel = vector(entity.get_prop(lp, 'm_vecVelocity'))
    local interval = globals.tickinterval()
    local max_ticks = math.floor(0.2 / interval)
    local eye_pos = vector(client.eye_position())
    local ray_start = eye_pos + lp_vel * interval
    local ray_dir = vector():init_from_angles(client.camera_angles())
    local enemies = entity.get_players(true);

    for _, ent in pairs(dormant_players) do
        local entindex = ent
        if entindex ~= lp then
            local hitbox_position_table = {}
            local hitbox_position = vector(data[entindex]['best_hitbox_pos'])
            local backtracking_info = {
                entindex = entindex,
                tickcount = tickcount,
                hitbox_position = hitbox_position
            }

            backtracking_info_table[#backtracking_info_table + 1] = backtracking_info
        end
    end

    local best_fov, best_tickcount = math.huge, nil

    for backtracking_info_table_key, backtracking_info in pairs(backtracking_info_table) do
        local tickcount_difference = tickcount - backtracking_info.tickcount
        if tickcount_difference >= max_ticks or backtracking_info.tickcount > tickcount or not entity.is_alive(backtracking_info.entindex) then
            backtracking_info_table[backtracking_info_table_key] = nil
        end

        local ray_end = backtracking_info.hitbox_position

        local fov = get_fov(ray_dir, ray_start, ray_end)
        if fov < best_fov then
            best_fov = fov
            best_tickcount = backtracking_info.tickcount
        end
    end

    if best_tickcount then
        usercmd.tick_count = best_tickcount
    end
end

function dormant_aim.on_run_command(cmd)
    if not dormant_aim.is_enabled then
        return
    end
    local local_player = entity.get_local_player()

    dormant_players = get_dormant_players(true, false)
    get_damage()

    local my_weapon = entity.get_player_weapon(local_player)
    local rawent = get_client_entity(iventitylist, my_weapon)
    local ent = ffi.cast(class_ptr, rawent)

    if (ent ~= nil) then
        local is_weapon = ffi.cast("is_weapon_t", ent[0][165])
        if (is_weapon(ent)) then
            local get_spread = ffi.cast("get_spread_t", ent[0][452])
            spread = get_spread(ent)
            local get_innaccuracy = ffi.cast("get_innaccuracy_t", ent[0][482])
            innaccuracy = get_innaccuracy(ent)
            accuracy = 100 - (innaccuracy + spread) * 100
        end
    end
end

local old_shot_id = 0
local cur_shotId = 0
dormant_aim.shot_fired = {}
function dormant_aim.add_shot(ent, target_pos)
    table.insert(dormant_aim.shot_fired, { ent, target_pos, hurt_check = false, shot_check = false, damage = nil, hitroup = nil, impact_pos = vector(0, 0, 0) })
end

function dormant_aim.check_shot(x, y, z)
    if dormant_aim.shot_fired[cur_shotId].shot_check then
        return
    end
    if dormant_aim.shot_fired[cur_shotId].hurt_check then
        dormant_aim.chat_print("[Dormant Aim] Hit shot at " .. entity.get_player_name(dormant_aim.shot_fired[cur_shotId][1]) .. " | Hitgroup: " .. dormant_aim.shot_fired[cur_shotId].hitgroup .. " | Bone: " .. cur_bone .. " | Damage: " .. dormant_aim.shot_fired[cur_shotId].damage)
        dormant_aim.log("[Dormant Aim] Hit shot at " .. entity.get_player_name(dormant_aim.shot_fired[cur_shotId][1]) .. " | Hitgroup: " .. dormant_aim.shot_fired[cur_shotId].hitgroup .. " | Bone: " .. cur_bone .. " | Target pos: x: " .. dormant_aim.shot_fired[cur_shotId][2].x .. " | y: " .. dormant_aim.shot_fired[cur_shotId][2].y .. " | z: " .. dormant_aim.shot_fired[cur_shotId][2].z .. ' Impact pos: x: ' .. x .. ' | y: ' .. y .. ' | z: ' .. z)
    else
        dormant_aim.chat_print("[Dormant Aim] Missed shot at " .. entity.get_player_name(dormant_aim.shot_fired[cur_shotId][1]) .. " | Bone: " .. cur_bone)
        dormant_aim.log("[Dormant Aim] Missed shot at " .. entity.get_player_name(dormant_aim.shot_fired[cur_shotId][1]) .. " | Bone: " .. cur_bone .. " | Target pos: x: " .. dormant_aim.shot_fired[cur_shotId][2].x .. " | y: " .. dormant_aim.shot_fired[cur_shotId][2].y .. " | z: " .. dormant_aim.shot_fired[cur_shotId][2].z .. ' Impact pos: x: ' .. x .. ' | y: ' .. y .. ' | z: ' .. z)
        dormant_aim.remove_bones(cur_bone)
    end
    dormant_aim.shot_fired[cur_shotId].shot_check = true
    dormant_aim.shot_fired[cur_shotId].impact_pos = vector(x, y, z)
    old_shot_id = cur_shotId
end

function dormant_aim.on_setup_command(cmd)
    if not dormant_aim.is_enabled then
        return
    end
    local local_player = entity.get_local_player()
    --backtrack(cmd)
    if cur_target and data[cur_target]['best_hitbox_pos'][1] then

        local weap_classname = entity.get_classname(entity.get_player_weapon(local_player))
        if weap_classname == "CKnife" or weap_classname == "CSmokeGrenade" or weap_classname == "CFlashbang" or weap_classname == "CHEGrenade" or weap_classname == "CDecoyGrenade" or weap_classname == "CIncendiaryGrenade" then
            return
        end

        local active_weapon = entity.get_prop(local_player, "m_hActiveWeapon")
        local nextAttack = get_prop(active_weapon, "m_flNextPrimaryAttack")
        local x, y, z = entity.get_origin(cur_target)
        local target_pos = { data[cur_target]['best_hitbox_pos'][1], data[cur_target]['best_hitbox_pos'][2], data[cur_target]['best_hitbox_pos'][3] }
        local pitch, yaw = vector_angles(target_pos[1], target_pos[2], target_pos[3])

        if dormant_aim.quickstop and ((cmd.forwardmove ~= 0 or cmd.sidemove ~= 0) and accuracy <= clamp(95 + (dormant_aim.hitchance + 15 * 0.05), 0, 99)) and (globals.curtime() >= nextAttack) then
            quick_stop(cmd)
        end

        on_scope(cmd)

        if can_shoot() then
            cur_shotId = #dormant_aim.shot_fired + 1
            dormant_aim.add_shot(cur_target, vector(target_pos[1], target_pos[2], target_pos[3]))
            cmd.pitch = pitch
            cmd.yaw = yaw
            cmd.in_attack = 1
        end
    end
end

local function on_noise(e)
    local player = client.userid_to_entindex(e.userid)
    if player ~= nil then
        get_damage()
    end
end
client.set_event_callback("player_footstep", on_noise)
client.set_event_callback("weapon_fire", on_noise)

local skeleton_hitboxes = {}

local function draw_line(pos1, pos2, r, g, b, a)
    if pos1 and pos2 then
        if pos1[1] and pos2[1] then
            renderer.line(pos1[1], pos1[2], pos2[1], pos2[2], r, g, b, a)
        end
    end
end

local function draw_skeleton(r, g, b, a)
    for _, v in pairs(hitboxes_num2text) do
        local p = data[cur_target]['hitbox_pos'][v]
        if p then
            if p[1] and p[2] and p[3] then
                skeleton_hitboxes[hitboxes_text2num[v] + 1] = skeleton_hitboxes[hitboxes_text2num[v] + 1] or {}
                skeleton_hitboxes[hitboxes_text2num[v] + 1] = { renderer.world_to_screen(p[1], p[2], p[3]) }
                --renderer.text(skeleton_hitboxes[i][1], skeleton_hitboxes[i][2], 240, 240, 240, 255, 'c', 0, hitboxes_num2text[i])
            end
        end
    end

    draw_line(skeleton_hitboxes[1], skeleton_hitboxes[2], r, g, b, a)
    draw_line(skeleton_hitboxes[2], skeleton_hitboxes[7], r, g, b, a)
    draw_line(skeleton_hitboxes[7], skeleton_hitboxes[18], r, g, b, a)
    draw_line(skeleton_hitboxes[7], skeleton_hitboxes[16], r, g, b, a)
    draw_line(skeleton_hitboxes[7], skeleton_hitboxes[5], r, g, b, a)
    draw_line(skeleton_hitboxes[5], skeleton_hitboxes[3], r, g, b, a)

    -- waist
    draw_line(skeleton_hitboxes[3], skeleton_hitboxes[8], r, g, b, a)
    draw_line(skeleton_hitboxes[3], skeleton_hitboxes[9], r, g, b, a)

    -- left leg
    draw_line(skeleton_hitboxes[8], skeleton_hitboxes[10], r, g, b, a)
    draw_line(skeleton_hitboxes[10], skeleton_hitboxes[12], r, g, b, a)

    -- right leg
    draw_line(skeleton_hitboxes[9], skeleton_hitboxes[11], r, g, b, a)
    draw_line(skeleton_hitboxes[11], skeleton_hitboxes[13], r, g, b, a)

    -- left arm
    draw_line(skeleton_hitboxes[18], skeleton_hitboxes[19], r, g, b, a)
    draw_line(skeleton_hitboxes[19], skeleton_hitboxes[15], r, g, b, a)

    -- right arm
    draw_line(skeleton_hitboxes[16], skeleton_hitboxes[17], r, g, b, a)
    draw_line(skeleton_hitboxes[17], skeleton_hitboxes[14], r, g, b, a)
end

function dormant_aim.on_paint()
    if not dormant_aim.is_enabled then
        return
    end
    for _, ent in pairs(dormant_players) do
        if not entity.is_alive(ent) then
            return
        end
        --[[for i=0, #data[ent]['hitbox_pos'] do
            if data[ent]['hitbox_pos'][i] then
                if data[ent]['hitbox_pos'][i][1] then
                    local bwx, bwy = world_to_screen(data[ent]['hitbox_pos'][i][1], data[ent]['hitbox_pos'][i][2], data[ent]['hitbox_pos'][i][3])
                    if bwx then
                        text(bwx, bwy, 245,245,245,190, "0", 999, i)
                        --text(bwx, bwy, 245,245,245,190, "b", 999, i..' '..math.floor(data[ent]['bone_diff'][i][1])..' '..math.floor(data[ent]['bone_diff'][i][2])..' '..math.floor(data[ent]['bone_diff'][i][3]))
                    end
                end
            end
        end]]
        local x, y, z = entity.get_origin(ent)

        if x == nil then
            return
        end
        data[ent]['origin'] = { x, y, z }
        local wx, wy = world_to_screen(x, y, z)
        if wx then
            local r, g, b, a = 255, 255, 255, 70
            if data[cur_target] ~= nil then
                if data[cur_target]['best_hitbox_pos'][1] ~= nil then
                    r, g, b, a = 255, 0, 0, 255
                    local wx2, wy2 = world_to_screen(data[cur_target]['best_hitbox_pos'][1], data[cur_target]['best_hitbox_pos'][2], data[cur_target]['best_hitbox_pos'][3] + 15)
                    drawCubeAtPoint(3, data[cur_target]['best_hitbox_pos'], r, g, b, a, a / 2)
                    draw_skeleton(200, 200, 200, 150)
                    text(wx2, wy2, r, g, b, a, "-", 999, data[ent]['damage'])
                    --text(wx2, wy2, r, g, b, a, "-", 999, bones[cur_bone].szName:gsub('_', ' '))
                end
            end
            --text(wx, wy, r, g, b, a, "-", 999, "Dormant")
        end
    end
end

client.set_event_callback('bullet_impact', function(e)
    local local_player = entity.get_local_player()
    local ent = client.userid_to_entindex(e.userid)
    if ent ~= local_player or cur_shotId == old_shot_id then
        return
    end
    client.delay_call(0.1, function()
        dormant_aim.check_shot(e.x, e.y, e.z)
    end)
end)

client.set_event_callback('player_hurt', function(e)
    local local_player = entity.get_local_player()
    local ent = client.userid_to_entindex(e.userid)
    local attacker = client.userid_to_entindex(e.attacker)
    if attacker ~= local_player then
        return
    end
    if cur_shotId == old_shot_id then
        return
    end
    dormant_aim.shot_fired[cur_shotId].hurt_check = true
    dormant_aim.shot_fired[cur_shotId].damage = e.dmg_health
    dormant_aim.shot_fired[cur_shotId].hitgroup = hitgroups[e.hitgroup]
end)

client.set_event_callback('player_death', function(e)
    local ent = client.userid_to_entindex(e.userid)
    if not entity.is_enemy(ent) then
        return
    end
    reset_enemy_data(ent)
end)

return dormant_aim