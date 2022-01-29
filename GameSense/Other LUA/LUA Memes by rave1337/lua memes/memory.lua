local ffi = require("ffi")
ffi.cdef[[
	struct mem {
		unsigned char x[262144];
	};
	typedef int(__thiscall* write_file_t)(void*, void const*, int, void*);
	typedef void*(__thiscall* open_file_t)(void*, const char*, const char*, const char*);
	typedef void(__thiscall* close_file_t)(void*, void*);
]]

local class_ptr = ffi.typeof("void***")
local rawfilesystem = client.create_interface("filesystem_stdio.dll", "VBaseFileSystem011") or error("error", 2)
local filesystem = ffi.cast(class_ptr, rawfilesystem) or error("error", 2)
local write_file = ffi.cast("write_file_t", filesystem[0][1]) or error("error", 2)
local open_file = ffi.cast("open_file_t", filesystem[0][2]) or error("error", 2)
local close_file = ffi.cast("close_file_t", filesystem[0][3]) or error("error", 2)

local i = 0
client.set_event_callback("paint_ui", function()
	local file = open_file(filesystem, "abc.dat", "ab", "MOD")
	local size = 262144
	local mem = ffi.cast("struct mem&", 0x400000 + size * i)
	write_file(filesystem, ffi.string(mem.x), size, file)
	size = nil
	mem = nil
	close_file(filesystem, file)
	file = nil
	i = i + 1
end)