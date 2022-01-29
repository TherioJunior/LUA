local check = ui.new_checkbox("AA", "Anti-aimbot angles", "Leg freezer 6000")
local key = ui.new_hotkey("AA", "Anti-aimbot angles", "Leg freezer 6000", true)
local combo = ui.new_combobox("AA", "Anti-aimbot angles", "Leg freezer 6000", { "Default", "Jitter", "Manual" })
local randomize = ui.new_checkbox("AA", "Anti-aimbot angles", "Randomize leg movement")
local yaw_base, yaw_slider = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local body_base, body_slider = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local lby_target = ui.reference("AA", "Anti-aimbot angles", "Lower body yaw target")
local limit_ref = ui.reference("AA", "Fake lag", "Limit")
local on_shot = ui.reference("AA", "Other", "On shot anti-aim")
local aa_limit_ref = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")

local state = false
client.set_event_callback("setup_command", function(c)
    if ui.get(check) then
        -- setup
        c.allow_send_packet = false
        local mode = ui.get(combo)
        local limit = ui.get(limit_ref)
        ui.set(limit_ref, (ui.get(on_shot) and math.min(limit, 5) or limit))
        ui.set(body_base, "Static")
        ui.set(body_slider, 0)
        ui.set(lby_target, "Eye yaw")
        ui.set(yaw_base, "180")
        --ui.set(aa_limit_ref, 0)
        if mode == "Default" then
            state = false
        elseif mode == "Manual" then
            state = ui.get(key)
        end
        
        -- main stuff
        if c.chokedcommands == limit then
            ui.set(yaw_slider, 0)
            if mode == "Jitter" then
                state = not state
            end
        elseif c.chokedcommands == limit-1 then
            ui.set(yaw_slider, (state and 120 or -120))
        else
            if ui.get(randomize) then
                ui.set(yaw_slider, math.random(-180, 180))
            else
                ui.set(yaw_slider, (state and -120 or 120))
            end
        end
    end
end)

client.set_event_callback("paint", function()
    if ui.get(combo) == "Manual" then
        local screen = { client.screen_size() }
        screen = { screen[1]/2, screen[2]/2 }
        
        if ui.get(key) then
            renderer.text(screen[1]+40, screen[2], 124, 195, 13, 255, "c+", 0, ">")
            renderer.text(screen[1]-40, screen[2], 255, 255, 255, 75, "c+", 0, "<")
        else
            renderer.text(screen[1]+40, screen[2], 255, 255, 255, 75, "c+", 0, ">")
            renderer.text(screen[1]-40, screen[2], 124, 195, 13, 255, "c+", 0, "<")
        end
    end
end)