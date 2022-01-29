local ffi = require("ffi")
ffi.cdef[[
	typedef bool(__thiscall* GetRegistryString)(void*, const char*, char*, int);
	typedef int(__cdecl* Wrapper)(int**, void***, const char*, char*, int);
]]
local sig = client.find_signature("vgui2.dll", "\xB9\xCC\xCC\xCC\xCC\x68\xCC\xCC\xCC\xCC\x89\x75\xF8") or error("Failed to find signature!")
local rawsystem010 = ffi.cast("uintptr_t*", ffi.cast("uintptr_t", sig) + 1)[0]
local system010 = ffi.cast("void***", rawsystem010)
local GetRegistryString = ffi.cast("GetRegistryString", system010[0][13])

local cast_sig = client.find_signature("steam_api.dll", "\x55\x8B\xEC\xFF\x75\x18\x8B\x4D\x08\xFF\x75\x14\xFF\x75\x10\x8B\x01\xFF\x75\x0C\xFF\x50\x38") or error("Failed to find cast signature!")
local cast_ptr = ffi.new("int[15][1]")
cast_ptr[14][0] = ffi.cast("int", system010[0][13])

local GetRegistryString_Wrapper = ffi.cast("Wrapper", cast_sig)

local ptr = ffi.new("char[256]")
print(GetRegistryString_Wrapper(ffi.cast("int**", cast_ptr), system010, "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SystemInformation\\ComputerHardwareId", ptr, ffi.sizeof(ptr)))