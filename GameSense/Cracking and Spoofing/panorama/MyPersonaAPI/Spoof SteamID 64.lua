--| Usage Tutorial:
--| Step 1: Paste this at the top of the script you want to have your SteamID 64 spoofed in
--| Step 2: Change "YourDesiredSteam64" into any number you want

--| Backup the old Panorama API
local o_js = panorama.open ();

--| Create new variables
local YourDesiredSteam64 = 0;

--| Overwrite only the API call that gives you the Steamid 64
o_js.MyPersonaAPI.GetXuid = function ()
 return YourDesiredSteam64
end
