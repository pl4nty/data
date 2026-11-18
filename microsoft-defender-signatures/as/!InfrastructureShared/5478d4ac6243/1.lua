-- Threat: !InfrastructureShared
-- Name: 5478d4ac6243
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0.OriginalFilename ~= nil and l_0_0.OriginalFilename:lower() == "schedctl.dll" then
  return mp.INFECTED
end
return mp.CLEAN
