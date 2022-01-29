local a = entity.get_local_player()
local b = { client.screen_size() }
local c, d = b[1] / 2, b[2] / 2;
local e = {}
local f = { 255, 255, 255, 255 }
local g, h, i, j = 0, 0, 0, 0;
local function k(l)
    l = (l % 360 + 360) % 360;
    return l > 180 and l - 360 or l
end;
function e.on_setup_command(m)
    if m.chokedcommands == 0 then
        g = m.yaw
    elseif m.chokedcommands == 1 then
        h = m.yaw - g
    end
end;
function e.on_run_command()
    a = entity.get_local_player()
    camera = { client.camera_angles() }
    _, i = entity.get_prop(a, 'm_angAbsRotation')
    h = h < 1 and h > 0.0001 and math.floor(h, 1) or h;
    if camera[2] ~= nil and i ~= nil and 60 < math.floor(math.abs(k(camera[2] - (i + h)))) then
        h = h * -1
    end ;
    f = { 0, 102, 255, 255 }
    j = math.floor(k(camera[2] - i - 120 + h))
end;
function e.on_render()
    if not entity.is_alive(a) then
        return
    end ;
    renderer.circle_outline(c, d, f[1], f[2], f[3], f[4], 180, 20 + j, 0.05, 10)
end;
return e