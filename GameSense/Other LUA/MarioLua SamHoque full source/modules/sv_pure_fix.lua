local a, b, c, d, e, error, f = client.create_interface, client.set_event_callback, entity.get_local_player, ui.new_checkbox, ui.reference, error, ui.set;
local g = require "ffi"
local h, i = client.delay_call, ui.get;
local j = {}
local k = e("MISC", "Miscellaneous", "Disable sv_pure")
local l = g.cast("int*", a("filesystem_stdio.dll", "VFileSystem017") or error("VFileSystem017 not found"))
local m = false;
function j.on_paint_ui()
    if c() == nil and not m then
        m = true;
        f(k, false)
        h(1, function()
            f(k, true)
            set_files_is_checked_porperly()
        end)
    elseif m and c() ~= nil then
        m = false
    end
end;
function set_files_is_checked_porperly()
    l[56] = 1;
    h(0.04, set_files_is_checked_porperly)
end;
return j