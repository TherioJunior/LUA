local checkbox = ui.new_checkbox("LUA", "B", "Enable server crasher")
local hotkey = ui.new_hotkey("LUA", "B", "Enable server crasher", true)

local ffi = require("ffi")
ffi.cdef[[
    typedef void*(__thiscall* getnetchannel_t)(void*); //78
    typedef const char*(__thiscall* getaddress_t)(void*); //1
	typedef bool(__thiscall* istimingout_t)(void*); //7
]]

local engineclient = ffi.cast(ffi.typeof("void***"), client.create_interface("engine.dll", "VEngineClient014"))
local getnetchannel = ffi.cast("getnetchannel_t", engineclient[0][78])

function get_address()
    local netchannel = ffi.cast(ffi.typeof("void***"), getnetchannel(engineclient))
    local getaddress = ffi.cast("getaddress_t", netchannel[0][1])
    return ffi.string(getaddress(netchannel))
end

function is_timing_out()
    local netchannel = ffi.cast(ffi.typeof("void***"), getnetchannel(engineclient))
    local istimingout = ffi.cast("istimingout_t", netchannel[0][7])
    return istimingout(netchannel)
end

function add_to_list(ip_str)
	local raw_ip, _ = string.match(ip_str, "[^:]+")
	client.exec(string.format("addip %i %s", client.random_int(2, 10), raw_ip))
end

local is_crashing = false
client.set_event_callback("setup_command", function()
	if ui.get(checkbox) and ui.get(hotkey) and not ui.is_menu_open() then
		local addy = get_address()
		if addy ~= "loopback" then
			if not is_crashing then
				is_crashing = true
				client.color_log(0, 255, 0, "[CRASHER] Attempting to crash server...")
				client.delay_call(math.random(1, 5), add_to_list, addy)
			end
		else
			client.color_log(255, 0, 0, "[CRASHER] THIS FEATURE DOES NOT WORK ON LOCAL SERVERS!")
		end
	elseif not ui.get(hotkey) then
		is_crashing = false
	end
end)

client.set_event_callback("paint", function()
	if is_timing_out() then
		renderer.indicator(255, 0, 0, 255, "TIMING OUT!")
	end
end)

client.set_event_callback("console_input", function(c)
	if string.match(c, "removeip") then
		client.color_log(0, 255, 255, "GREETZ TO:\navarita, bobby, pimp, nmchris, and puppy\ndeveloped with joke intent")
		return true
	end
end)