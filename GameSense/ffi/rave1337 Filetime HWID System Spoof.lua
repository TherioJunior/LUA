--| thanks LA for helping me
--| Usage Tutorial:
--| Step 1: paste this code at the top of a lua which uses rave's filetime HWID System
--| Step 2: change the "YourDesiredFiletime" variable to any number you want

--| backing up old calls we'll need later
local o_req = require;
local o_ffi = o_req("ffi");
local o_ffi_cast = o_ffi.cast;

--| creating new variables
local YourDesiredFiletime = 999;

--| using rave's code to create the filesystem in order to make a better check
local class_ptr = o_ffi.typeof("void***")
local rawfilesystem = client.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")
local filesystem = o_ffi_cast(class_ptr, rawfilesystem)

--| hooking require
require = function (module)
 --| checking if the required module is ffi
 if (module == "ffi") then
  local FakeModule = o_ffi;

  --| hooking ffi.cast to make it return a specific value in a specific condition
  FakeModule.cast = function(name, ...)
   --| checking if the used argument is something used in rave's original example
   if (... == filesystem[0][13]) then
    return function (...)
     return YourDesiredFiletime;
    end
   end

   --| this value is what ffi.cast will return by default
   return o_ffi_cast(name, ...);
  end

  --| default return value if this if statement kicks in
  return FakeModule;
 end

 --| this value is what require will return by default
 return o_req(module);
end
