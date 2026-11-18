-- Threat: !InfrastructureShared
-- Name: 3e78ad3661c3
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 2048000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil and l_0_1.OriginalFilename ~= nil and l_0_1.OriginalFilename:lower() == "sync.exe" and l_0_1.InternalName ~= nil and l_0_1.InternalName:lower() == "sync.exe" and l_0_1.ProductVersion ~= nil and l_0_1.ProductVersion:lower() == "0.0.0.0" then
  return mp.INFECTED
end
return mp.CLEAN
