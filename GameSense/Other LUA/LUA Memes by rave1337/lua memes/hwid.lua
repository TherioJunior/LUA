local ffi = require("ffi")

ffi.cdef[[
    enum module_status_t {
        FOUND = 0,
        UNK = 1,
        NO_PROC_ADDRESS = 2,
        NO_MODULE_HANDLE = 3
    };

    struct module_t{
        enum module_status_t status;
        int proc_address;
        void* module;
        bool unk3;
        int unk4;
    } ;

    typedef struct module_t*(__thiscall* get_module_handle_proc_address_t)(struct module_t*, const char*, const char*);
	typedef bool(__stdcall* GetVolumeInformationA)(const char* lpRootPathName, char* lpVolumeNameBuffer, unsigned long nVolumeNameSize, unsigned long* lpVolumeSerialNumber, unsigned long* lpMaximumComponentLength, unsigned long* lpFileSystemFlags, char* lpFileSystemNameBuffer, unsigned long nFileSystemNameSize);
]]

local raw = client.find_signature("tier0.dll", "\xE8\xCC\xCC\xCC\xCC\x83\x7C\x24\xCC\xCC") or error("didnt find signature")
local get_module_handle_proc_address = ffi.cast("get_module_handle_proc_address_t", raw) or error("couldnt cast signature")

local get_volume_information_struct = ffi.new("struct module_t[1]")
get_module_handle_proc_address(get_volume_information_struct, "kernel32.dll", "GetVolumeInformationA")
local get_volume_information = ffi.cast("GetVolumeInformationA", get_volume_information_struct[0].proc_address)
local serial = ffi.new("unsigned long[1]")

local drive = "C:\\"
print(string.format("Getting HWID of drive %s...", drive))
local res = get_volume_information(drive, nil, 0, serial, nil, nil, nil, 0)
print(string.format("GetVolumeInformationA returned %s, %i", res and "true" or "false", serial[0]))