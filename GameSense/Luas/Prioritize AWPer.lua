local checkbox = ui.new_checkbox("MISC", "Miscellaneous", "Prioritize AWPer");

client.register_esp_flag("AWP", 255, 0, 0, function(_ent)
  if(entity.is_enemy(_ent) == false or ui.get(checkbox) == false) then
    return false;
  end

  local bool_Condition = entity.get_classname(entity.get_player_weapon(_ent)) == "CWeaponAWP" and true or false

  if(plist.get(_ent, "High priority") ~= bool_Condition) then
    plist.set(_ent, "High priority", bool_Condition);
  end

  return bool_Condition;
end)
