local References = {
     ForceThirdPersonAlive = { ui.reference("VISUALS", "Effects", "Force Third person (alive)") },
     ForceThirdPersonDead = ui.reference("VISUALS", "Effects", "Force Third person (dead)")
}


function OnPaint()
     --- function returns
     if(entity.is_alive(entity.get_local_player())) then
          return false;
     end

     if(ui.get(References.ForceThirdPersonAlive[1]) ~= true) then
          return false;
     end

     --- local function vars
     local bool_ThirdpersonState = false

     if(ui.get(References.ForceThirdPersonAlive[2])) then
          if(bool_ThirdpersonState ~= true) then
               bool_ThirdpersonState = true
          end
     else
          if(bool_ThirdpersonState ~= false) then
               bool_ThirdpersonState = false
          end
     end

     if(ui.get(References.ForceThirdPersonDead) ~= bool_ThirdpersonState) then
          ui.set(References.ForceThirdPersonDead, bool_ThirdpersonState)
     end
end
client.set_event_callback("paint_ui", OnPaint)