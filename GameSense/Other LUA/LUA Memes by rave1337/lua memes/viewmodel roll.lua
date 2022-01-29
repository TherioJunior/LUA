local ffi = require("ffi")
local bit = require("bit")
ffi.cdef[[
    typedef struct  {
        float x;
        float y;
        float z;
    } vec3_t;

    typedef void*(__thiscall* get_client_entity_t)(void*, int);
    typedef void(__thiscall* set_angles)(void*, const vec3_t&);
]]

local classptr = ffi.typeof("void***")
local rawientitylist = client.create_interface("client_panorama.dll", "VClientEntityList003") or error("VClientEntityList003 wasn't found", 2)
local ientitylist = ffi.cast(classptr, rawientitylist) or error("rawientitylist is nil", 2)
local get_client_entity = ffi.cast("get_client_entity_t", ientitylist[0][3]) or error("get_client_entity is nil", 2)
local match = client.find_signature("client_panorama.dll", "\x55\x8B\xEC\x83\xE4\xF8\x83\xEC\x64\x53\x56\x57\x8B\xF1") or error("Couldn't find signature!")
local set_angles = ffi.cast("set_angles", match) or error("Failed to cast")

local enable = ui.new_checkbox("LUA", "B", "Enable viewmodel override")
local combobox = ui.new_combobox("LUA", "B", "Viewmodel override", { "Gangster", "Spin", "Jitter", "Quake", "Custom" })
local slider = ui.new_slider("LUA", "B", "Custom viewmodel value", -180, 180, 0)
local slider2 = ui.new_slider("LUA", "B", "Quake smoothing", 1, 25, 15)

ui.set_visible(slider, false)
ui.set_visible(slider2, false)

local function angle_vectors_right(angles)
    local sr, sp, sy, cr, cp, cy
    sy = math.sin(math.rad(angles[1]))
    cy = math.cos(math.rad(angles[1]))
    sp = math.sin(math.rad(angles[2]))
    cp = math.cos(math.rad(angles[2]))
    sr = math.sin(math.rad(angles[3]))
    cr = math.cos(math.rad(angles[3]))

    return { -1*sr*sp*cy+-1*cr*-sy, -1*sr*sp*sy+-1*cr*cy, -1*sr*cp }
end

local function angle_mod(angle)
    return ((360/65536)*(bit.band(angle *(65536 / 360), 65535)))
end

local next_angle = 0
local function approach_angle(target, value, speed)
    target = angle_mod(target)
    value = angle_mod(value)

    local delta = target - value

    if speed < 0 then
        speed = -speed
    end

    if delta < -180 then
        delta = delta + 360
    elseif delta > 180 then
        delta = delta - 360
    end

    if delta > speed then
        value = value + speed
    elseif delta < -speed then
        value = value - speed
    else
        value = target
        next_angle = client.random_int(-45, 45)
    end

    return value
end

local last_angle = 0
client.set_event_callback("override_view", function()
    ui.set_visible(slider, false)
    ui.set_visible(slider2, false)
    if ui.get(enable) then
        local lp = entity.get_local_player()
        if lp then
            local viewmodel = entity.get_prop(lp, "m_hViewModel[0]")
            if viewmodel then
                local viewmodel_ent = get_client_entity(ientitylist, viewmodel)
                if viewmodel_ent then
                    local camera_angles = { client.camera_angles() }
                    local angles = ffi.cast("vec3_t*", ffi.new("char[?]", ffi.sizeof("vec3_t")))
                    angles.x = camera_angles[1]
                    angles.y = camera_angles[2]

                    local state = ui.get(combobox)
                    if state == "Gangster" then
                        angles.z = -90
                    elseif state == "Spin" then
                        angles.z = math.fmod(globals.curtime()*360, 360)
                    elseif state == "Jitter" then
                        last_angle = approach_angle(next_angle, last_angle, 5)
                        angles.z = last_angle
                    elseif state == "Quake" then
                        local right = angle_vectors_right(camera_angles)
                        local velocity = { entity.get_prop(lp, "m_vecVelocity") }
                        local side = velocity[1]*right[1]+velocity[2]*right[2]+velocity[3]*right[3]
                        local sign = side < 0 and 1 or -1
                        side = math.abs(side)
                        local value = 300
                        if side < value then
                            side = side * value / (value*ui.get(slider2))
                        else
                            side = value
                        end
                        angles.z = side*sign
                        ui.set_visible(slider2, true)
                    elseif state == "Custom" then
                        angles.z = ui.get(slider)
                        ui.set_visible(slider, true)
                    end
                    set_angles(viewmodel_ent, angles)
                end
            end
        end
    end
end)