--| Usage Tutorial:
--| Step 1: Paste this at the top of the LUA you want to redirect a Connection in
--| Step 2: Change "OldURL" and "NewURL" (quite self explaining what you should pass in what)

--| Backing up panorama.loadstring
o_pano_loadstring = panorama.loadstring;

--| Creating new variables
local DumpConnections = false;
local OldURL = "";
local NewURL = "";

--| Creating a function to redirect/spoof the connection URL
local function Spoof (str)
 if (str:find(OldURL)) then
  return str:gsub(str, NewURL);
 end

 --| this is what the function returns by default if above written check doesn't kick in
 return str;
end

--| hooking panorama.loadstring
panorama.loadstring = function(str)
 if (DumpConnections == true) then
  print(str);
 end

 str = Spoof (str);

 return o_pano_loadstring (str);
end
