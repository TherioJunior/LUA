local filesystemDll = "filesystem_stdio.dll"
local filesystem = "VFileSystem017"
o_create_interface = client.find_signature

_G["client"]["find_signature"] = function(dll, sig)
    if(string.lower(dll) == string.lower(filesystemDll)) then
        return error("WARNING: Someone tried to rat you and steal your scripts.", 2)
    end

    if(string.lower(sig) == string.lower(filesystem)) then
        return error("WARNING: Someone tried to rat you and steal your scripts.", 2)
    end

    return o_create_interface(dll, sig)
end