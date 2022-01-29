local chk = ui.new_checkbox("LUA", "B", "Name spam")
local btn = ui.new_button("LUA", "B", "Change name", function()
	--cvar.name:set_string("\x81 ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽﷽﷽ ﷽") -- this clears chat
	cvar.name:set_string("\x81 gamesense.pub")
end)
local btn2 = ui.new_button("LUA", "B", "Infinite name spam", function()
	cvar.name:set_string("\n\x81")
end)

local bflip = false
client.set_event_callback("paint", function(c)
	if ui.get(chk) then
		cvar.voice_loopback:set_int(bflip and 1 or 0)
		bflip = not bflip
	end
end)