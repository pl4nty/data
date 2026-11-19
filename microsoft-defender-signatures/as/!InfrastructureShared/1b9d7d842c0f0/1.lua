-- Threat: !InfrastructureShared
-- Name: 1b9d7d842c0f0
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) then
  local l_0_1 = string.lower(string.sub(l_0_0.image_path, -11))
  if l_0_1 ~= "svchost.exe" then
    return mp.CLEAN
  end
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = GetRollingQueueKeyValues("gpo_schtasks", l_0_3)
if l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
