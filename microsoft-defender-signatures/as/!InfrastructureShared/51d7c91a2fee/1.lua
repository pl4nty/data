-- Threat: !InfrastructureShared
-- Name: 51d7c91a2fee
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "miiserver.exe" then
    AppendToRollingQueue("TamperAdSyncSvc", "true", 1, 1800)
    return mp.INFECTED
  end
end
return mp.CLEAN
