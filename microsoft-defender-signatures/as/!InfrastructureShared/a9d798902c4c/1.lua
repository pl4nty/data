-- Threat: !InfrastructureShared
-- Name: a9d798902c4c
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if #l_0_1 < 35 or 350 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil then
  if l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
    return mp.INFECTED
  end
  local l_0_3 = mp.GetParentProcInfo(l_0_2.ppid)
  if l_0_3 ~= nil and l_0_3.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_3.ppid, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
