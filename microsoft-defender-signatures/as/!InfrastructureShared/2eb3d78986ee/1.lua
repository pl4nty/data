-- Threat: !InfrastructureShared
-- Name: 2eb3d78986ee
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.lower(string.sub(l_0_0, -31)) ~= "altaro.services.backupagent.exe" and string.lower(string.sub(l_0_0, -20)) ~= "coreserviceshell.exe" then
  return mp.INFECTED
end
return mp.CLEAN
