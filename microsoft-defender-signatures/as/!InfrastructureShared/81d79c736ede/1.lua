-- Threat: !InfrastructureShared
-- Name: 81d79c736ede
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "services.exe" and GetRollingQueue("SuspADSyncAccessByPid4") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
