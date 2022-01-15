-- paste this at the top of the lua you want to connect to something else
o_req = require;
o_http = o_req("gamesense/http");
local http = {};
local PrintConnections = false;
local OldConnectionURL = "";
local NewConnectionURL = "";

-- new rewritten http funcs
http.get = function (url, options, callback)
 if (PrintConnections) then
  print(url);
 end

 -- thanks LA for helping me <3
 -- "redirect" the url
 if (url:find(OldConnectionURL)) then
  url = url:gsub(url, NewConnectionURL)
 end

 -- if the url is nil then it is an empty string, else it's the url
 url = url or "";

 -- return the old result
 return o_http.get(url, options, callback);
end

http.post = o_http.post
-- add more http functions here in case they are needed for your scripts


require = function (a)
 if (a == "gamesense/http") then
  return http;
 end

 return o_req(a);
end
